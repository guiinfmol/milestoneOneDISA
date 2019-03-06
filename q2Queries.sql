select coursename, grade from (courseoffers co natural join courseregistrations cr natural join studentregistrationstodegrees srtd) inner join courses c on co.courseid = c.courseid where studentid = %1% and srtd.degreeid = %2% AND grade >= 5 ORDER BY year, quartile, courseofferid;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
