-- User Interface File --

--Set Sever Output On
SET SERVEROUTPUT ON;

--User Interface to see geral data (RUN ALL THE BLOCK)
--1. See All Courses
--2. See All Students
--3. See All Venues
--4. See All Schedules
--5. See All Assessores
--6. See All Course Students
--7. See All Course Schedules in All Venues
--###########################################################################
ACCEPT user_option NUMBER PROMPT '##1. See All Courses##   ##2. See All Students##   ##3. See All Venues##   ##4. See All Schedules##   ##5. See All Assessores##   ##6. See All Course Students##   ##7. See All Course Schedules in All Venues##                                                                              Enter the Option:  ';

CLEAR SCREEN;

BEGIN
    prc_menu(&user_option);
END;
/
--###########################################################################

--User Interface to see the courses of a specific student (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT studentid NUMBER PROMPT 'Enter the Student ID:';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_student_courses(&studentid);
END;
/
--###########################################################################

--User Interface to see the courses achieved of a specific student (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT studentid NUMBER PROMPT 'Enter the Student ID:';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_student_courses_achieved(&studentid);
END;
/
--###########################################################################

--User Interface to see the courses no achieved of a specific student (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT studentid NUMBER PROMPT 'Enter the Student ID:';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_student_courses_no_achieved(&studentid);
END;
/
--###########################################################################

--User Interface to see the students of a specific course (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT courseid NUMBER PROMPT 'Enter the Course ID:';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_course_students(&courseid);
END;
/
--###########################################################################

--User Interface to see the students that achieved a specific course (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT courseid NUMBER PROMPT 'Enter the Course ID:';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_course_students_achieved(&courseid);
END;
/
--###########################################################################

--User Interface to see the students that no achieved a specific course (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT courseid NUMBER PROMPT 'Enter the Course ID:';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_course_students_no_achieved(&courseid);
END;
/
--###########################################################################

--User Interface to see the schedules of a specific course (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT courseid NUMBER PROMPT 'Enter the Course ID:';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_course_schedules(&courseid);
END;
/
--###########################################################################

--User Interface to see the courses of a specific venue (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT venueid NUMBER PROMPT 'Enter the Venue ID:';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_venue_courses(&venueid);
END;
/
--###########################################################################

--User Interface to see the courses with a cost bigger than x (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT cost NUMBER PROMPT 'Enter the Cost(£):';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_courses_cost(&cost);
END;
/
--###########################################################################

--User Interface to see the courses with a duration bigger than x (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT duration NUMBER PROMPT 'Enter the Duration(h):';

CLEAR SCREEN;

BEGIN
    prc_fnc_get_courses_duration(&duration);
END;
/
--###########################################################################

--User Interface to add a Course (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_course_name CHAR PROMPT 'Enter the Course Name:';

ACCEPT save_course_date CHAR PROMPT 'Enter the Course Date(YYYY-MM-DD):';

ACCEPT course_cost NUMBER PROMPT 'Enter the Course Cost(£):';

ACCEPT course_duration_in_hours NUMBER PROMPT 'Enter the Course Duration(h):';

CLEAR SCREEN;

DECLARE
    course_name  VARCHAR(100);
    course_date  VARCHAR(100);
BEGIN
    course_name := '&save_course_name';
    course_date := '&save_course_date';
    prc_add_course(course_name, course_date, &course_cost, &course_duration_in_hours);
END;
/
--###########################################################################

--User Interface to add a Student (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_student_name CHAR PROMPT 'Enter the Student Name:';

ACCEPT save_student_address CHAR PROMPT 'Enter the Student Address:';

ACCEPT save_student_post_code CHAR PROMPT 'Enter the Student Post-Code (LN NLL):';

ACCEPT save_student_email CHAR PROMPT 'Enter the Student Email:';

ACCEPT save_student_mobile_number CHAR PROMPT 'Enter the Student Mobile Phone(+44 XXXX XXX XXX):';

CLEAR SCREEN;

DECLARE
    student_name           VARCHAR(100);
    student_address        VARCHAR(100);
    student_post_code      VARCHAR(100);
    student_email          VARCHAR(100);
    student_mobile_number  VARCHAR(100);
BEGIN
    student_name := '&save_student_name';
    student_address := '&save_student_address';
    student_post_code := '&save_student_post_code';
    student_email := '&save_student_email';
    student_mobile_number := '&save_student_mobile_number';
    prc_add_student(student_name, student_address, student_post_code, student_email, student_mobile_number);
END;
/
--###########################################################################

--User Interface to add a Venue (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_venue_name CHAR PROMPT 'Enter the Venue Name:';

ACCEPT save_venue_address CHAR PROMPT 'Enter the Venue Address:';

ACCEPT save_venue_post_code CHAR PROMPT 'Enter the Venue Post-Code (LN NLL):';

ACCEPT save_venue_email CHAR PROMPT 'Enter the Venue Email:';

ACCEPT save_venue_mobile_number CHAR PROMPT 'Enter the Venue Mobile Phone(+44 XXXX XXX XXX):';

ACCEPT save_venue_venue_google_map_link CHAR PROMPT 'Enter the Venue Google Map Link(https://www.google.pt/maps/place/...):';

CLEAR SCREEN;

DECLARE
    venue_name             VARCHAR(100);
    venue_address          VARCHAR(100);
    venue_post_code        VARCHAR(100);
    venue_email            VARCHAR(100);
    venue_mobile_number    VARCHAR(100);
    venue_google_map_link  VARCHAR(250);
BEGIN
    venue_name := '&save_venue_name';
    venue_address := '&save_venue_address';
    venue_post_code := '&save_venue_post_code';
    venue_email := '&save_venue_email';
    venue_mobile_number := '&save_venue_mobile_number';
    venue_google_map_link := '&save_venue_venue_google_map_link';
    prc_add_venue(venue_name, venue_address, venue_post_code, venue_email, venue_mobile_number,
                 venue_google_map_link);
END;
/
--###########################################################################

--User Interface to add a Schedule (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_schedule_day_hour NUMBER PROMPT 'Enter the Schedule Day Hour:';

ACCEPT save_schedule_week_day CHAR PROMPT 'Enter the Schedule Week Day:';

CLEAR SCREEN;

DECLARE
    schedule_week_day VARCHAR(100);
BEGIN
    schedule_week_day := '&save_schedule_week_day';
    prc_add_schedule(&save_schedule_day_hour, schedule_week_day);
END;
/
--###########################################################################

--User Interface to add a Assessor (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_assessor_course_id NUMBER PROMPT 'Enter the Assessor Course ID:';

ACCEPT save_assessor_name CHAR PROMPT 'Enter the Assessor Name:';

ACCEPT save_assessor_address CHAR PROMPT 'Enter the Assessor Address:';

ACCEPT save_assessor_post_code CHAR PROMPT 'Enter the Assessor Post-Code (LN NLL):';

ACCEPT save_assessor_email CHAR PROMPT 'Enter the Assessor Email:';

ACCEPT save_assessor_mobile_number CHAR PROMPT 'Enter the Assessor Mobile Phone(+44 XXXX XXX XXX):';

ACCEPT save_assessor_manager_name CHAR PROMPT 'Enter the Assessor Manager Name:';

CLEAR SCREEN;

DECLARE
    assessor_name           VARCHAR(100);
    assessor_address        VARCHAR(100);
    assessor_post_code      VARCHAR(100);
    assessor_email          VARCHAR(100);
    assessor_mobile_number  VARCHAR(100);
    assessor_manager_name   VARCHAR(250);
BEGIN
    assessor_name := '&save_assessor_name';
    assessor_address := '&save_assessor_address';
    assessor_post_code := '&save_assessor_post_code';
    assessor_email := '&save_assessor_email';
    assessor_mobile_number := '&save_assessor_mobile_number';
    assessor_manager_name := '&save_assessor_manager_name';
    prc_add_assessor(&save_assessor_course_id, assessor_name, assessor_address, assessor_post_code, assessor_email,
                    assessor_mobile_number,
                    assessor_manager_name);
END;
/
--###########################################################################

--User Interface to add a Course Student (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT course_student_course_id NUMBER PROMPT 'Enter the Course ID:';

ACCEPT course_student_student_id NUMBER PROMPT 'Enter the Student ID:';

CLEAR SCREEN;

BEGIN
    prc_add_course_student(&course_student_course_id, &course_student_student_id);
END;
/
--###########################################################################

--User Interface to add a Course Schedule in a Venue (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT course_schedule_venue_course_id NUMBER PROMPT 'Enter the Course ID:';

ACCEPT course_schedule_venue_schedule_id NUMBER PROMPT 'Enter the Schedule ID:';

ACCEPT course_schedule_venue_venue_id NUMBER PROMPT 'Enter the Venue ID:';

CLEAR SCREEN;

BEGIN
    prc_add_course_schedule_venue(&course_schedule_venue_course_id, &course_schedule_venue_schedule_id,
                                 &course_schedule_venue_venue_id);
END;
/
--###########################################################################

--User Interface to update Student Email (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_student_id NUMBER PROMPT 'Enter the Student ID:';

ACCEPT save_student_email CHAR PROMPT 'Enter the New Student Email:';

CLEAR SCREEN;

DECLARE
    student_email VARCHAR(100);
BEGIN
    student_email := '&save_student_email';
    prc_update_student_email(&save_student_id, student_email);
END;
/
--###########################################################################

--User Interface to update Student Address and Post-Code (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_student_id NUMBER PROMPT 'Enter the Student ID:';

ACCEPT save_student_address CHAR PROMPT 'Enter the New Student Address:';

ACCEPT save_student_post_code CHAR PROMPT 'Enter the New Student Post-Code (LN NLL):';

CLEAR SCREEN;

DECLARE
    student_address    VARCHAR(100);
    student_post_code  VARCHAR(100);
BEGIN
    student_address := '&save_student_address';
    student_post_code := '&save_student_post_code';
    prc_update_student_address_post_code(&save_student_id, student_address, student_post_code);
END;
/
--###########################################################################

--User Interface to update Student Name (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_student_id NUMBER PROMPT 'Enter the Student ID:';

ACCEPT save_student_name CHAR PROMPT 'Enter the New Student Name:';

CLEAR SCREEN;

DECLARE
    student_name VARCHAR(100);
BEGIN
    student_name := '&save_student_name';
    prc_update_student_name(&save_student_id, student_name);
END;
/
--###########################################################################

--User Interface to update Student Mobile Number (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_student_id NUMBER PROMPT 'Enter the Student ID:';

ACCEPT save_student_mobile_number CHAR PROMPT 'Enter the New Student Mobile Phone(+44 XXXX XXX XXX):';

CLEAR SCREEN;

DECLARE
    student_mobile_number VARCHAR(100);
BEGIN
    student_mobile_number := '&save_student_mobile_number';
    prc_update_student_mobile_number(&save_student_id, student_mobile_number);
END;
/
--###########################################################################

--User Interface to update Course Student Achieved (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_course_id NUMBER PROMPT 'Enter the Course ID:';

ACCEPT save_student_id NUMBER PROMPT 'Enter the Student ID:';

ACCEPT save_course_student_achieved CHAR PROMPT 'Enter the New Course Student Achieved(Yes/No):';

CLEAR SCREEN;

DECLARE
    course_student_achieved VARCHAR(100);
BEGIN
    course_student_achieved := '&save_course_student_achieved';
    prc_update_course_student_achieved(&save_course_id, &save_student_id, course_student_achieved);
END;
/
--###########################################################################

--User Interface to Remove a Assessor (RUN ALL THE BLOCK)
--###########################################################################
ACCEPT save_assessor_id NUMBER PROMPT 'Enter the Assessor ID:';

CLEAR SCREEN;

BEGIN
    prc_remove_assessor(&save_assessor_id);
END;
/
--###########################################################################