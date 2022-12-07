from django.shortcuts import render, redirect
from django.db import connection
from .models import Course, Student, Advice, Advisor, Adds, Drops, Requests, Decline, Approve
from datetime import date
import logging
from django.urls import reverse
from django.http import HttpResponseRedirect
from django.contrib import messages

# Create your views here.
# DONE!!
def homePage(request):
    return render(request, 'home.html', {})


# DONE!!
def login(request):
    if request.method == "POST":
        if 'nuid' in request.POST.keys():
            table = request.POST.get('user')
            nuid = request.POST.get('nuid')
            passwords = request.POST.get('password')
            sql = """select fname, lname from """ + table + """ where nuid = '""" + nuid + """' and passwords = '""" + passwords + """'"""
            cursor = connection.cursor()
            cursor.execute(sql)
            user = cursor.fetchone()
            # logging.debug("message")
            if user:
                if table == "advisor":
                    newurl = '/advisorHome/' + nuid
                elif table == 'student':
                    newurl = '/student/' + nuid
                else:
                    newurl = '/admin/' + nuid
                return redirect(newurl)
            else:
                return render(request, 'login.html', {})
    if request.method == 'GET':
        return render(request, 'login.html', {})

# def logout(request):
#     logout(request)
#     reqiest.user = None
#     return redirect('/')

# DONE!!!
def signup(request):
    if request.method == "POST":
        table = request.POST.get('user')
        nuid = request.POST.get('nuid')
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        email = request.POST.get('email')
        passwords = request.POST.get('password')
        dno = request.POST.get('dno')
        sql = """INSERT INTO """ + table + """(nuid, fname, lname, email, dno, passwords) VALUES ('""" +\
              nuid + """', '""" + fname + """', '""" + lname + """', '""" + email + """', '""" + dno + """', '""" +\
              passwords + """')"""
        cursor = connection.cursor()
        cursor.execute(sql)
        return redirect('/')
    else:
        return render(request, 'signup.html', {})


def studentHome(request, sid):
    context = {}
    if request.method == "POST":
        if 'drop' in request.POST.values():
            for key in request.POST.keys():
                if key.startswith('drop'):
                    courseid = key[5:]
            dates = str(date.today())
            sql = """INSERT INTO drops (courseid, nuid, dates) VALUES ('""" + courseid + """', '""" + sid + """', '""" + dates + """')"""
            cursor = connection.cursor()
            cursor.execute(sql)
            newurl = "/student/" + sid
            return redirect(newurl)
    else:
        sql = """select course_no, course_name, credit, sectionid, professor, class_time, days, building, room, courseid
                        from course where courseid in (select courseid from adds where nuid = 
                        """ + sid + """ and courseid not in (select courseid from drops where nuid = """ + sid + """))"""
        cursor = connection.cursor()
        cursor.execute(sql)
        courses = cursor.fetchall()
        context = {
            "courses": courses,
            "sid": sid
        }
    return render(request, 'studentHome.html', context)


# done!!!!!!!
def registerCourses(request, sid):
    context = {"sid": sid}
    if request.method == "GET":
        if request.GET.get('semester'):
            semester = request.GET.get('semester')
            courseNo = request.GET.get('search2')
            sql = """select * from course where semester = '""" + semester + """' and course_no = '""" + courseNo + """'"""
            cursor = connection.cursor()
            cursor.execute(sql)
            results = cursor.fetchall()
            context["results"] = results
    else:
        if 'add' in request.POST.values():
            for key in request.POST.keys():
                if key.startswith('add'):
                    courseid = key[4:]
            dates = str(date.today())
            sql = """INSERT INTO adds (courseid, nuid, dates) VALUES ('""" + courseid + """', '""" + sid + """', '""" + dates + """')"""
            cursor = connection.cursor()
            cursor.execute(sql)
    return render(request, 'registerClass.html', context)


def studentProfile(request, sid):
    sql = """SELECT * FROM student WHERE nuid = """ + sid
    cursor = connection.cursor()
    cursor.execute(sql)
    info = cursor.fetchone()
    context = {
        "info": info,
        "sid": sid
    }
    return render(request, 'studentProfile.html', context)


def viewMessages(request, sid):
    sql = """select dates, messages, status, ntid, advid from send_msg where s_id = """ + sid + """ order by dates"""
    cursor = connection.cursor()
    cursor.execute(sql)
    messages = cursor.fetchall()
    context = {
        "sid": sid,
        "messages": messages,
    }
    return render(request, 'studentMessage.html', context)


def sendMessage(request, sid):
    context = {
        'sid': sid
    }
    if request.method == "POST":
        msg = request.POST.get("message")
        dates = str(date.today())
        logger = logging.getLogger('django')
        try:
            adsql = """select advid from advice where s_id = """ + sid
            cursor = connection.cursor()
            cursor.execute(adsql)
            res = cursor.fetchone()
            advid = str(res[0])
            logger.info(advid)
            sql = """insert into send_msg (s_id, advid, dates, messages, status) values ('""" + sid + """', '""" \
                  + advid + """', '""" + dates + """', '""" + msg + """', 'unread')"""
            cursor.execute(sql)
            messages.success(request, "Successfully sent message")
            return redirect('/student/' + sid + '/message')
        except Exception as e:
            logger.error(e)
            messages.error(request, "Failed to send message")
            return render(request, 'studentSend.html', context)
    else:
        return render(request, 'studentSend.html', context)







