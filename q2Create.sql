CREATE INDEX idx_srtd_on_courseregistrations ON courseregistrations(studentregistrationid);
CREATE MATERIALIZED VIEW PassedCreditsPerRegistration(studentregistrationid, passedCredits, avgMark) AS SELECT StudentRegistrationId, sum(ects) passedCredits, cast(1.0*sum(ects*grade)/sum(ects) as decimal(10,2)) as AvgMark FROM courseregistrations d natural join courseoffers natural join courses WHERE grade >= 5 GROUP BY StudentRegistrationId;
CREATE MATERIALIZED VIEW ActiveStudents(StudentRegistrationId) AS select studentregistrationid FROM PassedCreditsPerRegistration d natural join studentregistrationstodegrees natural join degrees where totalects <= passedcredits UNION SELECT STUDENTREGISTRATIONID FROM STUDENTREGISTRATIONSTODEGREES EXCEPT SELECT STUDENTREGISTRATIONID FROM COURSEREGISTRATIONS GROUP BY STUDENTREGISTRATIONID;
CREATE INDEX idx_srid_activestudents ON ActiveStudents(studentregistrationid);
CREATE MATERIALIZED VIEW MaxGradesOfferAndStudent(courseofferid, grade, studentid) AS SELECT courseofferid, grade, studentid FROM (SELECT courseofferid, max(grade) from courseregistrations natural join courseoffers where year = 2018 and quartile = 1 GROUP BY courseofferid) AS FOO NATURAL JOIN COURSEREGISTRATIONS cr NATURAL JOIN studentregistrationstodegrees WHERE foo.max = cr.grade;
CREATE INDEX idx_sid_maxgrades ON MaxGradesOfferAndStudent(studentid);
CREATE VIEW studentsCourseOfExcellence(studentid, numberCourses) AS SELECT STUDENTID, COUNT(*) as numberCourses FROM MaxGradesOfferAndStudent GROUP BY STUDENTID;
ANALYZE;
