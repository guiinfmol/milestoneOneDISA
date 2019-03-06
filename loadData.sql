COPY Degrees(DegreeId, Dept, DegreeDescription, TotalECTS) FROM '/mnt/ramdisk/tables/Degrees.table' DELIMITER ',' CSV HEADER;
COPY Students(StudentId, StudentName, Address, BirthyearStudent, Gender) FROM '/mnt/ramdisk/tables/Students.table' DELIMITER ',' CSV HEADER;
COPY StudentRegistrationsToDegrees(StudentRegistrationId, StudentId, DegreeId, RegistrationYear) FROM '/mnt/ramdisk/tables/StudentRegistrationsToDegrees.table' DELIMITER ',' CSV HEADER;
COPY Teachers(TeacherId, TeacherName, Address, BirthyearTeacher, Gender) FROM '/mnt/ramdisk/tables/Teachers.table' DELIMITER ',' CSV HEADER;
COPY Courses(CourseId, CourseName, CourseDescription, DegreeId, ECTS) FROM '/mnt/ramdisk/tables/Courses.table' DELIMITER ',' CSV HEADER;
COPY CourseOffers(CourseOfferId, CourseId, Year, Quartile) FROM '/mnt/ramdisk/tables/CourseOffers.table' DELIMITER ',' CSV HEADER;
COPY TeacherAssignmentsToCourses(CourseOfferId, TeacherId) FROM '/mnt/ramdisk/tables/TeacherAssignmentsToCourses.table' DELIMITER ',' CSV HEADER;
COPY StudentAssistants(CourseOfferId, StudentRegistrationId) FROM '/mnt/ramdisk/tables/StudentAssistants.table' DELIMITER ',' CSV HEADER;
COPY CourseRegistrations(CourseOfferId, StudentRegistrationId, Grade) FROM '/mnt/ramdisk/tables/CourseRegistrations.table' NULL 'null' DELIMITER ',' CSV HEADER;
ANALYZE VERBOSE;
-- Degrees
--ALTER TABLE Degrees ADD PRIMARY KEY(DegreeId);
--Students
--ALTER TABLE Students ADD PRIMARY KEY(StudentId);
--StudentRegistrationsToDegrees
--ALTER TABLE StudentRegistrationsToDegrees ADD PRIMARY KEY(StudentRegistrationId);
--Teachers
--ALTER TABLE Teachers ADD PRIMARY KEY(TeacherId);
--Courses
--ALTER TABLE Courses ADD PRIMARY KEY(CourseId);
--CourseOffers
--ALTER TABLE CourseOffers ADD PRIMARY KEY(CourseOfferId);
--CourseRegistrations
--ALTER TABLE CourseRegistrations ADD PRIMARY KEY(StudentRegistrationId, CourseOfferId);
--StudentAssistants
--ALTER TABLE StudentAssistants ADD PRIMARY KEY(CourseOfferId, StudentRegistrationId);
