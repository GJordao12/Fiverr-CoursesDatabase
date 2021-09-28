-- Queries File --

--See All Courses
SELECT
    *
FROM
    course;

--##################################################################################################################################################################################

--See All Students
SELECT
    *
FROM
    student;

--##################################################################################################################################################################################

--See All Venues
SELECT
    *
FROM
    venue;

--##################################################################################################################################################################################

--See All Schedules
SELECT
    *
FROM
    schedule;

--##################################################################################################################################################################################

--See All Assessores
SELECT
    *
FROM
    assessor;

--##################################################################################################################################################################################

--See All Course Students
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

--##################################################################################################################################################################################

--See All Course Schedules in All Venues
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

COMMIT;