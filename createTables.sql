CREATE UNLOGGED TABLE Degrees(DegreeId bigint, Dept varchar(50), DegreeDescription varchar(200), TotalECTS int);
CREATE UNLOGGED TABLE Students(StudentId bigint, StudentName varchar(50), Address varchar(200), BirthyearStudent int, Gender char(1));
CREATE UNLOGGED TABLE StudentRegistrationsToDegrees(StudentRegistrationId bigint, StudentId bigint, DegreeId bigint, RegistrationYear int);
CREATE UNLOGGED TABLE Teachers(TeacherId bigint, TeacherName varchar(50), Address varchar(200), BirthyearTeacher int, Gender char(1));
CREATE UNLOGGED TABLE Courses(CourseId bigint, CourseName varchar(50), CourseDescription varchar(200), DegreeId bigint, ECTS int);
CREATE UNLOGGED TABLE CourseOffers(CourseOfferId bigint, CourseId bigint, Year int, Quartile int);
CREATE UNLOGGED TABLE TeacherAssignmentsToCourses(CourseOfferId bigint, TeacherId bigint);
CREATE UNLOGGED TABLE StudentAssistants(CourseOfferId bigint, StudentRegistrationId bigint);
CREATE UNLOGGED TABLE CourseRegistrations(CourseOfferId bigint, StudentRegistrationId bigint, Grade int);
