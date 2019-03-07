--DROP TABLE Teachers;
--DROP TABLE TeacherAssignmentsToCourses;
--ALTER TABLE Degrees DROP COLUMN DegreeDescription;
--ALTER TABLE Students DROP COLUMN Address;
--ALTER TABLE Students DROP COLUMN StudentName;
--ALTER TABLE Courses DROP COLUMN CourseDescription;
ANALYZE VERBOSE;
CREATE INDEX idx_srtd_on_courseregistrations ON courseregistrations(studentregistrationid);
