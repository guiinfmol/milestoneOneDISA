--DROP TABLE Teachers;
--DROP TABLE TeacherAssignmentsToCourses;
--ALTER TABLE Degrees DROP COLUMN DegreeDescription;
--ALTER TABLE Students DROP COLUMN Address;
--ALTER TABLE Students DROP COLUMN StudentName;
--ALTER TABLE Courses DROP COLUMN CourseDescription;

--ANALYZE ON ALL TABLES
ANALYZE VERBOSE;
--OPTIMIZATION FOR QUERY 1
CREATE INDEX idx_srtd_on_courseregistrations ON courseregistrations(studentregistrationid);

--OPTIMIZATION FOR QUERY 2
CREATE MATERIALIZED VIEW PassedCreditsPerRegistration(studentregistrationid, passedCredits, avgMark) AS SELECT StudentRegistrationId, sum(ects) passedCredits, cast(1.0*sum(ects*grade)/sum(ects) as decimal(10,2)) as AvgMark FROM courseregistrations d natural join courseoffers natural join courses WHERE grade >= 5 GROUP BY StudentRegistrationId;
--create index idx_srtdid_aux ON PassedCreditsPerRegistration(studentregistrationid); drop this index

--OPTIMIZATION FOR QUERY 3
CREATE MATERIALIZED VIEW ActiveStudents(studentregistrationid) AS select studentregistrationid FROM PassedCreditsPerRegistration d natural join studentregistrationstodegrees natural join degrees where totalects <= passedcredits GROUP BY studentregistrationid;
--OPT create index idx_degid ON studentregistrationstodegrees using hash(degreeid);
