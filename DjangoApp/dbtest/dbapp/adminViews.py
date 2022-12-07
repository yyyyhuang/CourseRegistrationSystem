from django.shortcuts import render, redirect
from django.db import connection
from .models import Course, Student, Advice, Advisor, Adds, Drops, Requests, Decline, Approve
from datetime import date
import logging
from django.urls import reverse
from django.http import HttpResponseRedirect


def adminHome(request, admid):
    sql = """select * from admin where nuid = '""" + admid + """' """
    cursor = connection.cursor()
    cursor.execute(sql)
    admin = cursor.fetchall()

    course_sql = """select * from course """
    course_cursor = connection.cursor()
    course_cursor.execute(course_sql)
    courses = course_cursor.fetchall()
    context = {
            "admid": admid,
            'admin': admin,
            'courses': courses
        }
    return render(request, 'adminHome.html', context)

def courseList(request, admid):
    sql = """select * from admin where nuid = '""" + admid + """' """
    cursor = connection.cursor()
    cursor.execute(sql)
    admin = cursor.fetchall()

    if request.method == "POST":
        if 'drop' in request.POST.values():
            for key in request.POST.keys():
                if key.startswith('drop'):
                    courseid = key[5:]
            sql = """ delete from course where courseid = '""" + courseid + """' """
            cursor = connection.cursor()
            cursor.execute(sql)
            newurl = "/courseList/" + admid
            return redirect(newurl)
        elif 'modify' in request.POST.values():
            for key in request.POST.keys():
                if key.startswith('modify'):
                    courseid = key[7:]
            newurl = '/modifyCourse/'+ admid + '/' + courseid
            return redirect(newurl)
    else:
        course_sql = """select * from course """
        course_cursor = connection.cursor()
        course_cursor.execute(course_sql)
        course = course_cursor.fetchall()
        context = {
        'course': course,
        "admid": admid,
        "admin": admin
    }
    return render(request, 'courseList.html', context)

def modifyCourse(request, admid, courseid):
    sql = """select * from admin where nuid = '""" + admid + """' """
    cursor = connection.cursor()
    cursor.execute(sql)
    admin = cursor.fetchall()

    course_sql = """select * from course where courseid = '""" + courseid + """' """
    course_cursor = connection.cursor()
    course_cursor.execute(course_sql)
    course = course_cursor.fetchall()
    context = {
        "admid": admid,
        "admin": admin,
        "courseid": courseid,
        "course": course
    }
    
    if request.method == "POST":
        courseno = request.POST.get('courseno')
        semester = request.POST.get('semester')
        coursename = request.POST.get('coursename')
        credit = request.POST.get('credit')
        dno = request.POST.get('dno')
        professor = request.POST.get('professor')
        day = request.POST.get('day')
        time = request.POST.get('time')
        capacity = request.POST.get('capacity')
        waitlist = request.POST.get('waitlist')
        building = request.POST.get('building')
        room = request.POST.get('room')
        sql = """ UPDATE course SET  course_no = '""" + courseno + """', semester = '""" +\
             semester + """' , course_name = '""" + coursename + """', credit = '""" +\
             credit + """' , dno = '""" + dno + """', professor = '""" +\
             professor + """' , class_time = '""" + time + """', days = '"""  +\
             day + """' , capacity = '""" + capacity + """', waitlist = '"""  +\
             waitlist + """' , building = '""" + building + """', room = '""" + room + """' where
             courseid = '""" + courseid + """' """
        
        cursor = connection.cursor()
        cursor.execute(sql)
        newurl = '/courseList/'+ admid
        return redirect(newurl)
    return render(request, 'modifyCourse.html', context)



def newCourse(request, admid):
    sql = """select * from admin where nuid = '""" + admid + """' """
    cursor = connection.cursor()
    cursor.execute(sql)
    admin = cursor.fetchall()
    context = {
        "admid": admid,
        "admin": admin,
    }

    if request.method == "POST":
        courseid = request.POST.get('courseid')
        courseno = request.POST.get('courseno')
        semester = request.POST.get('semester')
        coursename = request.POST.get('coursename')
        credit = request.POST.get('credit')
        dno = request.POST.get('dno')
        professor = request.POST.get('professor')
        day = request.POST.get('day')
        time = request.POST.get('time')
        capacity = request.POST.get('capacity')
        waitlist = request.POST.get('waitlist')
        building = request.POST.get('building')
        room = request.POST.get('room')
        description = request.POST.get('description')
        sectionid = request.POST.get('sectionid')

        sql = """ INSERT INTO course (courseid, course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room, days)
VALUES ('""" + courseid + """','""" + courseno + """', '""" +\
             semester + """' , '""" + coursename + """', '""" +\
             description + """', '""" + credit + """' , '""" + dno + """', '""" + sectionid + """', '""" +\
             professor + """' , '""" + time + """', '""" + capacity + """', '"""  +\
             waitlist + """', '""" + building + """', '""" + room + """', '""" + day + """') """
        
        cursor = connection.cursor()
        cursor.execute(sql)
        newurl = '/courseList/'+ admid
        return redirect(newurl)
    return render(request, 'newCourse.html', context)



def courseStat(request, admid):
    sql = """select * from admin where nuid = '""" + admid + """' """
    cursor = connection.cursor()
    cursor.execute(sql)
    admin = cursor.fetchall()

    if request.method == "POST":
        if 'stats' in request.POST.values():
            for key in request.POST.keys():
                if key.startswith('stats'):
                    courseid = key[6:]
            newurl = '/stats/'+ admid + '/' + courseid
            return redirect(newurl)
    else:
        course_sql = """select * from course """
        course_cursor = connection.cursor()
        course_cursor.execute(course_sql)
        course = course_cursor.fetchall()
        context = {
        'course': course,
        "admid": admid,
        "admin": admin
    }
    return render(request, 'courseStat.html', context)


def stats(request, admid, courseid):
    sql = """select * from admin where nuid = '""" + admid + """' """
    cursor = connection.cursor()
    cursor.execute(sql)
    admin = cursor.fetchall()

    course_sql = """select * from course where courseid = '""" + courseid + """' """
    course_cursor = connection.cursor()
    course_cursor.execute(course_sql)
    course = course_cursor.fetchall()

    student_sql = """select nuid, fname, lname, email, dno
            from student where nuid in (select nuid from adds where courseid = 
            """ + courseid + """ and nuid not in (select nuid from drops where courseid = """ + courseid + """))"""
    student_cursor = connection.cursor()
    student_cursor.execute(student_sql)
    student = student_cursor.fetchall()
    counts = len(student)

    capacity_sql = """select capacity from course where courseid = '""" + courseid + """' """
    capacity_cursor = connection.cursor()
    capacity_cursor.execute(capacity_sql)
    capacity = capacity_cursor.fetchall()
    availables = capacity[0][0] - counts if capacity[0][0] - counts >= 0 else 0

    waitlist_sql = """select waitlist from course where courseid = '""" + courseid + """' """
    waitlist_cursor = connection.cursor()
    waitlist_cursor.execute(waitlist_sql)
    waitlist = waitlist_cursor.fetchall()
    if waitlist[0][0] >= counts - waitlist[0][0] >= 0:
        waitlist_open = waitlist[0][0] - (counts-capacity[0][0])
    elif waitlist[0][0] < counts - waitlist[0][0]:
        waitlist_open = 0
    else:
        waitlist_open = waitlist[0][0]

    context = {
        "admid": admid,
        "admin": admin,
        "courseid": courseid,
        "course": course,
        "student": student,
        "counts": counts,
        "capacity": capacity,
        "availables": availables,
        "waitlist": waitlist,
        "waitlist_open": waitlist_open,
    }
    
    return render(request, 'stats.html', context)