-- Procedures File --

--Set Sever Output On
SET SERVEROUTPUT ON;

--Procedure for all courses
CREATE OR REPLACE PROCEDURE prc_all_courses IS
    object_course course%rowtype;
    CURSOR all_courses IS
    SELECT
        *
    FROM
        course;

BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '===================================================================================================================================');

    dbms_output.put_line('All Courses: ');
    dbms_output.put_line('===================================================================================================================================');
    OPEN all_courses;
    LOOP
        FETCH all_courses INTO object_course;
        EXIT WHEN all_courses%notfound;
        dbms_output.put_line('COURSE ID: '
                             || object_course.id
                             || ' - COURSE NAME: '
                             || object_course.name
                             || ' - COURSE DATE: '
                             || object_course.course_date
                             || ' - COURSE COST: '
                             || object_course.cost
                             || '£ - COURSE DURATION: '
                             || object_course.duration_in_hours
                             || 'h');

    END LOOP;

    CLOSE all_courses;
    dbms_output.put_line('===================================================================================================================================');
END;
/

--##################################################################################################################################################################################

--Procedure for all Students
CREATE OR REPLACE PROCEDURE prc_all_students IS
    object_student student%rowtype;
    CURSOR all_students IS
    SELECT
        *
    FROM
        student;

BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '=======================================================================================================================================================================================');

    dbms_output.put_line('All Students: ');
    dbms_output.put_line('=======================================================================================================================================================================================');
    OPEN all_students;
    LOOP
        FETCH all_students INTO object_student;
        EXIT WHEN all_students%notfound;
        dbms_output.put_line('STUDENT ID: '
                             || object_student.id
                             || ' - STUDENT NAME: '
                             || object_student.name
                             || ' - STUDENT ADDRESS: '
                             || object_student.address
                             || ' - STUDENT POST CODE: '
                             || object_student.post_code
                             || ' - STUDENT EMAIL: '
                             || object_student.email
                             || ' - STUDENT MOBILE NUMBER: '
                             || object_student.mobile_number);

    END LOOP;

    CLOSE all_students;
    dbms_output.put_line('=======================================================================================================================================================================================');
END;
/

--##################################################################################################################################################################################

--Procedure for all Venues
CREATE OR REPLACE PROCEDURE prc_all_venues IS
    object_venue venue%rowtype;
    CURSOR all_venues IS
    SELECT
        *
    FROM
        venue;

BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '===========================================================================================================================================================================================================================================');

    dbms_output.put_line('All Venues: ');
    dbms_output.put_line('===========================================================================================================================================================================================================================================');
    OPEN all_venues;
    LOOP
        FETCH all_venues INTO object_venue;
        EXIT WHEN all_venues%notfound;
        dbms_output.put_line('VENUE ID: '
                             || object_venue.id
                             || ' - VENUE NAME: '
                             || object_venue.name
                             || ' - VENUE ADDRESS: '
                             || object_venue.address
                             || ' - VENUE POST CODE: '
                             || object_venue.post_code
                             || ' - VENUE EMAIL: '
                             || object_venue.email
                             || ' - VENUE MOBILE NUMBER: '
                             || object_venue.mobile_number
                             || ' - VENUE GOOGLE MAP LINK: '
                             || object_venue.google_map_link);

    END LOOP;

    CLOSE all_venues;
    dbms_output.put_line('===========================================================================================================================================================================================================================================');
END;
/

--##################################################################################################################################################################################

--Procedure for all Schedules
CREATE OR REPLACE PROCEDURE prc_all_schedules IS
    object_schedule schedule%rowtype;
    CURSOR all_schedules IS
    SELECT
        *
    FROM
        schedule;

BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '===================================================================================================================================');

    dbms_output.put_line('All Schedules: ');
    dbms_output.put_line('===================================================================================================================================');
    OPEN all_schedules;
    LOOP
        FETCH all_schedules INTO object_schedule;
        EXIT WHEN all_schedules%notfound;
        dbms_output.put_line('SCHEDULE ID: '
                             || object_schedule.id
                             || ' - SCHEDULE DAY HOUR: '
                             || object_schedule.day_hour
                             || ' - SCHEDULE WEEK DAY: '
                             || object_schedule.week_day);

    END LOOP;

    CLOSE all_schedules;
    dbms_output.put_line('===================================================================================================================================');
END;
/

--##################################################################################################################################################################################

--Procedure for all Assessores
CREATE OR REPLACE PROCEDURE prc_all_assessores IS
    object_assessor assessor%rowtype;
    CURSOR all_assessores IS
    SELECT
        *
    FROM
        assessor;

BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '===========================================================================================================================================================================================================================================================');

    dbms_output.put_line('All Assessores: ');
    dbms_output.put_line('===========================================================================================================================================================================================================================================================');
    OPEN all_assessores;
    LOOP
        FETCH all_assessores INTO object_assessor;
        EXIT WHEN all_assessores%notfound;
        dbms_output.put_line('ASSESSOR ID: '
                             || object_assessor.id
                             || ' - ASSESSOR COURSE ID: '
                             || object_assessor.course_id
                             || ' - ASSESSOR NAME: '
                             || object_assessor.name
                             || ' - ASSESSOR ADDRESS: '
                             || object_assessor.address
                             || ' - ASSESSOR POST_CODE: '
                             || object_assessor.post_code
                             || ' - ASSESSOR EMAIL: '
                             || object_assessor.email
                             || ' - ASSESSOR MOBILE NUMBER: '
                             || object_assessor.mobile_number
                             || ' - ASSESSOR MANAGER NAME: '
                             || object_assessor.manager_name);

    END LOOP;

    CLOSE all_assessores;
    dbms_output.put_line('===========================================================================================================================================================================================================================================================');
END;
/

--##################################################################################################################################################################################

--Procedure for all Course Students
CREATE OR REPLACE PROCEDURE prc_all_course_students IS

    student_id               INT;
    student_name             VARCHAR2(50);
    course_id                INT;
    course_name              VARCHAR2(50);
    course_student_achieved  VARCHAR2(3);
    CURSOR all_course_students IS
    SELECT
        student.id                 AS student_id,
        student.name               AS student_name,
        course.id                  AS course_id,
        course.name                AS course_name,
        course_student.achieved    AS course_achieved
    FROM
             course_student
        INNER JOIN student ON course_student.student_id = student.id
        INNER JOIN course ON course_student.course_id = course.id;

BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '===================================================================================================================================');

    dbms_output.put_line('All Course Students: ');
    dbms_output.put_line('===================================================================================================================================');
    OPEN all_course_students;
    LOOP
        FETCH all_course_students INTO
            student_id,
            student_name,
            course_id,
            course_name,
            course_student_achieved;
        EXIT WHEN all_course_students%notfound;
        dbms_output.put_line('STUDENT ID: '
                             || student_id
                             || ' - STUDENT NAME: '
                             || student_name
                             || ' - COURSE ID: '
                             || course_id
                             || ' - COURSE NAME: '
                             || course_name
                             || ' - ACHIEVED: '
                             || course_student_achieved);

    END LOOP;

    CLOSE all_course_students;
    dbms_output.put_line('===================================================================================================================================');
END;
/

--##################################################################################################################################################################################

--Procedure for all Course Schedules Venues
CREATE OR REPLACE PROCEDURE prc_all_course_schedule_venues IS

    course_id          INT;
    course_name        VARCHAR2(50);
    venue_id           INT;
    venue_address      VARCHAR(200);
    venue_post_code    VARCHAR(200);
    schedule_id        INT;
    schedule_day_hour  NUMBER;
    schedule_week_day  VARCHAR(100);
    CURSOR cursor_course_schedule_venues IS
    SELECT
        course.id            AS course_id,
        course.name          AS course_name,
        venue.id             AS venue_id,
        venue.address        AS venue_address,
        venue.post_code      AS venue_post_code,
        schedule.id          AS schedule_id,
        schedule.day_hour    AS schedule_day_hour,
        schedule.week_day    AS schedule_week_day
    FROM
             course_schedule_venue
        INNER JOIN course ON course_schedule_venue.course_id = course.id
        INNER JOIN venue ON course_schedule_venue.venue_id = venue.id
        INNER JOIN schedule ON course_schedule_venue.schedule_id = schedule.id;

BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '==================================================================================================================================================================================');

    dbms_output.put_line('All Course Schedules in All Venues: ');
    dbms_output.put_line('==================================================================================================================================================================================');
    OPEN cursor_course_schedule_venues;
    LOOP
        FETCH cursor_course_schedule_venues INTO
            course_id,
            course_name,
            venue_id,
            venue_address,
            venue_post_code,
            schedule_id,
            schedule_day_hour,
            schedule_week_day;

        EXIT WHEN cursor_course_schedule_venues%notfound;
        dbms_output.put_line('COURSE ID: '
                             || course_id
                             || ' - COURSE NAME: '
                             || course_name
                             || ' - VENUE ID: '
                             || venue_id
                             || ' - VENUE ADDRESS: '
                             || venue_address
                             || ' - VENUE POST CODE: '
                             || venue_post_code
                             || 'SCHEDULE ID: '
                             || schedule_id
                             || ' - SCHEDULE DAY HOUR: '
                             || schedule_day_hour
                             || ' - SCHEDULE WEEK DAY: '
                             || schedule_week_day);

    END LOOP;

    CLOSE cursor_course_schedule_venues;
    dbms_output.put_line('==================================================================================================================================================================================');
END;
/

--##################################################################################################################################################################################

--Procedure for the geral menu
CREATE OR REPLACE PROCEDURE prc_menu (
    user_option NUMBER
) IS
BEGIN
    IF ( user_option = 1 ) THEN
        prc_all_courses();
    ELSE
        IF ( user_option = 2 ) THEN
            prc_all_students();
        ELSE
            IF ( user_option = 3 ) THEN
                prc_all_venues();
            ELSE
                IF ( user_option = 4 ) THEN
                    prc_all_schedules();
                ELSE
                    IF ( user_option = 5 ) THEN
                        prc_all_assessores();
                    ELSE
                        IF ( user_option = 6 ) THEN
                            prc_all_course_students();
                        ELSE
                            IF ( user_option = 7 ) THEN
                                prc_all_course_schedule_venues();
                            ELSE
                                dbms_output.put_line(chr(10)
                                                     || chr(10)
                                                     || chr(10)
                                                     || chr(10)
                                                     || chr(10)
                                                     || '========================================================');

                                dbms_output.put_line('ERROR: Invalid Option! Try Again!');
                                dbms_output.put_line('========================================================');
                            END IF;
                        END IF;
                    END IF;
                END IF;
            END IF;
        END IF;
    END IF;
END;
/

--##################################################################################################################################################################################

--Procedure to print the student courses
CREATE OR REPLACE PROCEDURE prc_fnc_get_student_courses (
    student_id student.id%TYPE
) IS

    cursor_courses            SYS_REFCURSOR;
    course_id                 INT;
    course_name               VARCHAR2(50);
    course_course_date        DATE;
    course_cost               NUMBER;
    course_duration_in_hours  NUMBER;
    course_student_achieved   VARCHAR(3);
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '===================================================================================================================================');

    dbms_output.put_line('Courses of Student ID: ' || student_id);
    dbms_output.put_line('===================================================================================================================================');
    cursor_courses := fnc_get_student_courses(student_id);
    IF cursor_courses IS NOT NULL THEN
        LOOP
            FETCH cursor_courses INTO
                course_id,
                course_name,
                course_course_date,
                course_cost,
                course_duration_in_hours,
                course_student_achieved;
            EXIT WHEN cursor_courses%notfound;
            dbms_output.put_line('COURSE ID: '
                                 || course_id
                                 || ' - COURSE NAME: '
                                 || course_name
                                 || ' - COURSE DATE: '
                                 || course_course_date
                                 || ' - COURSE COST: '
                                 || course_cost
                                 || '£ - COURSE DURATION: '
                                 || course_duration_in_hours
                                 || 'h'
                                 || ' - COURSE ACHIEVED: '
                                 || course_student_achieved);

        END LOOP;
    END IF;

    dbms_output.put_line('===================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to print the student achieved courses
CREATE OR REPLACE PROCEDURE prc_fnc_get_student_courses_achieved (
    student_id student.id%TYPE
) IS

    cursor_courses            SYS_REFCURSOR;
    course_id                 INT;
    course_name               VARCHAR2(50);
    course_course_date        DATE;
    course_cost               NUMBER;
    course_duration_in_hours  NUMBER;
    course_student_achieved   VARCHAR(3);
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '===================================================================================================================================');

    dbms_output.put_line('Courses Achieved of Student ID: ' || student_id);
    dbms_output.put_line('===================================================================================================================================');
    cursor_courses := fnc_get_student_courses_achieved(student_id);
    IF cursor_courses IS NOT NULL THEN
        LOOP
            FETCH cursor_courses INTO
                course_id,
                course_name,
                course_course_date,
                course_cost,
                course_duration_in_hours,
                course_student_achieved;
            EXIT WHEN cursor_courses%notfound;
            dbms_output.put_line('COURSE ID: '
                                 || course_id
                                 || ' - COURSE NAME: '
                                 || course_name
                                 || ' - COURSE DATE: '
                                 || course_course_date
                                 || ' - COURSE COST: '
                                 || course_cost
                                 || '£ - COURSE DURATION: '
                                 || course_duration_in_hours
                                 || 'h'
                                 || ' - COURSE ACHIEVED: '
                                 || course_student_achieved);

        END LOOP;
    END IF;

    dbms_output.put_line('===================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to print the student no achieved courses
CREATE OR REPLACE PROCEDURE prc_fnc_get_student_courses_no_achieved (
    student_id student.id%TYPE
) IS

    cursor_courses            SYS_REFCURSOR;
    course_id                 INT;
    course_name               VARCHAR2(50);
    course_course_date        DATE;
    course_cost               NUMBER;
    course_duration_in_hours  NUMBER;
    course_student_achieved   VARCHAR(3);
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '===================================================================================================================================');

    dbms_output.put_line('Courses No Achieved of Student ID: ' || student_id);
    dbms_output.put_line('===================================================================================================================================');
    cursor_courses := fnc_get_student_courses_no_achieved(student_id);
    IF cursor_courses IS NOT NULL THEN
        LOOP
            FETCH cursor_courses INTO
                course_id,
                course_name,
                course_course_date,
                course_cost,
                course_duration_in_hours,
                course_student_achieved;
            EXIT WHEN cursor_courses%notfound;
            dbms_output.put_line('COURSE ID: '
                                 || course_id
                                 || ' - COURSE NAME: '
                                 || course_name
                                 || ' - COURSE DATE: '
                                 || course_course_date
                                 || ' - COURSE COST: '
                                 || course_cost
                                 || '£ - COURSE DURATION: '
                                 || course_duration_in_hours
                                 || 'h'
                                 || ' - COURSE ACHIEVED: '
                                 || course_student_achieved);

        END LOOP;
    END IF;

    dbms_output.put_line('===================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to print the course students
CREATE OR REPLACE PROCEDURE prc_fnc_get_course_students (
    id_course_parameter course.id%TYPE
) IS

    cursor_students          SYS_REFCURSOR;
    student_id               INT;
    student_name             VARCHAR2(50);
    student_address          VARCHAR2(50);
    student_post_code        VARCHAR2(6);
    student_email            VARCHAR2(50);
    student_mobile_number    VARCHAR2(16);
    course_student_achieved  VARCHAR2(3);
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '==================================================================================================================================================================================================================');

    dbms_output.put_line('Students of Course ID: ' || id_course_parameter);
    dbms_output.put_line('==================================================================================================================================================================================================================');
    cursor_students := fnc_get_course_students(id_course_parameter);
    IF cursor_students IS NOT NULL THEN
        LOOP
            FETCH cursor_students INTO
                student_id,
                student_name,
                student_address,
                student_post_code,
                student_email,
                student_mobile_number,
                course_student_achieved;
            EXIT WHEN cursor_students%notfound;
            dbms_output.put_line('STUDENT ID: '
                                 || student_id
                                 || ' - STUDENT NAME: '
                                 || student_name
                                 || ' - STUDENT ADDRESS: '
                                 || student_address
                                 || ' - STUDENT POST CODE: '
                                 || student_post_code
                                 || ' - STUDENT EMAIL: '
                                 || student_email
                                 || ' - STUDENT MOBILE NUMBER: '
                                 || student_mobile_number
                                 || ' - COURSE ACHIEVED: '
                                 || course_student_achieved);

        END LOOP;
    END IF;

    dbms_output.put_line('==================================================================================================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to print the course students that achieved the course
CREATE OR REPLACE PROCEDURE prc_fnc_get_course_students_achieved (
    id_course_parameter course.id%TYPE
) IS

    cursor_students          SYS_REFCURSOR;
    student_id               INT;
    student_name             VARCHAR2(50);
    student_address          VARCHAR2(50);
    student_post_code        VARCHAR2(6);
    student_email            VARCHAR2(50);
    student_mobile_number    VARCHAR2(16);
    course_student_achieved  VARCHAR2(3);
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '==================================================================================================================================================================================================================');

    dbms_output.put_line('Students That Achieved the Course ID: ' || id_course_parameter);
    dbms_output.put_line('==================================================================================================================================================================================================================');
    cursor_students := fnc_get_course_students_achieved(id_course_parameter);
    IF cursor_students IS NOT NULL THEN
        LOOP
            FETCH cursor_students INTO
                student_id,
                student_name,
                student_address,
                student_post_code,
                student_email,
                student_mobile_number,
                course_student_achieved;
            EXIT WHEN cursor_students%notfound;
            dbms_output.put_line('STUDENT ID: '
                                 || student_id
                                 || ' - STUDENT NAME: '
                                 || student_name
                                 || ' - STUDENT ADDRESS: '
                                 || student_address
                                 || ' - STUDENT POST CODE: '
                                 || student_post_code
                                 || ' - STUDENT EMAIL: '
                                 || student_email
                                 || ' - STUDENT MOBILE NUMBER: '
                                 || student_mobile_number
                                 || ' - COURSE ACHIEVED: '
                                 || course_student_achieved);

        END LOOP;
    END IF;

    dbms_output.put_line('==================================================================================================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to print the course students that no achieved the course
CREATE OR REPLACE PROCEDURE prc_fnc_get_course_students_no_achieved (
    id_course_parameter course.id%TYPE
) IS

    cursor_students          SYS_REFCURSOR;
    student_id               INT;
    student_name             VARCHAR2(50);
    student_address          VARCHAR2(50);
    student_post_code        VARCHAR2(6);
    student_email            VARCHAR2(50);
    student_mobile_number    VARCHAR2(16);
    course_student_achieved  VARCHAR2(3);
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '==================================================================================================================================================================================================================');

    dbms_output.put_line('Students That No Achieved the Course ID: ' || id_course_parameter);
    dbms_output.put_line('==================================================================================================================================================================================================================');
    cursor_students := fnc_get_course_students_no_achieved(id_course_parameter);
    IF cursor_students IS NOT NULL THEN
        LOOP
            FETCH cursor_students INTO
                student_id,
                student_name,
                student_address,
                student_post_code,
                student_email,
                student_mobile_number,
                course_student_achieved;
            EXIT WHEN cursor_students%notfound;
            dbms_output.put_line('STUDENT ID: '
                                 || student_id
                                 || ' - STUDENT NAME: '
                                 || student_name
                                 || ' - STUDENT ADDRESS: '
                                 || student_address
                                 || ' - STUDENT POST CODE: '
                                 || student_post_code
                                 || ' - STUDENT EMAIL: '
                                 || student_email
                                 || ' - STUDENT MOBILE NUMBER: '
                                 || student_mobile_number
                                 || ' - COURSE ACHIEVED: '
                                 || course_student_achieved);

        END LOOP;
    END IF;

    dbms_output.put_line('==================================================================================================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to print the course schedules
CREATE OR REPLACE PROCEDURE prc_fnc_get_course_schedules (
    id_course_parameter course.id%TYPE
) IS

    cursor_schedules       SYS_REFCURSOR;
    schedule_id            INT;
    schedule_day_hour      NUMBER;
    schedule_week_day      VARCHAR(100);
    venue_id               INT;
    venue_name             VARCHAR(100);
    venue_address          VARCHAR(200);
    venue_post_code        VARCHAR(200);
    venue_email            VARCHAR(200);
    venue_mobile_number    VARCHAR(20);
    venue_google_map_link  VARCHAR(200);
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '=================================================================================================================================================================================================================================================================================================================');

    dbms_output.put_line('Schedules of Course ID: ' || id_course_parameter);
    dbms_output.put_line('=================================================================================================================================================================================================================================================================================================================');
    cursor_schedules := fnc_get_course_schedules(id_course_parameter);
    IF cursor_schedules IS NOT NULL THEN
        LOOP
            FETCH cursor_schedules INTO
                schedule_id,
                schedule_day_hour,
                schedule_week_day,
                venue_id,
                venue_name,
                venue_address,
                venue_post_code,
                venue_email,
                venue_mobile_number,
                venue_google_map_link;

            EXIT WHEN cursor_schedules%notfound;
            dbms_output.put_line('SCHEDULE ID: '
                                 || schedule_id
                                 || ' - SCHEDULE DAY HOUR: '
                                 || schedule_day_hour
                                 || ' - SCHEDULE WEEK DAY: '
                                 || schedule_week_day
                                 || ' - VENUE ID: '
                                 || venue_id
                                 || ' - VENUE NAME: '
                                 || venue_name
                                 || ' - VENUE ADDRESS: '
                                 || venue_address
                                 || ' - VENUE POST CODE: '
                                 || venue_post_code
                                 || ' - VENUE EMAIL: '
                                 || venue_email
                                 || ' - VENUE MOBILE NUMBER: '
                                 || venue_mobile_number
                                 || ' - VENUE GOOGLE MAP LINK: '
                                 || venue_google_map_link);

        END LOOP;
    END IF;

    dbms_output.put_line('=================================================================================================================================================================================================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to print the venue courses
CREATE OR REPLACE PROCEDURE prc_fnc_get_venue_courses (
    id_venue_parameter course.id%TYPE
) IS
    cursor_courses  SYS_REFCURSOR;
    venue_course    course%rowtype;
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '=================================================================================================================================================================================================================================================================================================================');

    dbms_output.put_line('Courses of Venue ID: ' || id_venue_parameter);
    dbms_output.put_line('=================================================================================================================================================================================================================================================================================================================');
    cursor_courses := fnc_get_venue_courses(id_venue_parameter);
    IF cursor_courses IS NOT NULL THEN
        LOOP
            FETCH cursor_courses INTO venue_course;
            EXIT WHEN cursor_courses%notfound;
            dbms_output.put_line('COURSE ID: '
                                 || venue_course.id
                                 || ' - COURSE NAME: '
                                 || venue_course.name
                                 || ' - COURSE DATE: '
                                 || venue_course.course_date
                                 || ' - COURSE COST: '
                                 || venue_course.cost
                                 || '£ - COURSE DURATION: '
                                 || venue_course.duration_in_hours
                                 || 'h');

        END LOOP;
    END IF;

    dbms_output.put_line('=================================================================================================================================================================================================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to print the courses with a cost bigger than x
CREATE OR REPLACE PROCEDURE prc_fnc_get_courses_cost (
    course_cost NUMBER
) IS
    cursor_courses           SYS_REFCURSOR;
    course_with_bigger_cost  course%rowtype;
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '=================================================================================================================================================================================================================================================================================================================');

    dbms_output.put_line('Courses with a cost bigger than '
                         || course_cost
                         || 'Â£: ');
    dbms_output.put_line('=================================================================================================================================================================================================================================================================================================================');
    cursor_courses := fnc_get_courses_cost(course_cost);
    IF cursor_courses IS NOT NULL THEN
        LOOP
            FETCH cursor_courses INTO course_with_bigger_cost;
            EXIT WHEN cursor_courses%notfound;
            dbms_output.put_line('COURSE ID: '
                                 || course_with_bigger_cost.id
                                 || ' - COURSE NAME: '
                                 || course_with_bigger_cost.name
                                 || ' - COURSE DATE: '
                                 || course_with_bigger_cost.course_date
                                 || ' - COURSE COST: '
                                 || course_with_bigger_cost.cost
                                 || '£ - COURSE DURATION: '
                                 || course_with_bigger_cost.duration_in_hours
                                 || 'h');

        END LOOP;
    END IF;

    dbms_output.put_line('=================================================================================================================================================================================================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to print the courses with a duration bigger than x
CREATE OR REPLACE PROCEDURE prc_fnc_get_courses_duration (
    course_duration NUMBER
) IS
    cursor_courses               SYS_REFCURSOR;
    course_with_bigger_duration  course%rowtype;
BEGIN
    dbms_output.put_line(chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || chr(10)
                         || '=================================================================================================================================================================================================================================================================================================================');

    dbms_output.put_line('Courses with a duration bigger than '
                         || course_duration
                         || ' hours: ');
    dbms_output.put_line('=================================================================================================================================================================================================================================================================================================================');
    cursor_courses := fnc_get_courses_duration(course_duration);
    IF cursor_courses IS NOT NULL THEN
        LOOP
            FETCH cursor_courses INTO course_with_bigger_duration;
            EXIT WHEN cursor_courses%notfound;
            dbms_output.put_line('COURSE ID: '
                                 || course_with_bigger_duration.id
                                 || ' - COURSE NAME: '
                                 || course_with_bigger_duration.name
                                 || ' - COURSE DATE: '
                                 || course_with_bigger_duration.course_date
                                 || ' - COURSE COST: '
                                 || course_with_bigger_duration.cost
                                 || '£ - COURSE DURATION: '
                                 || course_with_bigger_duration.duration_in_hours
                                 || 'h');

        END LOOP;
    END IF;

    dbms_output.put_line('=================================================================================================================================================================================================================================================================================================================');
    dbms_output.put_line(' ');
    dbms_output.put_line(' ');
END;
/ 

--##################################################################################################################################################################################

--Procedure to add a Course
CREATE OR REPLACE PROCEDURE prc_add_course (
    course_name               VARCHAR2,
    course_date               VARCHAR2,
    course_cost               NUMBER,
    course_duration_in_hours  NUMBER
) AS
BEGIN
    INSERT INTO course VALUES (
        seq_course.NEXTVAL,
        course_name,
        to_date(course_date, 'YYYY-MM-DD'),
        course_cost,
        course_duration_in_hours
    );

END;
/ 

--##################################################################################################################################################################################

--Procedure to add a Student
CREATE OR REPLACE PROCEDURE prc_add_student (
    student_name           VARCHAR2,
    student_address        VARCHAR2,
    student_post_code      VARCHAR2,
    student_email          VARCHAR2,
    student_mobile_number  VARCHAR2
) AS
BEGIN
    INSERT INTO student VALUES (
        seq_student.NEXTVAL,
        student_name,
        student_address,
        student_post_code,
        student_email,
        student_mobile_number
    );

END;
/ 

--##################################################################################################################################################################################

--Procedure to add a Venue
CREATE OR REPLACE PROCEDURE prc_add_venue (
    venue_name             VARCHAR2,
    venue_address          VARCHAR2,
    venue_post_code        VARCHAR2,
    venue_email            VARCHAR2,
    venue_mobile_number    VARCHAR2,
    venue_google_map_link  VARCHAR2
) AS
BEGIN
    INSERT INTO venue VALUES (
        seq_venue.NEXTVAL,
        venue_name,
        venue_address,
        venue_post_code,
        venue_email,
        venue_mobile_number,
        venue_google_map_link
    );

END;
/ 

--##################################################################################################################################################################################

--Procedure to add a Schedule
CREATE OR REPLACE PROCEDURE prc_add_schedule (
    schedule_day_hour  NUMBER,
    schedule_week_day  VARCHAR2
) AS
BEGIN
    INSERT INTO schedule VALUES (
        seq_schedule.NEXTVAL,
        schedule_day_hour,
        schedule_week_day
    );

END;
/ 

--##################################################################################################################################################################################

--Procedure to add a Assessor
CREATE OR REPLACE PROCEDURE prc_add_assessor (
    assessor_course_id      NUMBER,
    assessor_name           VARCHAR2,
    assessor_address        VARCHAR2,
    assessor_post_code      VARCHAR2,
    assessor_email          VARCHAR2,
    assessor_mobile_number  VARCHAR2,
    assessor_manager_name   VARCHAR2
) AS
BEGIN
    INSERT INTO assessor VALUES (
        seq_assessor.NEXTVAL,
        assessor_course_id,
        assessor_name,
        assessor_address,
        assessor_post_code,
        assessor_email,
        assessor_mobile_number,
        assessor_manager_name
    );

END;
/

--##################################################################################################################################################################################

--Procedure to add a a Course Student
CREATE OR REPLACE PROCEDURE prc_add_course_student (
    course_student_course_id   NUMBER,
    course_student_student_id  NUMBER
) AS
BEGIN
    INSERT INTO course_student VALUES (
        course_student_course_id,
        course_student_student_id,
        'NO'
    );

END;
/

--##################################################################################################################################################################################

--Procedure to add a Course Schedule in a Venue
CREATE OR REPLACE PROCEDURE prc_add_course_schedule_venue (
    course_schedule_venue_course_id    NUMBER,
    course_schedule_venue_schedule_id  NUMBER,
    course_schedule_venue_venue_id     NUMBER
) AS
BEGIN
    INSERT INTO course_schedule_venue VALUES (
        course_schedule_venue_course_id,
        course_schedule_venue_schedule_id,
        course_schedule_venue_venue_id
    );

END;
/

--##################################################################################################################################################################################

--Procedure to Update Student Email
CREATE OR REPLACE PROCEDURE prc_update_student_email (
    student_id     NUMBER,
    student_email  VARCHAR2
) AS
BEGIN
    UPDATE student
    SET
        email = student_email
    WHERE
        student.id = student_id;

END;
/
--##################################################################################################################################################################################

--Procedure to Update Student Address and Post-Code
CREATE OR REPLACE PROCEDURE prc_update_student_address_post_code (
    student_id         NUMBER,
    student_address    VARCHAR2,
    student_post_code  VARCHAR2
) AS
BEGIN
    UPDATE student
    SET
        address = student_address,
        post_code = student_post_code
    WHERE
        student.id = student_id;

END;
/
--##################################################################################################################################################################################

--Procedure to Update Student Name
CREATE OR REPLACE PROCEDURE prc_update_student_name (
    student_id    NUMBER,
    student_name  VARCHAR2
) AS
BEGIN
    UPDATE student
    SET
        name = student_name
    WHERE
        student.id = student_id;

END;
/
--##################################################################################################################################################################################

--Procedure to Update Student Mobile Number
CREATE OR REPLACE PROCEDURE prc_update_student_mobile_number (
    student_id             NUMBER,
    student_mobile_number  VARCHAR2
) AS
BEGIN
    UPDATE student
    SET
        mobile_number = student_mobile_number
    WHERE
        student.id = student_id;

END;
/
--##################################################################################################################################################################################

--Procedure to Update Course Student Achieved
CREATE OR REPLACE PROCEDURE prc_update_course_student_achieved (
    course_student_course_id   NUMBER,
    course_student_student_id  NUMBER,
    course_student_achieved    VARCHAR2
) AS
BEGIN
    UPDATE course_student
    SET
        achieved = course_student_achieved
    WHERE
            course_student.course_id = course_student_course_id
        AND course_student.student_id = course_student_student_id;

END;
/
--##################################################################################################################################################################################

--Procedure to Remove Assessor
CREATE OR REPLACE PROCEDURE prc_remove_assessor (
    assessor_id NUMBER
) AS
BEGIN
    DELETE FROM assessor
    WHERE
        assessor.id = assessor_id;

END;
/
--##################################################################################################################################################################################

COMMIT;