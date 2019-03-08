select c.coursename, cr.grade from courseoffers co, courses c, courseregistrations cr, studentregistrationstodegrees sr where sr.studentid = %1% AND sr.degreeid = %2% AND cr.grade >= 5 AND co.courseid = c.courseid AND sr.studentregistrationid = cr.studentregistrationid AND co.courseofferid = cr.courseofferid ORDER BY co.year, co.quartile, co.courseofferid;
SELECT 0;
select degreeid, 1.0*sum(case when gender='F' THEN 1 ELSE 0 END)/count(*) as percentage from studentregistrationstodegrees sr, students s where  s.studentid = sr.studentid AND EXISTS (select * from ActiveStudents where studentregistrationid = sr.studentregistrationid) GROUP BY degreeid;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
