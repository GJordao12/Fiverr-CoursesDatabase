-- Functions File --

--Set Sever Output On
SET SERVEROUTPUT ON;

--Get All Courses of One Student
CREATE OR REPLACE FUNCTION fnc_get_student_courses (
    id_student_parameter student.id%TYPE
) RETURN SYS_REFCURSOR IS
    cursor_courses  SYS_REFCURSOR;
    valor_null EXCEPTION;
    id_no_exists EXCEPTION;
    find            INT;
BEGIN
    --check parameter null
    IF id_student_parameter IS NULL THEN
        RAISE valor_null;
    END IF;

    SELECT
        COUNT(*)
    INTO find
    FROM
        student
    WHERE
        id = id_student_parameter;

    --check if the id exists
    IF ( find = 0 ) THEN
        RAISE id_no_exists;
    END IF;
    OPEN cursor_courses FOR SELECT
                                course.id,
                                course.name,
                                course.course_date,
                                course.cost,
                                course.duration_in_hours,
                                course_student.achieved
                            FROM
                                     course_student
                                INNER JOIN course ON course_student.course_id = course.id
                            WHERE
                                course_student.student_id = id_student_parameter
                            ORDER BY course.id;

    RETURN cursor_courses;
EXCEPTION
    WHEN id_no_exists THEN
        dbms_output.put_line('ERROR: Not Found Student with the ID: ' || id_student_parameter);
        RETURN NULL;
    WHEN valor_null THEN
        dbms_output.put_line('ERROR: Parameter NULL!');
        RETURN NULL;
END;
/

--##################################################################################################################################################################################

--Get All Courses Achieved of One Student
CREATE OR REPLACE FUNCTION fnc_get_student_courses_achieved (
    id_student_parameter student.id%TYPE
) RETURN SYS_REFCURSOR IS
    cursor_courses  SYS_REFCURSOR;
    valor_null EXCEPTION;
    id_no_exists EXCEPTION;
    find            INT;
BEGIN
    --check parameter null
    IF id_student_parameter IS NULL THEN
        RAISE valor_null;
    END IF;

    SELECT
        COUNT(*)
    INTO find
    FROM
        student
    WHERE
        id = id_student_parameter;

    --check if the id exists
    IF ( find = 0 ) THEN
        RAISE id_no_exists;
    END IF;
    OPEN cursor_courses FOR SELECT
                                course.id,
                                course.name,
                                course.course_date,
                                course.cost,
                                course.duration_in_hours,
                                course_student.achieved
                            FROM
                                     course_student
                                INNER JOIN course ON course_student.course_id = course.id
                            WHERE
                                    course_student.student_id = id_student_parameter
                                AND upper(course_student.achieved) LIKE 'YES'
                            ORDER BY course.id;

    RETURN cursor_courses;
EXCEPTION
    WHEN id_no_exists THEN
        dbms_output.put_line('ERROR: Not Found Student with the ID: ' || id_student_parameter);
        RETURN NULL;
    WHEN valor_null THEN
        dbms_output.put_line('ERROR: Parameter NULL!');
        RETURN NULL;
END;
/

--##################################################################################################################################################################################

--Get All Courses No Achieved of One Student
CREATE OR REPLACE FUNCTION fnc_get_student_courses_no_achieved (
    id_student_parameter student.id%TYPE
) RETURN SYS_REFCURSOR IS
    cursor_courses  SYS_REFCURSOR;
    valor_null EXCEPTION;
    id_no_exists EXCEPTION;
    find            INT;
BEGIN
    --check parameter null
    IF id_student_parameter IS NULL THEN
        RAISE valor_null;
    END IF;

    SELECT
        COUNT(*)
    INTO find
    FROM
        student
    WHERE
        id = id_student_parameter;

    --check if the id exists
    IF ( find = 0 ) THEN
        RAISE id_no_exists;
    END IF;
    OPEN cursor_courses FOR SELECT
                                course.id,
                                course.name,
                                course.course_date,
                                course.cost,
                                course.duration_in_hours,
                                course_student.achieved
                            FROM
                                     course_student
                                INNER JOIN course ON course_student.course_id = course.id
                            WHERE
                                    course_student.student_id = id_student_parameter
                                AND upper(course_student.achieved) LIKE 'NO'
                            ORDER BY course.id;

    RETURN cursor_courses;
EXCEPTION
    WHEN id_no_exists THEN
        dbms_output.put_line('ERROR: Not Found Student with the ID: ' || id_student_parameter);
        RETURN NULL;
    WHEN valor_null THEN
        dbms_output.put_line('ERROR: Parameter NULL!');
        RETURN NULL;
END;
/

--##################################################################################################################################################################################

--Get All Course Students
CREATE OR REPLACE FUNCTION fnc_get_course_students (
    id_course_parameter course.id%TYPE
) RETURN SYS_REFCURSOR IS
    cursor_students  SYS_REFCURSOR;
    valor_null EXCEPTION;
    id_no_exists EXCEPTION;
    find             INT;
BEGIN
    --check parameter null
    IF id_course_parameter IS NULL THEN
        RAISE valor_null;
    END IF;

    SELECT
        COUNT(*)
    INTO find
    FROM
        course
    WHERE
        id = id_course_parameter;

    --check if the id exists
    IF ( find = 0 ) THEN
        RAISE id_no_exists;
    END IF;
    OPEN cursor_students FOR SELECT
                                 student.id,
                                 student.name,
                                 student.address,
                                 student.post_code,
                                 student.email,
                                 student.mobile_number,
                                 course_student.achieved
                             FROM
                                      course_student
                                 INNER JOIN student ON course_student.student_id = student.id
                             WHERE
                                 course_student.course_id = id_course_parameter
                             ORDER BY student.id;

    RETURN cursor_students;
EXCEPTION
    WHEN id_no_exists THEN
        dbms_output.put_line('ERROR: Not Found Course with the ID: ' || id_course_parameter);
        RETURN NULL;
    WHEN valor_null THEN
        dbms_output.put_line('ERROR: Parameter NULL!');
        RETURN NULL;
END;
/

--##################################################################################################################################################################################

--Get All Student that Achieved the Course
CREATE OR REPLACE FUNCTION fnc_get_course_students_achieved (
    id_course_parameter course.id%TYPE
) RETURN SYS_REFCURSOR IS
    cursor_students  SYS_REFCURSOR;
    valor_null EXCEPTION;
    id_no_exists EXCEPTION;
    find             INT;
BEGIN
    --check parameter null
    IF id_course_parameter IS NULL THEN
        RAISE valor_null;
    END IF;

    SELECT
        COUNT(*)
    INTO find
    FROM
        course
    WHERE
        id = id_course_parameter;

    --check if the id exists
    IF ( find = 0 ) THEN
        RAISE id_no_exists;
    END IF;
    OPEN cursor_students FOR SELECT
                                 student.id,
                                 student.name,
                                 student.address,
                                 student.post_code,
                                 student.email,
                                 student.mobile_number,
                                 course_student.achieved
                             FROM
                                      course_student
                                 INNER JOIN student ON course_student.student_id = student.id
                             WHERE
                                     course_student.course_id = id_course_parameter
                                 AND upper(course_student.achieved) LIKE 'YES'
                             ORDER BY student.id;

    RETURN cursor_students;
EXCEPTION
    WHEN id_no_exists THEN
        dbms_output.put_line('ERROR: Not Found Course with the ID: ' || id_course_parameter);
        RETURN NULL;
    WHEN valor_null THEN
        dbms_output.put_line('ERROR: Parameter NULL!');
        RETURN NULL;
END;
/

--##################################################################################################################################################################################

--Get All Student that No Achieved the Course
CREATE OR REPLACE FUNCTION fnc_get_course_students_no_achieved (
    id_course_parameter course.id%TYPE
) RETURN SYS_REFCURSOR IS
    cursor_students  SYS_REFCURSOR;
    valor_null EXCEPTION;
    id_no_exists EXCEPTION;
    find             INT;
BEGIN
    --check parameter null
    IF id_course_parameter IS NULL THEN
        RAISE valor_null;
    END IF;

    SELECT
        COUNT(*)
    INTO find
    FROM
        course
    WHERE
        id = id_course_parameter;

    --check if id exists
    IF ( find = 0 ) THEN
        RAISE id_no_exists;
    END IF;
    OPEN cursor_students FOR SELECT
                                 student.id,
                                 student.name,
                                 student.address,
                                 student.post_code,
                                 student.email,
                                 student.mobile_number,
                                 course_student.achieved
                             FROM
                                      course_student
                                 INNER JOIN student ON course_student.student_id = student.id
                             WHERE
                                     course_student.course_id = id_course_parameter
                                 AND upper(course_student.achieved) LIKE 'NO'
                             ORDER BY student.id;

    RETURN cursor_students;
EXCEPTION
    WHEN id_no_exists THEN
        dbms_output.put_line('ERROR: Not Found Course with the ID: ' || id_course_parameter);
        RETURN NULL;
    WHEN valor_null THEN
        dbms_output.put_line('ERROR: Parameter NULL!');
        RETURN NULL;
END;
/

--##################################################################################################################################################################################

--Get All Schedules Course
CREATE OR REPLACE FUNCTION fnc_get_course_schedules (
    id_course_parameter course.id%TYPE
) RETURN SYS_REFCURSOR IS
    cursor_schedules  SYS_REFCURSOR;
    valor_null EXCEPTION;
    id_no_exists EXCEPTION;
    find              INT;
BEGIN
    --check parameter null
    IF id_course_parameter IS NULL THEN
        RAISE valor_null;
    END IF;

    SELECT
        COUNT(*)
    INTO find
    FROM
        course
    WHERE
        id = id_course_parameter;

    --check if the id exists
    IF ( find = 0 ) THEN
        RAISE id_no_exists;
    END IF;
    OPEN cursor_schedules FOR SELECT
                                  schedule.id,
                                  schedule.day_hour,
                                  schedule.week_day,
                                  venue.id,
                                  venue.name,
                                  venue.address,
                                  venue.post_code,
                                  venue.email,
                                  venue.mobile_number,
                                  venue.google_map_link
                              FROM
                                       course_schedule_venue
                                  INNER JOIN schedule ON course_schedule_venue.schedule_id = schedule.id
                                  INNER JOIN venue ON course_schedule_venue.venue_id = venue.id
                              WHERE
                                  course_schedule_venue.course_id = id_course_parameter
                              ORDER BY schedule.id,venue.id;

    RETURN cursor_schedules;
EXCEPTION
    WHEN id_no_exists THEN
        dbms_output.put_line('ERROR: Not Found Course with the ID: ' || id_course_parameter);
        RETURN NULL;
    WHEN valor_null THEN
        dbms_output.put_line('ERROR: Parameter NULL!');
        RETURN NULL;
END;
/

--##################################################################################################################################################################################

--Get All Courses of One Venue
CREATE OR REPLACE FUNCTION fnc_get_venue_courses (
    id_venue_parameter course.id%TYPE
) RETURN SYS_REFCURSOR IS
    cursor_courses  SYS_REFCURSOR;
    valor_null EXCEPTION;
    id_no_exists EXCEPTION;
    find            INT;
BEGIN
    --check parameter null
    IF id_venue_parameter IS NULL THEN
        RAISE valor_null;
    END IF;

    SELECT
        COUNT(*)
    INTO find
    FROM
        venue
    WHERE
        id = id_venue_parameter;

    --check if the id exists
    IF ( find = 0 ) THEN
        RAISE id_no_exists;
    END IF;
    OPEN cursor_courses FOR SELECT DISTINCT
                                course.id,
                                course.name,
                                course.course_date,
                                course.cost,
                                course.duration_in_hours
                            FROM
                                     course_schedule_venue
                                INNER JOIN course ON course_schedule_venue.course_id = course.id
                            WHERE
                                course_schedule_venue.venue_id = id_venue_parameter
                            ORDER BY course.id;

    RETURN cursor_courses;
EXCEPTION
    WHEN id_no_exists THEN
        dbms_output.put_line('ERROR: Not Found Venue with the ID: ' || id_venue_parameter);
        RETURN NULL;
    WHEN valor_null THEN
        dbms_output.put_line('ERROR: Parameter NULL!');
        RETURN NULL;
END;
/

--##################################################################################################################################################################################

--Get All Courses with a cost bigger than x
CREATE OR REPLACE FUNCTION fnc_get_courses_cost (
    course_cost NUMBER
) RETURN SYS_REFCURSOR IS
    cursor_courses SYS_REFCURSOR;
BEGIN
    OPEN cursor_courses FOR SELECT
                                id,
                                name,
                                course_date,
                                cost,
                                duration_in_hours
                            FROM
                                course
                            WHERE
                                cost > course_cost
                            ORDER BY id;

    RETURN cursor_courses;
END;
/

--##################################################################################################################################################################################

--Get All Courses with a duration bigger than x
CREATE OR REPLACE FUNCTION fnc_get_courses_duration (
    course_duration NUMBER
) RETURN SYS_REFCURSOR IS
    cursor_courses SYS_REFCURSOR;
BEGIN
    OPEN cursor_courses FOR SELECT
                                id,
                                name,
                                course_date,
                                cost,
                                duration_in_hours
                            FROM
                                course
                            WHERE
                                duration_in_hours > course_duration
                            ORDER BY id;

    RETURN cursor_courses;
END;
/

--##################################################################################################################################################################################

COMMIT;