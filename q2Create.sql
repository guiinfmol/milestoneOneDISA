CREATE INDEX idx_srid_courseregistrations ON courseregistrations(studentregistrationid);
CREATE MATERIALIZED VIEW PassedCreditsPerRegistration(studentregistrationid, passedCredits, avgMark) AS SELECT StudentRegistrationId, sum(ects) passedCredits, 1.0*sum(ects*grade)/sum(ects)::float as AvgMark FROM courseregistrations cr, courseoffers co, courses c WHERE grade >= 5 AND  cr.courseofferid = co.courseofferid AND co.courseid = c.courseid GROUP BY StudentRegistrationId;

CREATE VIEW CompletedStudentRegistrations(StudentRegistrationId) AS select pc.studentregistrationid FROM PassedCreditsPerRegistration pc, studentregistrationstodegrees sr, degrees d where d.totalects <= pc.passedcredits AND sr.degreeid = d.degreeid AND pc.studentregistrationid = sr.studentregistrationid;
CREATE MATERIALIZED VIEW ActiveRegistrations AS select distinct sr.studentregistrationid, sr.studentid from StudentRegistrationsToDegrees sr where NOT EXISTS(SELECT * FROM CompletedStudentRegistrations WHERE StudentRegistrationId = sr.StudentRegistrationId);
CREATE INDEX idx_srid_activeregistrations ON ActiveRegistrations(studentregistrationid);

CREATE MATERIALIZED VIEW MaxGradesOfferAndStudent(courseofferid, grade, studentid) AS SELECT foo.courseofferid, cr.grade, sr.studentid FROM (SELECT cr.courseofferid, max(grade) from courseregistrations cr, courseoffers co where year = 2018 and quartile = 1 AND cr.courseofferid = co.courseofferid GROUP BY cr.courseofferid) AS FOO, COURSEREGISTRATIONS cr, studentregistrationstodegrees sr WHERE foo.max = cr.grade AND foo.courseofferid = cr.courseofferid AND cr.studentregistrationid = sr.studentregistrationid;
CREATE INDEX idx_sid_maxgrades ON MaxGradesOfferAndStudent(studentid);
CREATE VIEW studentsCourseOfExcellence(studentid, numberCourses) AS SELECT STUDENTID, COUNT(*) as numberCourses FROM MaxGradesOfferAndStudent GROUP BY STUDENTID;

CREATE VIEW AssistantsAndRegistrations(courseofferid, numstudents, numassistants) as select courseofferid, (select count(*) from courseregistrations where courseofferid = co.courseofferid) as numStudents, (select count(*) from studentassistants where courseofferid = co.courseofferid) as numAssistants from courseoffers co;
CREATE VIEW CourseOffersWithLess as SELECT courseofferid FROM AssistantsAndRegistrations WHERE (1.0*numstudents/50) < numassistants;

ANALYZE;
