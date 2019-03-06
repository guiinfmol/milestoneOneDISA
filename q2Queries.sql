select 0;
select 0;
select 0;
select 1.0*sum(case when gender='F' THEN 1 ELSE 0 END)/count(*) as percentage from studentregistrationstodegrees natural join students natural join degrees where dept = %1%;
select 0;
select 0;
SELECT degreeid, birthyearstudent, gender, 1.0*sum(ects*grade)/sum(ects) as avgGrade FROM students natural join studentregistrationstodegrees natural join courseregistrations natural join courseoffers natural join courses GROUP BY CUBE(degreeid, birthyearstudent, gender) ORDER BY degreeid, birthyearstudent, gender;
select 0;
