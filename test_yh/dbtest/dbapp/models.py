# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Adds(models.Model):
    addsid = models.AutoField(primary_key=True)
    courseid = models.ForeignKey('Course', models.DO_NOTHING, db_column='courseid', blank=True, null=True)
    nuid = models.ForeignKey('Student', models.DO_NOTHING, db_column='nuid', blank=True, null=True)
    dates = models.DateField(blank=True, null=True)

    class Meta:
        # managed = False
        db_table = 'adds'


class Admins(models.Model):
    nuid = models.IntegerField(primary_key=True)
    fname = models.CharField(db_column='fName', max_length=75)  # Field name made lowercase.
    lname = models.CharField(db_column='lName', max_length=75)  # Field name made lowercase.
    email = models.CharField(max_length=75)
    passwords = models.CharField(max_length=75)

    class Meta:
        # managed = False
        db_table = 'admins'


class Advisor(models.Model):
    nuid = models.IntegerField(primary_key=True)
    fname = models.CharField(db_column='fName', max_length=75)  # Field name made lowercase.
    lname = models.CharField(db_column='lName', max_length=75)  # Field name made lowercase.
    email = models.CharField(max_length=75)
    passwords = models.CharField(max_length=75)
    dno = models.ForeignKey('Department', models.DO_NOTHING, db_column='dno')

    class Meta:
        # managed = False
        db_table = 'advisor'


class Course(models.Model):
    courseid = models.AutoField(primary_key=True)
    course_no = models.CharField(max_length=75, blank=True, null=True)
    semester = models.CharField(max_length=75)
    course_name = models.CharField(max_length=75)
    course_description = models.CharField(max_length=150, blank=True, null=True)
    credit = models.IntegerField()
    dno = models.ForeignKey('Department', models.DO_NOTHING, db_column='dno')
    sectionid = models.IntegerField(blank=True, null=True)
    professor = models.CharField(max_length=75)
    class_time = models.TimeField()
    capacity = models.IntegerField()
    waitlist = models.IntegerField()
    building = models.CharField(max_length=75)
    room = models.CharField(max_length=75, blank=True, null=True)
    days = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        # managed = False
        db_table = 'course'


class Decline(models.Model):
    s = models.OneToOneField('Student', models.DO_NOTHING, db_column='s_Id', primary_key=True)  # Field name made lowercase.
    advid = models.ForeignKey(Advisor, models.DO_NOTHING, db_column='advId')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'decline'
        unique_together = (('s', 'advid'),)


class Department(models.Model):
    deptid = models.IntegerField(db_column='deptId', primary_key=True)  # Field name made lowercase.
    deptname = models.CharField(db_column='deptName', max_length=75, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'department'


class Drops(models.Model):
    dropsid = models.AutoField(primary_key=True)
    courseid = models.ForeignKey(Course, models.DO_NOTHING, db_column='courseid', blank=True, null=True)
    nuid = models.ForeignKey('Student', models.DO_NOTHING, db_column='nuid', blank=True, null=True)
    dates = models.DateField(blank=True, null=True)

    class Meta:
        # managed = False
        db_table = 'drops'


class Notifications(models.Model):
    ntid = models.AutoField(db_column='ntId', primary_key=True)  # Field name made lowercase.
    advid = models.ForeignKey(Advisor, models.DO_NOTHING, db_column='advId', blank=True, null=True)  # Field name made lowercase.
    s = models.ForeignKey('Student', models.DO_NOTHING, db_column='s_Id', blank=True, null=True)  # Field name made lowercase.
    dates = models.DateField(blank=True, null=True)
    nstatus = models.CharField(db_column='nStatus', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'notifications'


class SendMsg(models.Model):
    ntid = models.AutoField(db_column='ntId', primary_key=True)  # Field name made lowercase.
    s = models.ForeignKey('Student', models.DO_NOTHING, db_column='s_Id', blank=True, null=True)  # Field name made lowercase.
    advid = models.ForeignKey(Advisor, models.DO_NOTHING, db_column='advId', blank=True, null=True)  # Field name made lowercase.
    dates = models.DateField(blank=True, null=True)
    messages = models.CharField(max_length=125, blank=True, null=True)

    class Meta:
        # managed = False
        db_table = 'send_msg'


class Student(models.Model):
    nuid = models.IntegerField(primary_key=True)
    fname = models.CharField(db_column='fName', max_length=75)  # Field name made lowercase.
    lname = models.CharField(db_column='lName', max_length=75)  # Field name made lowercase.
    email = models.CharField(max_length=75)
    dno = models.ForeignKey(Department, models.DO_NOTHING, db_column='dno')
    passwords = models.CharField(max_length=75)

    class Meta:
        # managed = False
        db_table = 'student'
