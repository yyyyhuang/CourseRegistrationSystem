from django.shortcuts import render
from django.db import connection


# Create your views here.
def homePage(request):
    return render(request, 'home.html', {})


def studentHome(request, sid):
    sql = """select course_no, course_name, credit, sectionid, professor, class_time, days, building, room
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


def registerCourses(request):
    return render(request, 'registerClass.html', {})