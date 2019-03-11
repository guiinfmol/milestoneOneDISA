select 0;
select 0;
select 0;
select 0;
select 0;
select 0;
SELECT sr.degreeid,  birthyearstudent, gender, avg(avgMark)::float as avgGrade FROM students s, passedcreditsperregistration pc, studentregistrationstodegrees sr, activestudents ar, courseregistrations cr, courseoffers co, courses c WHERE co.courseid = c.courseid AND co.courseofferid = cr.courseofferid  AND cr.studentregistrationid = sr.studentregistrationid AND ar.studentid = sr.studentid AND sr.studentid = s.studentid AND sr.studentregistrationid = pc.studentregistrationid GROUP BY CUBE(sr.degreeid, birthyearstudent, gender)  ORDER BY sr.degreeid, birthyearstudent, gender;
select coursename, year, quartile FROM courses c, courseoffers co, CourseOffersRegsAss cora where 1.0*regs/50 > ass AND c.courseid = co.courseid AND co.courseofferid = cora.courseofferid order by cora.courseofferid;
