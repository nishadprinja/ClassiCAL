Psql Tables

Courses:
id
className     string
department_id    int
courseNumber    string
professor_id    int
Location         string
Day             string
time start         datetime
time end        datetime
summary         text
paired_class_id int
online             boolean

Departments:
id
name             string

Prerequisites:
id
course_id
prereq_course_id

Professors:
id
name             string
overallQuality  great/good/fair/bad (extra credit)
averageGrade    int (1-5)  (extra credit)
helpfulness        int (1-5)  (extra credit)
clarity            int (1-5)  (extra credit)
easiness        int (1-5)  (extra credit)
studentRating    string     (extra credit)

Calendars:
course_id
department_id
user_id

Materials:
id
name             string
cost              int
link              string

Courses_materials 
id
course_id
material_id

Users:
id
name
year
major_id (foreign key to dept table)
minor_id (foreign key to dept table)
username
password
(user.calendars = course they've taken)

join_table class paired_class:
course_id
paired_class_id