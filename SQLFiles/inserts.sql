-- Inserts File --

--Inserts COURSE
INSERT INTO COURSE VALUES (seq_course.nextval,'Course 1',TO_Date('2021-04-01','YYYY-MM-DD'),130,72);
INSERT INTO COURSE VALUES (seq_course.nextval,'Course 2',TO_Date('2021-04-01','YYYY-MM-DD'),150,72);
INSERT INTO COURSE VALUES (seq_course.nextval,'Course 3',TO_Date('2021-04-01','YYYY-MM-DD'),50.50,50);
INSERT INTO COURSE VALUES (seq_course.nextval,'Course 4',TO_Date('2021-04-01','YYYY-MM-DD'),320,120);
INSERT INTO COURSE VALUES (seq_course.nextval,'Course 5',TO_Date('2021-04-01','YYYY-MM-DD'),560,300);
INSERT INTO COURSE VALUES (seq_course.nextval,'Course 6',TO_Date('2021-04-01','YYYY-MM-DD'),75,60);

--##################################################################################################################################################################################

--Inserts STUDENT
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 1','Address','B1 1AA','student1@gmail.com','+441111111111');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 2','Address','B1 1AD','student2@gmail.com','+442222222222');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 3','Address','B1 1AG','student3@gmail.com','+443333333333');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 4','Address','B1 1AH','student4@gmail.com','+444444444444');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 5','Address','B1 1AQ','student5@gmail.com','+445555555555');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 6','Address','B1 1AT','student6@gmail.com','+446666666666');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 7','Address','B1 1AT','student7@gmail.com','+447777777777');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 8','Address','B1 1AZ','student8@gmail.com','+448888888888');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 9','Address','B1 1BA','student9@gmail.com','+449999999999');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 10','Address','B1 1BB','student10@gmail.com','+441222222222');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 11','Address','B1 1BD','student11@gmail.com','+441333333333');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 12','Address','B1 1BE','student12@gmail.com','+441444444444');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 13','Address','B1 1BF','student13@gmail.com','+441555555555');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 14','Address','B1 1BG','student14@gmail.com','+441666666666');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 15','Address','B1 1BH','student15@gmail.com','+441777777777');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 16','Address','B1 1BJ','student16@gmail.com','+441888888888');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 17','Address','B1 1BL','student17@gmail.com','+441999999999');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 18','Address','B1 1BN','student18@gmail.com','+442111111111');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 19','Address','B1 1BQ','student19@gmail.com','+440222222222');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 20','Address','B1 1BT','student20@gmail.com','+442333333333');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 21','Address','B1 1BU','student21@gmail.com','+442444444444');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 22','Address','B1 1BW','student22@gmail.com','+442555555555');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 23','Address','B1 1BX','student23@gmail.com','+442666666666');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 24','Address','B1 1BY','student24@gmail.com','+442777777777');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 25','Address','B1 1BZ','student25@gmail.com','+442888888888');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 26','Address','B1 1DA','student26@gmail.com','+442999999999');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 27','Address','B1 1DB','student27@gmail.com','+443111111111');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 28','Address','B1 1DD','student28@gmail.com','+443222222222');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 29','Address','B1 1DE','student29@gmail.com','+440333333333');
INSERT INTO STUDENT VALUES (seq_student.nextval,'Student 30','Address','B1 1DF','student30@gmail.com','+443444444444');

--##################################################################################################################################################################################

--Inserts COURSE_STUDENT
INSERT INTO COURSE_STUDENT VALUES(1,1,'NO');
INSERT INTO COURSE_STUDENT VALUES(1,2,'NO');
INSERT INTO COURSE_STUDENT VALUES(1,24,'YES');
INSERT INTO COURSE_STUDENT VALUES(1,3,'NO');
INSERT INTO COURSE_STUDENT VALUES(1,4,'YES');
INSERT INTO COURSE_STUDENT VALUES(1,5,'NO');
INSERT INTO COURSE_STUDENT VALUES(2,6,'NO');
INSERT INTO COURSE_STUDENT VALUES(2,7,'NO');
INSERT INTO COURSE_STUDENT VALUES(2,8,'YES');
INSERT INTO COURSE_STUDENT VALUES(2,1,'YES');
INSERT INTO COURSE_STUDENT VALUES(2,9,'NO');
INSERT INTO COURSE_STUDENT VALUES(2,10,'NO');
INSERT INTO COURSE_STUDENT VALUES(3,11,'NO');
INSERT INTO COURSE_STUDENT VALUES(3,12,'NO');
INSERT INTO COURSE_STUDENT VALUES(3,13,'NO');
INSERT INTO COURSE_STUDENT VALUES(3,30,'YES');
INSERT INTO COURSE_STUDENT VALUES(3,14,'NO');
INSERT INTO COURSE_STUDENT VALUES(3,15,'NO');
INSERT INTO COURSE_STUDENT VALUES(4,16,'NO');
INSERT INTO COURSE_STUDENT VALUES(4,17,'YES');
INSERT INTO COURSE_STUDENT VALUES(4,18,'NO');
INSERT INTO COURSE_STUDENT VALUES(4,19,'NO');
INSERT INTO COURSE_STUDENT VALUES(4,20,'NO');
INSERT INTO COURSE_STUDENT VALUES(5,21,'NO');
INSERT INTO COURSE_STUDENT VALUES(5,4,'YES');
INSERT INTO COURSE_STUDENT VALUES(5,22,'NO');
INSERT INTO COURSE_STUDENT VALUES(5,23,'NO');
INSERT INTO COURSE_STUDENT VALUES(5,24,'YES');
INSERT INTO COURSE_STUDENT VALUES(5,25,'NO');
INSERT INTO COURSE_STUDENT VALUES(6,26,'NO');
INSERT INTO COURSE_STUDENT VALUES(6,27,'NO');
INSERT INTO COURSE_STUDENT VALUES(6,28,'NO');
INSERT INTO COURSE_STUDENT VALUES(6,12,'YES');
INSERT INTO COURSE_STUDENT VALUES(6,29,'YES');
INSERT INTO COURSE_STUDENT VALUES(6,30,'NO');

--##################################################################################################################################################################################

--Inserts VENUE
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 1','Address','B1 1AA', 'venue1@gmail.com', '+44 1234 123 121','https://www.google.pt/maps/place/Venue1');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 2','Address','B1 1DA', 'venue2@gmail.com', '+44 1234 123 122','https://www.google.pt/maps/place/Venue2');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 3','Address','B1 1BU', 'venue3@gmail.com', '+44 1234 123 123','https://www.google.pt/maps/place/Venue3');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 4','Address','B1 1DA', 'venue4@gmail.com', '+44 1234 123 124','https://www.google.pt/maps/place/Venue4');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 5','Address','B1 1AA', 'venue5@gmail.com', '+44 1234 123 125','https://www.google.pt/maps/place/Venue5');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 6','Address','B1 1DF', 'venue6@gmail.com', '+44 1234 123 126','https://www.google.pt/maps/place/Venue6');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 7','Address','B1 1AQ', 'venue7@gmail.com', '+44 1234 123 127','https://www.google.pt/maps/place/Venue7');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 8','Address','B1 1AA', 'venue8@gmail.com', '+44 1234 123 128','https://www.google.pt/maps/place/Venue8');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 9','Address','B1 1DF', 'venue9@gmail.com', '+44 1234 123 129','https://www.google.pt/maps/place/Venue9');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 10','Address','B1 1BU', 'venue10@gmail.com', '+44 1234 123 120','https://www.google.pt/maps/place/Venue10');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 11','Address','B1 1AQ', 'venue11@gmail.com', '+44 1234 123 131','https://www.google.pt/maps/place/Venue11');
INSERT INTO VENUE VALUES (seq_venue.nextval,'Venue 12','Address','B1 1BW', 'venue12@gmail.com', '+44 1234 123 132','https://www.google.pt/maps/place/Venue12');

--##################################################################################################################################################################################

--Inserts SCHEDULE
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,15,'MONDAY');
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,17,'WEDNESDAY');
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,08,'TUESDAY');
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,11,'THURSDAY');
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,20,'MONDAY');
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,22,'FRIDAY');
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,09,'THURSDAY');
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,17,'WEDNESDAY');
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,15,'TUESDAY');
INSERT INTO SCHEDULE VALUES (seq_schedule.nextval,15,'THURSDAY');

--##################################################################################################################################################################################

--Inserts COURSE_SCHEDULE_VENUE
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (1,1,1);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (1,2,1);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (1,3,2);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (1,4,2);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (1,1,4);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (2,5,3);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (2,6,3);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (2,7,4);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (2,8,4);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (2,7,11);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (2,8,11);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (3,9,5);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (3,10,5);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (3,1,6);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (3,2,6);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (3,1,1);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (3,2,2);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (4,3,7);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (4,4,7);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (4,5,8);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (4,6,8);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (4,5,12);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (4,6,12);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (5,7,9);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (5,7,9);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (5,8,3);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (5,9,10);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (5,10,10);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (6,5,11);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (6,6,11);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (6,1,12);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (6,2,12);
INSERT INTO COURSE_SCHEDULE_VENUE VALUES (6,6,5);

--##################################################################################################################################################################################

--Inserts ASSESSOR
INSERT INTO ASSESSOR VALUES(seq_assessor.nextval,1,'Assessor 1','Address','B1 1DF','assessor1@gmail.com','+44 1212 121 121','Manager 1');
INSERT INTO ASSESSOR VALUES(seq_assessor.nextval,2,'Assessor 1','Address','B1 1BU','assessor2@gmail.com','+44 1212 121 122','Manager 2');
INSERT INTO ASSESSOR VALUES(seq_assessor.nextval,3,'Assessor 1','Address','B1 1BW','assessor3@gmail.com','+44 1212 121 123','Manager 3');
INSERT INTO ASSESSOR VALUES(seq_assessor.nextval,4,'Assessor 1','Address','B1 1AQ','assessor4@gmail.com','+44 1212 121 124','Manager 4');
INSERT INTO ASSESSOR VALUES(seq_assessor.nextval,5,'Assessor 1','Address','B1 1BU','assessor5@gmail.com','+44 1212 121 125','Manager 5');
INSERT INTO ASSESSOR VALUES(seq_assessor.nextval,6,'Assessor 1','Address','B1 1AA','assessor6@gmail.com','+44 1212 121 126','Manager 6');

COMMIT;