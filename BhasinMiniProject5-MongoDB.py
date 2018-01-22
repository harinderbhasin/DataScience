# Mini Project 5
# Name: Harry Bhasin
# Option 2 - using the University Database
# The code starts below...

#! /usr/bin/python

# MiniProject5.py
from pymongo import MongoClient
import pprint

client = MongoClient()

db = client.University

room_record = db.classroom.insert({"building":"Packard", "room_number":101, "capacity":500})
room_record = db.classroom.insert({"building":"Painter", "room_number":514, "capacity":10})
room_record = db.classroom.insert({"building":"Taylor", "room_number":3128, "capacity":70})
room_record = db.classroom.insert({"building":"Watson", "room_number":100, "capacity":30})
room_record = db.classroom.insert({"building":"Watson", "room_number":120, "capacity":50})

dpt_record = db.department.insert({"dept_name":"Biology", "building":"Watson", "budget":90000})
dpt_record = db.department.insert({"dept_name":"Comp. Sci.", "building":"Taylor", "budget":100000})
dpt_record = db.department.insert({"dept_name":"Elec. Eng.", "building":"Taylor", "budget":85000})
dpt_record = db.department.insert({"dept_name":"Finance", "building":"Painter", "budget":120000})
dpt_record = db.department.insert({"dept_name":"History", "building":"Painter", "budget":50000})
dpt_record = db.department.insert({"dept_name":"Music", "building":"Packard", "budget":80000})
dpt_record = db.department.insert({"dept_name":"Physics", "building":"Watson", "budget":70000})

course_record = db.course.insert({"ID":"BIO-101", "name":"Intro. to Biology", "dept_name":"Biology", "salary":4})
course_record = db.course.insert({"ID":"BIO-301", "name":"Genetics", "dept_name":"Biology", "salary":4})
course_record = db.course.insert({"ID":"BIO-399", "name":"Computational Biology", "dept_name":"Biology", "salary":3})
course_record = db.course.insert({"ID":"CS-101", "name":"Intro. to Computer Science", "dept_name":"Comp. Sci.", "salary":4})
course_record = db.course.insert({"ID":"CS-190", "name":"Game Design", "dept_name":"Comp. Sci.", "salary":4})
course_record = db.course.insert({"ID":"CS-315", "name":"Robotics", "dept_name":"Comp. Sci.", "salary":3})
course_record = db.course.insert({"ID":"CS-319", "name":"Image Processing", "dept_name":"Comp. Sci.", "salary":3})
course_record = db.course.insert({"ID":"CS-347", "name":"Database System Concepts", "dept_name":"Comp. Sci.", "salary":3})
course_record = db.course.insert({"ID":"EE-181", "name":"Intro. to Digital Systems", "dept_name":"Elec. Eng.", "salary":3})
course_record = db.course.insert({"ID":"FIN-201", "name":"Investment Banking", "dept_name":"Finance", "salary":3})
course_record = db.course.insert({"ID":"HIS-351", "name":"World History", "dept_name":"History", "salary":3})
course_record = db.course.insert({"ID":"MU-199", "name":"Music Video Production", "dept_name":"Music", "salary":3})
course_record = db.course.insert({"ID":"PHY-101", "name":"Physical Principles", "dept_name":"Physics", "salary":4})

instr_record = db.instructor.insert({"ID":"10101", "name":"Srinivasan", "dept_name":"Comp. Sci.", "salary":65000})
instr_record = db.instructor.insert({"ID":"12121", "name":"Wu", "dept_name":"Finance", "salary":90000})
instr_record = db.instructor.insert({"ID":"15151", "name":"Mozart", "dept_name":"Music", "salary":40000})
instr_record = db.instructor.insert({"ID":"22222", "name":"Einstein", "dept_name":"Physics", "salary":95000})
instr_record = db.instructor.insert({"ID":"32343", "name":"El Said", "dept_name":"History", "salary":60000})
instr_record = db.instructor.insert({"ID":"33456", "name":"Gold", "dept_name":"Physics", "salary":87000})
instr_record = db.instructor.insert({"ID":"45565", "name":"Katz", "dept_name":"Comp. Sci.", "salary":75000})
instr_record = db.instructor.insert({"ID":"58583", "name":"Califieri", "dept_name":"History", "salary":62000})
instr_record = db.instructor.insert({"ID":"76543", "name":"Singh", "dept_name":"Finance", "salary":80000})
instr_record = db.instructor.insert({"ID":"76766", "name":"Crick", "dept_name":"Biology", "salary":72000})
instr_record = db.instructor.insert({"ID":"83821", "name":"Brandt", "dept_name":"Comp. Sci.", "salary":92000})
instr_record = db.instructor.insert({"ID":"98345", "name":"Kim", "dept_name":"Elec. Eng.", "salary":80000})

sec_record = db.section.insert({"course_id":"BIO-101", "sec_id":1, "semester":"Summer", "year":2009, "building":"Painter", "room_number":514, "time_slot_id":"B"})
sec_record = db.section.insert({"course_id":"BIO-301", "sec_id":1, "semester":"Summer", "year":2010, "building":"Painter", "room_number":514, "time_slot_id":"A"})
sec_record = db.section.insert({"course_id":"CS-101", "sec_id":1, "semester":"Fall", "year":2009, "building":"Packard", "room_number":101, "time_slot_id":"H"})
sec_record = db.section.insert({"course_id":"CS-101", "sec_id":1, "semester":"Spring", "year":2010, "building":"Packard", "room_number":101, "time_slot_id":"F"})
sec_record = db.section.insert({"course_id":"CS-190", "sec_id":1, "semester":"Spring", "year":2009, "building":"Taylor", "room_number":3128, "time_slot_id":"E"})
sec_record = db.section.insert({"course_id":"CS-190", "sec_id":2, "semester":"Spring", "year":2009, "building":"Taylor", "room_number":3128, "time_slot_id":"A"})
sec_record = db.section.insert({"course_id":"CS-315", "sec_id":1, "semester":"Spring", "year":2010, "building":"Watson", "room_number":120, "time_slot_id":"D"})
sec_record = db.section.insert({"course_id":"CS-319", "sec_id":1, "semester":"Spring", "year":2010, "building":"Watson", "room_number":100, "time_slot_id":"B"})
sec_record = db.section.insert({"course_id":"CS-319", "sec_id":2, "semester":"Spring", "year":2010, "building":"Taylor", "room_number":3128, "time_slot_id":"C"})
sec_record = db.section.insert({"course_id":"CS-347", "sec_id":1, "semester":"Fall", "year":2009, "building":"Taylor", "room_number":3128, "time_slot_id":"A"})
sec_record = db.section.insert({"course_id":"EE-181", "sec_id":1, "semester":"Spring", "year":2009, "building":"Taylor", "room_number":3128, "time_slot_id":"C"})
sec_record = db.section.insert({"course_id":"FIN-201", "sec_id":1, "semester":"Spring", "year":2010, "building":"Packard", "room_number":101, "time_slot_id":"B"})
sec_record = db.section.insert({"course_id":"HIS-351", "sec_id":1, "semester":"Spring", "year":2010, "building":"Painter", "room_number":514, "time_slot_id":"C"})
sec_record = db.section.insert({"course_id":"MU-199", "sec_id":1, "semester":"Spring", "year":2010, "building":"Packard", "room_number":101, "time_slot_id":"D"})
sec_record = db.section.insert({"course_id":"PHY-101", "sec_id":1, "semester":"Fall", "year":2009, "building":"Watson", "room_number":100, "time_slot_id":"A"})

teaches_record = db.teaches.insert({"ID":10101, "course_id":"CS-101", "sec_id":1, "semester":"Fall", "year":2009})
teaches_record = db.teaches.insert({"ID":10101, "course_id":"CS-315", "sec_id":1, "semester":"Spring", "year":2010})
teaches_record = db.teaches.insert({"ID":10101, "course_id":"CS-347", "sec_id":1, "semester":"Fall", "year":2009})
teaches_record = db.teaches.insert({"ID":12121, "course_id":"FIN-201", "sec_id":1, "semester":"Spring", "year":2010})
teaches_record = db.teaches.insert({"ID":15151, "course_id":"MU-199", "sec_id":1, "semester":"Spring", "year":2010})
teaches_record = db.teaches.insert({"ID":22222, "course_id":"PHY-101", "sec_id":1, "semester":"Fall", "year":2009})
teaches_record = db.teaches.insert({"ID":32343, "course_id":"HIS-351", "sec_id":1, "semester":"Spring", "year":2010})
teaches_record = db.teaches.insert({"ID":45565, "course_id":"CS-101", "sec_id":1, "semester":"Spring", "year":2010})
teaches_record = db.teaches.insert({"ID":45565, "course_id":"CS-319", "sec_id":1, "semester":"Spring", "year":2010})
teaches_record = db.teaches.insert({"ID":76766, "course_id":"BIO-101", "sec_id":1, "semester":"Summer", "year":2009})
teaches_record = db.teaches.insert({"ID":76766, "course_id":"BIO-301", "sec_id":1, "semester":"Summer", "year":2010})
teaches_record = db.teaches.insert({"ID":83821, "course_id":"CS-190", "sec_id":1, "semester":"Spring", "year":2009})
teaches_record = db.teaches.insert({"ID":83821, "course_id":"CS-190", "sec_id":2, "semester":"Spring", "year":2009})
teaches_record = db.teaches.insert({"ID":83821, "course_id":"CS-319", "sec_id":2, "semester":"Spring", "year":2010})
teaches_record = db.teaches.insert({"ID":98345, "course_id":"EE-181", "sec_id":1, "semester":"Spring", "year":2009})

student_record = db.student.insert({"ID":00126, "name":"Zhang", "dept_name":"Comp. Sci.", "tot_cred":102})
student_record = db.student.insert({"ID":12345, "name":"Shankar", "dept_name":"Comp. Sci.", "tot_cred":32})
student_record = db.student.insert({"ID":19991, "name":"Brandt", "dept_name":"History", "tot_cred":80})
student_record = db.student.insert({"ID":23121, "name":"Chavez", "dept_name":"Finance", "tot_cred":110})
student_record = db.student.insert({"ID":44553, "name":"Peltier", "dept_name":"Physics", "tot_cred":56})
student_record = db.student.insert({"ID":45678, "name":"Levy", "dept_name":"Physics", "tot_cred":46})
student_record = db.student.insert({"ID":54321, "name":"Williams", "dept_name":"Comp. Sci.", "tot_cred":54})
student_record = db.student.insert({"ID":55739, "name":"Sanchez", "dept_name":"Music", "tot_cred":38})
student_record = db.student.insert({"ID":70557, "name":"Snow", "dept_name":"Physics", "tot_cred":0})
student_record = db.student.insert({"ID":76543, "name":"Brown", "dept_name":"Comp. Sci.", "tot_cred":58})
student_record = db.student.insert({"ID":76653, "name":"Aoi", "dept_name":"Elec. Eng.", "tot_cred":60})
student_record = db.student.insert({"ID":98765, "name":"Bourikas", "dept_name":"Elec. Eng.", "tot_cred":98})
student_record = db.student.insert({"ID":98988, "name":"Tanaka", "dept_name":"Biology", "tot_cred":120})

takes_record = db.takes.insert({"ID":00126, "course_id":"CS-101", "sec_id":1, "semester":"Fall", "year":2009, "grade":"A"})
takes_record = db.takes.insert({"ID":00126, "course_id":"CS-347", "sec_id":1, "semester":"Fall", "year":2009, "grade":"A-"})
takes_record = db.takes.insert({"ID":12345, "course_id":"CS-101", "sec_id":1, "semester":"Fall", "year":2009, "grade":"C"})
takes_record = db.takes.insert({"ID":12345, "course_id":"CS-190", "sec_id":2, "semester":"Spring", "year":2009, "grade":"A"})
takes_record = db.takes.insert({"ID":12345, "course_id":"CS-315", "sec_id":1, "semester":"Spring", "year":2010, "grade":"A"})
takes_record = db.takes.insert({"ID":12345, "course_id":"CS-347", "sec_id":1, "semester":"Fall", "year":2009, "grade":"A"})
takes_record = db.takes.insert({"ID":19991, "course_id":"HIS-351", "sec_id":1, "semester":"Spring", "year":2010, "grade":"B"})
takes_record = db.takes.insert({"ID":23121, "course_id":"FIN-201", "sec_id":1, "semester":"Spring", "year":2010, "grade":"C+"})
takes_record = db.takes.insert({"ID":44553, "course_id":"PHY-101", "sec_id":1, "semester":"Fall", "year":2009, "grade":"B-"})
takes_record = db.takes.insert({"ID":45678, "course_id":"CS-101", "sec_id":1, "semester":"Fall", "year":2009, "grade":"F"})
takes_record = db.takes.insert({"ID":45678, "course_id":"CS-101", "sec_id":1, "semester":"Spring", "year":2010, "grade":"B+"})
takes_record = db.takes.insert({"ID":45678, "course_id":"CS-319", "sec_id":1, "semester":"Spring", "year":2010, "grade":"B"})
takes_record = db.takes.insert({"ID":54321, "course_id":"CS-101", "sec_id":1, "semester":"Fall", "year":2009, "grade":"A-"})
takes_record = db.takes.insert({"ID":54321, "course_id":"CS-190", "sec_id":2, "semester":"Spring", "year":2009, "grade":"B+"})
takes_record = db.takes.insert({"ID":55739, "course_id":"MU-199", "sec_id":1, "semester":"Spring", "year":2010, "grade":"A-"})
takes_record = db.takes.insert({"ID":76543, "course_id":"CS-101", "sec_id":1, "semester":"Fall", "year":2009, "grade":"A"})
takes_record = db.takes.insert({"ID":76543, "course_id":"CS-319", "sec_id":2, "semester":"Spring", "year":2010, "grade":"A"})
takes_record = db.takes.insert({"ID":76653, "course_id":"EE-181", "sec_id":1, "semester":"Spring", "year":2009, "grade":"C"})
takes_record = db.takes.insert({"ID":98765, "course_id":"CS-101", "sec_id":1, "semester":"Fall", "year":2009, "grade":"C-"})
takes_record = db.takes.insert({"ID":98765, "course_id":"CS-315", "sec_id":1, "semester":"Spring", "year":2010, "grade":"B"})
takes_record = db.takes.insert({"ID":98988, "course_id":"BIO-101", "sec_id":1, "semester":"Summer", "year":2009, "grade":"A"})
takes_record = db.takes.insert({"ID":98988, "course_id":"BIO-301", "sec_id":1, "semester":"Summer", "year":2010, "grade":"null"})

advi_record = db.advisor.insert({"s_ID":00126, "i_ID":45565})
advi_record = db.advisor.insert({"s_ID":12345, "i_ID":10101})
advi_record = db.advisor.insert({"s_ID":23121, "i_ID":76543})
advi_record = db.advisor.insert({"s_ID":44553, "i_ID":22222})
advi_record = db.advisor.insert({"s_ID":45678, "i_ID":22222})
advi_record = db.advisor.insert({"s_ID":76543, "i_ID":45565})
advi_record = db.advisor.insert({"s_ID":76653, "i_ID":98345})
advi_record = db.advisor.insert({"s_ID":98765, "i_ID":98345})
advi_record = db.advisor.insert({"s_ID":98988, "i_ID":76766})

timeslot_record = db.time_slot.insert({"time_slot_id":"A", "day":"M", "start_hr":8, "start_min":0, "end_hr":8, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"A", "day":"W", "start_hr":8, "start_min":0, "end_hr":8, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"A", "day":"F", "start_hr":8, "start_min":0, "end_hr":8, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"B", "day":"M", "start_hr":9, "start_min":0, "end_hr":9, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"B", "day":"W", "start_hr":9, "start_min":0, "end_hr":9, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"B", "day":"F", "start_hr":9, "start_min":0, "end_hr":9, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"C", "day":"M", "start_hr":11, "start_min":0, "end_hr":11, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"C", "day":"W", "start_hr":11, "start_min":0, "end_hr":11, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"C", "day":"F", "start_hr":11, "start_min":0, "end_hr":11, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"D", "day":"M", "start_hr":13, "start_min":0, "end_hr":13, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"D", "day":"W", "start_hr":13, "start_min":0, "end_hr":13, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"D", "day":"F", "start_hr":13, "start_min":0, "end_hr":13, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"E", "day":"T", "start_hr":10, "start_min":30, "end_hr":11, "end_min":45})
timeslot_record = db.time_slot.insert({"time_slot_id":"E", "day":"R", "start_hr":10, "start_min":30, "end_hr":11, "end_min":45})
timeslot_record = db.time_slot.insert({"time_slot_id":"F", "day":"T", "start_hr":14, "start_min":30, "end_hr":15, "end_min":45})
timeslot_record = db.time_slot.insert({"time_slot_id":"F", "day":"R", "start_hr":14, "start_min":30, "end_hr":15, "end_min":45})
timeslot_record = db.time_slot.insert({"time_slot_id":"G", "day":"M", "start_hr":16, "start_min":0, "end_hr":16, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"G", "day":"W", "start_hr":16, "start_min":0, "end_hr":16, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"G", "day":"F", "start_hr":16, "start_min":0, "end_hr":16, "end_min":50})
timeslot_record = db.time_slot.insert({"time_slot_id":"H", "day":"W", "start_hr":10, "start_min":0, "end_hr":12, "end_min":30})

prer_record = db.prereq.insert({"course_id":"BIO-301", "prereq_id":"BIO-101"})
prer_record = db.prereq.insert({"course_id":"BIO-399", "prereq_id":"BIO-101"})
prer_record = db.prereq.insert({"course_id":"CS-190", "prereq_id":"CS-101"})
prer_record = db.prereq.insert({"course_id":"CS-315", "prereq_id":"CS-101"})
prer_record = db.prereq.insert({"course_id":"CS-319", "prereq_id":"CS-101"})
prer_record = db.prereq.insert({"course_id":"CS-347", "prereq_id":"CS-101"})
prer_record = db.prereq.insert({"course_id":"EE-181", "prereq_id":"PHY-101"})

# Here we query the document and print
for room in db.classroom.find():
    pprint.pprint(room)
for dpt in db.department.find():
    pprint.pprint(dpt)
for course in db.course.find():
    pprint.pprint(course)
for instr in db.instructor.find():
    pprint.pprint(instr)
for sec in db.section.find():
    pprint.pprint(sec)
for teaches in db.teaches.find():
    pprint.pprint(teaches)
for stu in db.student.find():
    pprint.pprint(stu)
for tks in db.takes.find():
    pprint.pprint(tks)
for advi in db.advisor.find():
    pprint.pprint(advi)
for timsl in db.time_slot.find():
    pprint.pprint(timsl)
for prer in db.prereq.find():
    pprint.pprint(prer)

pprint.pprint(db.classroom.find_one())
pprint.pprint(db.department.find_one())
pprint.pprint(db.course.find_one())
pprint.pprint(db.instructor.find_one())
pprint.pprint(db.section.find_one())
pprint.pprint(db.teaches.find_one())
pprint.pprint(db.student.find_one())
pprint.pprint(db.takes.find_one())
pprint.pprint(db.advisor.find_one())
pprint.pprint(db.time_slot.find_one())
pprint.pprint(db.prereq.find_one())


# Here we update and save a document
pprint.pprint(db.classroom.find_one())
result = db.classroom.find_one()
result['building'] = "Warren"
db.classroom.save(result)
pprint.pprint(db.classroom.find_one())
