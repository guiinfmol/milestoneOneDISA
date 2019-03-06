SELECT Courses.CourseName, CourseOfferRegistrations.Grade FROM StudentRegistrationsToDegrees, CourseOfferRegistrations, Courses WHERE StudentRegistrationsToDegrees.StudentId = %1% AND StudentRegistrationsToDegrees.DegreeId = %2% AND CourseOfferRegistrations.StudentRegistrationId = StudentRegistrationsToDegrees.StudentRegistrationId AND CourseOfferRegistrations.CourseId = Courses.CourseId AND CourseOfferRegistrations.Grade >= 5 ORDER BY CourseOfferRegistrations.Year, CourseOfferRegistrations.Quartile, CourseOfferRegistrations.CourseOfferId;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
