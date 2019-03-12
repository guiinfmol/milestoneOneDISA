select 0;
select 0;
select 0;
select 0;
select 0;
select 0;
SELECT sr.degreeid, s.birthyearstudent, s.gender, avg(avgMark)::float as avgGrade FROM activeregistrations ar, PassedCreditsPerRegistration pc, studentregistrationstodegrees sr, students s WHERE ar.StudentRegistrationId = pc.StudentRegistrationId AND pc.StudentRegistrationId = sr.StudentRegistrationId AND sr.StudentId = s.studentid GROUP BY CUBE(sr.degreeid, s.birthyearstudent, s.gender) ORDER BY sr.degreeid, birthyearstudent, gender;
select c.coursename, co.year, co.quartile, cora.regs, cora.ass, 1.0*cora.regs/50 FROM CourseOffersRegsAss cora, courseoffers co, courses c where 1.0*regs/50 > ass AND cora.courseofferid = co.courseofferid AND co.courseid = c.courseid order by cora.courseofferid;
