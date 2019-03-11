select 0;
select 0;
select 0;
select 0;
select 0;
select 0;
SELECT degreeid, birthyearstudent, gender, avg(avgMark)::float as avgGrade FROM students s natural join passedcreditsperregistration pc natural join studentregistrationstodegrees sr natural join activeregistrations ar natural join courseregistrations cr natural join courseoffers co natural join courses c GROUP BY CUBE(sr.degreeid, birthyearstudent, gender)  ORDER BY sr.degreeid, birthyearstudent, gender;
select coursename, year, quartile FROM courses c, courseoffers co, CourseOffersRegsAss cora where 1.0*regs/50 > ass AND c.courseid = co.courseid AND co.courseofferid = cora.courseofferid order by cora.courseofferid;
