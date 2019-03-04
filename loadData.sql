\copy Degrees FROM '/mnt/ramdisk/tables/Degrees.table' DELIMITER ',' CSV HEADER;
\copy Students FROM '/mnt/ramdisk/tables/Students.table' DELIMITER ',' CSV HEADER;
\copy StudentRegistrationsToDegrees FROM '/mnt/ramdisk/tables/StudentRegistrationsToDegrees.table' DELIMITER ',' CSV HEADER;
\copy Teachers FROM '/mnt/ramdisk/tables/Teachers.table' DELIMITER ',' CSV HEADER;
\copy Courses FROM '/mnt/ramdisk/tables/Courses.table' DELIMITER ',' CSV HEADER;
\copy CourseOffers FROM '/mnt/ramdisk/tables/CourseOffers.table' DELIMITER ',' CSV HEADER;
\copy TeacherAssignmentsToCourses FROM '/mnt/ramdisk/tables/TeacherAssignmentsToCourses.table' DELIMITER ',' CSV HEADER;
\copy StudentAssistants FROM '/mnt/ramdisk/tables/StudentAssistants.table' DELIMITER ',' CSV HEADER;
\copy CourseRegistrations FROM '/mnt/ramdisk/tables/CourseRegistrations.table' DELIMITER ',' CSV HEADER NULL AS 'null';
-- Degrees
ALTER TABLE Degrees ADD PRIMARY KEY(DegreeId);
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
--CourseRegistrations
ALTER TABLE CourseRegistrations ADD PRIMARY KEY(StudentRegistrationId, CourseOfferId);
--StudentAssistants
ALTER TABLE StudentAssistants ADD PRIMARY KEY(CourseOfferId, StudentRegistrationId);
