select c.coursename, cr.grade from courseoffers co, courses c, courseregistrations cr, studentregistrationstodegrees sr where sr.studentid = %1% AND sr.degreeid = %2% AND cr.grade >= 5 AND co.courseid = c.courseid AND sr.studentregistrationid = cr.studentregistrationid AND co.courseofferid = cr.courseofferid ORDER BY co.year, co.quartile, co.courseofferid;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
