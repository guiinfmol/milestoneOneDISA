select coursename, grade from (courseoffers co natural join courseregistrations cr natural join studentregistrationstodegrees srtd) inner join courses c on co.courseid = c.courseid where studentid = %1% and srtd.degreeid = %2% AND grade >= 5 ORDER BY year, quartile, courseofferid;
select studentid from PassedCreditsPerRegistration pcpr NATURAL JOIN STUDENTregistrationstodegrees where passedCredits  >= (select totalECTS from degrees natural join studentregistrationstodegrees where StudentRegistrationId = pcpr.StudentRegistrationId) AND (SELECT COUNT(*) FROM courseregistrations where grade < 5 and pcpr.studentregistrationid = studentregistrationid) = 0 AND (avgMark) > %1% ORDER BY studentid;
select 0;
select 0;
select 0;
select 0;
select 0;
select 0;
