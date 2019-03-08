select coursename, grade from courseoffers natural join courseregistrations natural join studentregistrationstodegrees natural join courses where studentid = %1% and degreeid = %2% AND grade >= 5 ORDER BY year, quartile, courseofferid;
select studentid from PassedCreditsPerRegistration pcpr NATURAL JOIN STUDENTregistrationstodegrees where passedCredits  >= (select totalECTS from degrees natural join studentregistrationstodegrees where StudentRegistrationId = pcpr.StudentRegistrationId) AND (SELECT COUNT(*) FROM courseregistrations where grade < 5 and pcpr.studentregistrationid = studentregistrationid) = 0 AND (avgMark) > %1% ORDER BY studentid;
select degreeid, 1.0*sum(case when gender='F' THEN 1 ELSE 0 END)/count(*) as percentage from students s natural join studentregistrationstodegrees where EXISTS (select * from ActiveStudents where studentid = s.studentid) GROUP BY degreeid ORDER BY degreeid;
select (1.0*sum(case when gender='F' THEN 1 ELSE 0 END)/count(*)) as percentage from studentregistrationstodegrees natural join students natural join degrees where dept = 'standard a';
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
