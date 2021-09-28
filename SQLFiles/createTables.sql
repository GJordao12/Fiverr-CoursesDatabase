-- Create Tables File --

--Delete all schema tables
BEGIN
    FOR r IN (
        SELECT
            'drop table '
            || table_name
            || ' cascade constraints' cmd
        FROM
            user_tables
        ORDER BY
            table_name
    ) LOOP
        EXECUTE IMMEDIATE ( r.cmd );
    END LOOP;
END;
/ 

--##################################################################################################################################################################################

--Create table COURSE
CREATE TABLE course (
    id                 INT
        CONSTRAINT pk_course PRIMARY KEY,
    name               VARCHAR2(50)
        CONSTRAINT nn_course_name NOT NULL,
    course_date        DATE
        CONSTRAINT nn_course_date NOT NULL,
    cost               NUMBER
        CONSTRAINT nn_course_cost NOT NULL,
    duration_in_hours  NUMBER
        CONSTRAINT nn_course_duration_in_hours NOT NULL
);

--##################################################################################################################################################################################

--Create Table STUDENT
CREATE TABLE student (
    id             INT
        CONSTRAINT pk_student PRIMARY KEY,
    name           VARCHAR2(50)
        CONSTRAINT nn_student_name NOT NULL,
    address        VARCHAR2(50)
        CONSTRAINT nn_student_address NOT NULL,
    post_code      VARCHAR(6)
        CONSTRAINT ck_student_post_code CHECK ( REGEXP_LIKE ( post_code,
                                                              '^\w{1}\d{1} \d{1}\w{2}$' )
                                                OR REGEXP_LIKE ( post_code,
                                                                 '^\w{1}\d{1}\d{1}\w{2}$' ) ),
    email          VARCHAR2(50)
        CONSTRAINT un_student_email UNIQUE,
    CONSTRAINT ck_student_email CHECK ( email LIKE '%@%.com'
                                        OR email LIKE '%@%.pt' ),
    mobile_number  VARCHAR2(16)
        CONSTRAINT un_student_mobile_number UNIQUE,
    CONSTRAINT ck_student_mobile_number CHECK ( REGEXP_LIKE ( mobile_number,
                                                              '^\+44 \d{10}$' )
                                                OR REGEXP_LIKE ( mobile_number,
                                                                 '^\+44\d{10}$' )
                                                OR REGEXP_LIKE ( mobile_number,
                                                                 '^\d{10}$' )
                                                OR REGEXP_LIKE ( mobile_number,
                                                                 '^\d{4} \d{3} \d{3}$' )
                                                OR REGEXP_LIKE ( mobile_number,
                                                                 '^\+44 \d{4} \d{3} \d{3}$' ) )
);

--##################################################################################################################################################################################

--Create table COURSE_STUDENT
CREATE TABLE course_student (
    course_id   INT
        CONSTRAINT fk_course_id
            REFERENCES course ( id ),
    student_id  INT
        CONSTRAINT fk_student_id
            REFERENCES student ( id ),
    achieved    VARCHAR(3)
        CONSTRAINT ck_student_achieved CHECK ( upper(achieved) LIKE 'YES'
                                               OR upper(achieved) LIKE 'NO' )
);

--##################################################################################################################################################################################

--Create Table VENUE
CREATE TABLE venue (
    id               INT
        CONSTRAINT pk_venue PRIMARY KEY,
    name             VARCHAR2(50)
        CONSTRAINT nn_venue_name NOT NULL,
    address          VARCHAR2(50)
        CONSTRAINT nn_venue_address NOT NULL,
    post_code        VARCHAR(6)
        CONSTRAINT ck_venue_post_code CHECK ( REGEXP_LIKE ( post_code,
                                                            '^\w{1}\d{1} \d{1}\w{2}$' )
                                              OR REGEXP_LIKE ( post_code,
                                                               '^\w{1}\d{1}\d{1}\w{2}$' ) ),
    email            VARCHAR2(50)
        CONSTRAINT un_venue_email UNIQUE,
    CONSTRAINT ck_venue_email CHECK ( email LIKE '%@%.com'
                                      OR email LIKE '%@%.pt' ),
    mobile_number    VARCHAR2(16)
        CONSTRAINT un_venue_mobile_number UNIQUE,
    CONSTRAINT ck_venue_mobile_numbercheck CHECK ( REGEXP_LIKE ( mobile_number,
                                                                 '^\+44 \d{10}$' )
                                                   OR REGEXP_LIKE ( mobile_number,
                                                                    '^\+44\d{10}$' )
                                                   OR REGEXP_LIKE ( mobile_number,
                                                                    '^\d{10}$' )
                                                   OR REGEXP_LIKE ( mobile_number,
                                                                    '^\d{4} \d{3} \d{3}$' )
                                                   OR REGEXP_LIKE ( mobile_number,
                                                                    '^\+44 \d{4} \d{3} \d{3}$' ) ),
    google_map_link  VARCHAR(250)
        CONSTRAINT un_venue_google_map_link UNIQUE,
    CONSTRAINT ck_venue_google_map_link CHECK ( REGEXP_LIKE ( google_map_link,
                                                              '^https://www.google.pt/maps/place/(\w|\d)+$' ) )
);

--##################################################################################################################################################################################

--Create Table SCHEDULE
CREATE TABLE schedule (
    id        INT
        CONSTRAINT pk_schedule PRIMARY KEY,
    day_hour  INT
        CONSTRAINT nn_schedule_hours NOT NULL,
    CONSTRAINT ck_schedule_hours CHECK ( day_hour <= 24
                                         AND day_hour > 0 ),
    week_day  VARCHAR2(9)
        CONSTRAINT ck_schedule_week_day CHECK ( upper(week_day) LIKE 'MONDAY'
                                                OR upper(week_day) LIKE 'TUESDAY'
                                                OR upper(week_day) LIKE 'WEDNESDAY'
                                                OR upper(week_day) LIKE 'THURSDAY'
                                                OR upper(week_day) LIKE 'FRIDAY'
                                                OR upper(week_day) LIKE 'SATURDAY'
                                                OR upper(week_day) LIKE 'SUNDAY' )
);

--##################################################################################################################################################################################

--Create Table COURSE_SCHEDULE_VENUE
CREATE TABLE course_schedule_venue (
    course_id    INT
        CONSTRAINT fk_course_schedule_venue_course_id
            REFERENCES course ( id ),
    schedule_id  INT
        CONSTRAINT fk_course_schedule_venue_schedule_id
            REFERENCES schedule ( id ),
    venue_id     INT
        CONSTRAINT fk_course_schedule_venue_venue_id
            REFERENCES venue ( id )
);

--##################################################################################################################################################################################

--Create Table ASSESSOR
CREATE TABLE assessor (
    id             INT
        CONSTRAINT pk_assessor PRIMARY KEY,
    course_id      INT
        CONSTRAINT fk_assessor_course_id
            REFERENCES course ( id ),
    name           VARCHAR2(50)
        CONSTRAINT nn_assessor_name NOT NULL,
    address        VARCHAR2(50)
        CONSTRAINT nn_assessor_address NOT NULL,
    post_code      VARCHAR(6)
        CONSTRAINT ck_assessor_post_code CHECK ( REGEXP_LIKE ( post_code,
                                                               '^\w{1}\d{1} \d{1}\w{2}$' )
                                                 OR REGEXP_LIKE ( post_code,
                                                                  '^\w{1}\d{1}\d{1}\w{2}$' ) ),
    email          VARCHAR2(50)
        CONSTRAINT un_assessor_email UNIQUE,
    CONSTRAINT ck_assessor_email CHECK ( email LIKE '%@%.com'
                                         OR email LIKE '%@%.pt' ),
    mobile_number  VARCHAR2(16)
        CONSTRAINT un_assessor_mobile_number UNIQUE,
    CONSTRAINT ck_assessor_mobile_numbercheck CHECK ( REGEXP_LIKE ( mobile_number,
                                                                    '^\+44 \d{10}$' )
                                                      OR REGEXP_LIKE ( mobile_number,
                                                                       '^\+44\d{10}$' )
                                                      OR REGEXP_LIKE ( mobile_number,
                                                                       '^\d{10}$' )
                                                      OR REGEXP_LIKE ( mobile_number,
                                                                       '^\d{4} \d{3} \d{3}$' )
                                                      OR REGEXP_LIKE ( mobile_number,
                                                                       '^\+44 \d{4} \d{3} \d{3}$' ) ),
    manager_name   VARCHAR2(50)
        CONSTRAINT nn_assessor_manager_name NOT NULL
);

--##################################################################################################################################################################################

--Sequences
     DECLARE
    v_cmd VARCHAR(2000);
BEGIN
    FOR r IN (
        SELECT
            sequence_name
        FROM
            user_sequences
    ) LOOP
        v_cmd := 'drop sequence ' || r.sequence_name;
        EXECUTE IMMEDIATE ( v_cmd );
    END LOOP;

    FOR r IN (
        SELECT
            table_name
        FROM
            user_tables
    ) LOOP
        v_cmd := 'create sequence seq_' || r.table_name;
        EXECUTE IMMEDIATE ( v_cmd );
    END LOOP;

END;
/

COMMIT;