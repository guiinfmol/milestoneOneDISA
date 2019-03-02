DROP TABLE StudentRegistrationsToDegrees CASCADE;
DROP TABLE Students CASCADE;
DROP TABLE Degrees CASCADE;
DROP TABLE CourseRegistrations CASCADE;
DROP TABLE StudentAssistants CASCADE;
DROP TABLE TeacherAssignmentsToCourses CASCADE;
DROP TABLE CourseOffers CASCADE;
DROP TABLE Courses CASCADE;
DROP TABLE Teachers CASCADE;

CREATE UNLOGGED TABLE Degrees(DegreeId bigint, Dept varchar(50), DegreeDescription varchar(200), TotalECTS int);

CREATE UNLOGGED TABLE Students(StudentId bigint, StudentName varchar(50), Address varchar(200), BirthyearStudent int, Gender char(1));

CREATE UNLOGGED TABLE StudentRegistrationsToDegrees(StudentRegistrationId bigint, StudentId bigint, DegreeId bigint, RegistrationYear int);

CREATE UNLOGGED TABLE Teachers(TeacherId bigint, TeacherName varchar(50), Address varchar(200), BirthyearTeacher int, Gender char(1));

CREATE UNLOGGED TABLE Courses(CourseId bigint, CourseName varchar(50), CourseDescription varchar(200), DegreeId bigint, ECTS int);

CREATE UNLOGGED TABLE CourseOffers(CourseOfferId bigint, CourseId bigint, Year int, Quartile int);

CREATE UNLOGGED TABLE TeacherAssignmentsToCourses(CourseOfferId bigint, TeacherId bigint);

CREATE UNLOGGED TABLE StudentAssistants(CourseOfferId bigint, StudentRegistrationId bigint);

CREATE UNLOGGED TABLE CourseRegistrations(CourseOfferId bigint, StudentRegistrationId bigint, Grade int);

-- here the your full-path to command.txt should replace the current path. Use commandt.txt in Ubuntu (make sure the tables are in documents).

\i /Users/guillermo/Desktop/milestone1/command.txt;

-- Degrees
ALTER TABLE Degrees ADD PRIMARY KEY(DegreeId);
--ALTER TABLE Degrees ADD CHECK (TotalECTS <= 200);
--ALTER TABLE Degrees ADD CHECK (DegreeId >= 0);

--Students
ALTER TABLE Students ADD PRIMARY KEY(StudentId);

--StudentRegistrationsToDegrees
ALTER TABLE StudentRegistrationsToDegrees ADD PRIMARY KEY(StudentRegistrationId);

--Teachers
ALTER TABLE Teachers ADD PRIMARY KEY(TeacherId);

--Courses
ALTER TABLE Courses ADD PRIMARY KEY(CourseId);

--CourseOffers
ALTER TABLE CourseOffers ADD PRIMARY KEY(CourseOfferId);
