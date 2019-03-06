-- Create indices
ALTER TABLE Degrees add primary key (DegreeId);
ALTER TABLE Students add primary key (StudentId);
ALTER TABLE Teachers add primary key (TeacherId);
ALTER TABLE Courses add primary key (CourseId);
ALTER TABLE CourseOffers add primary key (CourseOfferId);
-- Optimization indices Q1
CREATE INDEX CourseOfferRegistrations_StudentRegistrationId_Grade ON CourseOfferRegistrations(StudentRegistrationId, Grade);
CREATE INDEX StudentRegistrationsToDegrees_StudentId_DegreeId ON StudentRegistrationsToDegrees(StudentId, DegreeId);
-- Optimization view degree completion
CREATE VIEW ECTSInDegree AS
SELECT StudentRegistrationsToDegrees.StudentRegistrationId, StudentRegistrationsToDegrees.DegreeId, SUM(Courses.ECTS) as CurrentECTS
FROM StudentRegistrationsToDegrees, CourseOfferRegistrations, Courses
WHERE CourseOfferRegistrations.StudentRegistrationId = StudentRegistrationsToDegrees.StudentRegistrationId
AND CourseOfferRegistrations.Grade >= 5
AND Courses.CourseId = CourseOfferRegistrations.CourseId
GROUP BY StudentRegistrationsToDegrees.StudentRegistrationId, StudentRegistrationsToDegrees.DegreeId;
CREATE MATERIALIZED VIEW MaterialCompletedDegree AS
SELECT ECTSInDegree.StudentRegistrationId
FROM ECTSInDegree, Degrees
WHERE ECTSInDegree.DegreeId = Degrees.DegreeId
AND ECTSInDegree.CurrentECTS >= Degrees.TotalECTS;
-- Optimization view GPA
CREATE MATERIALIZED VIEW MaterialGPA AS
SELECT CourseOfferRegistrations.StudentRegistrationId, CAST(SUM(CourseOfferRegistrations.Grade * Courses.ECTS) AS FLOAT) / CAST(SUM(Courses.ECTS) AS FLOAT) as GPA
FROM CourseOfferRegistrations, Courses
WHERE CourseOfferRegistrations.CourseId = Courses.CourseId
AND Grade >= 5
GROUP BY CourseOfferRegistrations.StudentRegistrationId;
-- Optimization Cube for grade categories
CREATE MATERIALIZED VIEW GradeCube AS
SELECT CourseId, Grade, COUNT(StudentRegistrationID) as Count
FROM CourseOfferRegistrations
WHERE Grade IS NOT NULL
GROUP BY CUBE(CourseId, Grade);
-- Analyze
ANALYZE VERBOSE;
