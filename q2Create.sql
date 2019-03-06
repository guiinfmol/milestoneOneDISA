ALTER TABLE Degrees ADD PRIMARY KEY(DegreeId);
ALTER TABLE Students ADD PRIMARY KEY(StudentId);
ALTER TABLE StudentRegistrationsToDegrees ADD PRIMARY KEY(StudentRegistrationId);
ALTER TABLE Teachers ADD PRIMARY KEY(TeacherId);
ALTER TABLE Courses ADD PRIMARY KEY(CourseId);
ALTER TABLE CourseOffers ADD PRIMARY KEY(CourseOfferId);
ALTER TABLE CourseRegistrations ADD PRIMARY KEY(StudentRegistrationId, CourseOfferId);
ALTER TABLE StudentAssistants ADD PRIMARY KEY(CourseOfferId, StudentRegistrationId);
CREATE INDEX idx_srtd_on_courseregistrations ON courseregistrations(studentregistrationid);
