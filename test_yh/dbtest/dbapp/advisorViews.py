from django.shortcuts import render, redirect
from django.db import connection
from .models import Course, Student, Advice, Advisor, Adds, Drops, Requests, Decline, Approve, SendMsg
from datetime import date
import logging
from django.urls import reverse
from django.http import HttpResponseRedirect
from django.contrib import messages

def advisorHome(request, adid):
    sql = """select rid, courseid, nuid, dates, type, status from requests where nuid in (select s_id from advice where advid = """ + adid + """) order by dates"""
    cursor = connection.cursor()
    cursor.execute(sql)
    requests = cursor.fetchall()
    context = {
        "adid": adid,
        "requests": requests,
    }
    return render(request, 'advisorHome.html', context)

def approveRequest(request, adid, request_id):
    sql = """update requests set status = 'approved' where rid = """ + request_id + """"""
    cursor = connection.cursor()
    cursor.execute(sql)
    return redirect('/advisorHome/' + adid)

def disapproveRequest(request, adid, request_id):
    sql = """update requests set status = 'disapproved' where rid = """ + request_id + """"""
    cursor = connection.cursor()
    cursor.execute(sql)
    return redirect('/advisorHome/' + adid)

def allStudents(request, adid):
    if request.method == 'GET':
        sql = """select s.nuid, concat(s.fname,' ',s.lname) as name, s.email, d.deptId, d.deptName from student as s join department as d on 
        s.dno = d.deptId where nuid in (select s_id from advice where advid = """ + adid + """)"""
        cursor = connection.cursor()
        cursor.execute(sql)
        students = cursor.fetchall()
        context = {
            "adid": adid,
            "students": students,
        }
        return render(request, 'allStudents.html', context)

def viewDetails(request, adid, sid):
    sql = """select course_no, course_name, credit, sectionid, professor, class_time, days, building, room from course where 
    courseid in (select courseid from adds where nuid = """ + sid + """) and courseid not in (select courseid from drops where nuid = """ + sid + """)"""
    cursor = connection.cursor()
    cursor.execute(sql)
    courses = cursor.fetchall()
    context = {
        "adid": adid,
        "sid": sid,
        "courses": courses,
    }
    return render(request, 'viewDetails.html', context)

def sendMsg(request, adid, sid):
    if request.method == "POST":
        msg = request.POST.get("message")
        dates = str(date.today())
        logger = logging.getLogger('django')
        try:
            sql = """insert into send_msg (s_id, advid, dates, messages, status) values (""" + sid + """, """ + adid + """, '""" + dates + """', '""" + msg + """', 'unread')"""
            cursor = connection.cursor()
            cursor.execute(sql)
            messages.success(request, "Successfully sent message")
            return redirect('/allStudents/' + adid)
        except Exception as e:
            logger.error(e)
            messages.error(request, "Failed to send message")
            return render(request, 'sendMessage.html', {})
    else:
        return render(request, 'sendMessage.html', {})

def replyMsg(request, adid, sid, ntid):
    if request.method == "POST":
        msg = request.POST.get("message")
        dates = str(date.today())
        logger = logging.getLogger('django')
        try:
            sql1 = """update send_msg set status = 'replied' where ntid = """ + ntid + """"""
            cursor = connection.cursor()
            cursor.execute(sql1)
            sql = """insert into send_msg (s_id, advid, dates, messages, status) values (""" + sid + """, """ + adid + """, '""" + dates + """', '""" + msg + """', 'sent')"""
            cursor = connection.cursor()
            cursor.execute(sql)
            messages.success(request, "Successfully sent message")
            return redirect('/viewMessages/' + adid)
        except Exception as e:
            logger.error(e)
            messages.error(request, "Failed to send message")
            return render(request, 'sendMessage.html', {})
    else:
        return render(request, 'sendMessage.html', {})

def viewMessages(request, adid):
    sql = """select s.nuid, concat(s.fname,' ',s.lname) as name, m.dates, m.messages, m.status, m.ntid from send_msg as m join student as s on s.nuid = m.s_id where s.nuid in (select s_id from advice where advid = """ + adid + """) order by m.dates"""
    cursor = connection.cursor()
    cursor.execute(sql)
    messages = cursor.fetchall()
    context = {
        "adid": adid,
        "messages": messages,
    }
    return render(request, 'viewMessages.html', context)

def advisorProfile(request, adid):
    sql = """select a.nuid, a.fname, a.lname, a.email, a.passwords, a.dno from advisor as a join department as d on a.dno = d.deptid where a.nuid = """ + adid
    cursor = connection.cursor()
    cursor.execute(sql)
    result = cursor.fetchone()
    context = {
        "adid": adid,
        "result": result,
    }
    return render(request, 'advisorProfile.html', context)

def editAdvisorPro(request, adid):
    if request.method != 'POST':
        return redirect('/advisorProfile/' + adid)
    else:
        fname=request.POST.get('fname')
        lname = request.POST.get('lname')
        password = request.POST.get('password')
        try:
            if password != None and password != "":
                sql = """update advisor set fname = '""" + fname + """', lname = '""" + lname + """', passwords = '""" + password + """' where 
                nuid = """ + adid
                cursor = connection.cursor()
                cursor.execute(sql)
                messages.success(request, "Successfully updated profile")

        except:
            messages.error(request, "Failed to update profile")
        return redirect('/advisorProfile/' + adid)


