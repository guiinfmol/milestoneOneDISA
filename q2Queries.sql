select 0;
select 0;
select 0;
select 0;
select 0;
select 0;
SELECT degreeid, birthyearstudent, gender, 1.0*sum(ects*grade)/sum(ects) as avgGrade FROM students natural join studentregistrationstodegrees natural join courseregistrations natural join courseoffers natural join courses GROUP BY CUBE(degreeid, birthyearstudent, gender) ORDER BY degreeid, birthyearstudent, gender;
select 0;
