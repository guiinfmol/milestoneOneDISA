SELECT courseofferid, courseid, year, quartile, coursename, coursedescription, degreeid, ects, dept, degreedescription, totalects, teacherid, teachername, address, birthyearteacher, gender from courseoffers natural join courses natural join degrees natural join teacherassignmentstocourses natural join teachers where courseofferid = 1;
SELECT courseofferid, courseid, year, quartile, studentid, studentname, address, birthyearstudent, gender, degreeid, dept, degreedescription, totalects from studentassistants natural join courseoffers natural join studentregistrationstodegrees natural join students natural join degrees where studentregistrationid = 140;
SELECT AVG(Grade) FROM CourseRegistrations WHERE StudentRegistrationId=140 GROUP BY studentregistrationid;
