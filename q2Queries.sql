select 0;
select 0;
select 0;
select 0;
select 0;
select 0;
SELECT sr.degreeid, s.birthyearstudent, s.gender, avg(avgMark)::float as avgGrade FROM activeregistrations ar, PassedCreditsPerRegistration pc, studentregistrationstodegrees sr, students s WHERE ar.StudentRegistrationId = pc.StudentRegistrationId AND pc.StudentRegistrationId = sr.StudentRegistrationId AND sr.StudentId = s.studentid GROUP BY CUBE(sr.degreeid, s.birthyearstudent, s.gender) ORDER BY sr.degreeid, birthyearstudent, gender;
select coursename, year, quartile FROM courses c, courseoffers co, CourseOffersRegsAss cora where 1.0*regs/50 > ass AND c.courseid = co.courseid AND co.courseofferid = cora.courseofferid order by cora.courseofferid;
