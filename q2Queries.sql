select coursename, grade from courseoffers natural join courseregistrations natural join studentregistrationstodegrees natural join courses where studentid = %1% and srtd.degreeid = %2% AND grade >= 5 ORDER BY year, quartile, courseofferid;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
