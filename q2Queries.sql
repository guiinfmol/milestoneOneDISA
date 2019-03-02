/*Q1: For each student and each degree that this student is enrolled to, student administration needs to be able to print
a report that includes all passed courses taken by the student (i.e., the ones that have a grade at least 5), and their
corresponding grades. Write the SQL query that takes as input parameters the student id (denoted as %1%) and the degree
id (denoted as %2%), and returns all course names, and the grades that the student achieved, sorted by year, quartile,
and course offer id. This query will be executed 100 times sequentially in our testing workload, with different parameter
values. The correct answer will adhere to the following schema:
[varchar CourseName, int grade].*/
--Complete & Checked

--CREATE INDEX idx_srtd_on_courseregistrations ON courseregistrations(studentregistrationid);
select coursename, grade
from (courseoffers co
natural join courseregistrations cr
natural join studentregistrationstodegrees srtd)
inner join courses c on co.courseid = c.courseid
where studentid = 1591650 and srtd.degreeid = 3622 AND grade >= 5
ORDER BY year, quartile, courseofferid;

/*Q2: You want to award your excellent students. List the student ids of all students that never failed a course during
at least one of their completed degrees and had a GPA higher than a query parameter %1% (between 9 and 10). The list
should be sorted by student id and not contain duplicates. The query will be executed 10 times sequentially in our
testing workload, with parameter values 9.0, 9.1, 9.2, ... 9.9. The correct answer will adhere to the following schema:
[int studentId]
 */
 --Complete & Checked

 --DROP MATERIALIZED VIEW PassedCreditsPerRegistration;
 --CREATE MATERIALIZED VIEW PassedCreditsPerRegistration(studentregistrationid, passedCredits, avgMark) AS SELECT StudentRegistrationId, sum(ects), 1.0*sum(ects*grade)/sum(ects) FROM courseregistrations d natural join courseoffers natural join courses WHERE grade >= 5 GROUP BY d.StudentRegistrationId
 --create index idx_srtdid_aux ON PassedCreditsPerRegistration(studentregistrationid);

-- (Review results and try to add some more records!)
 select studentid
 from PassedCreditsPerRegistration pcpr
 NATURAL JOIN STUDENTregistrationstodegrees
 where passedCredits  >= (select totalECTS from degrees natural join studentregistrationstodegrees where StudentRegistrationId = pcpr.StudentRegistrationId)
 AND (SELECT COUNT(*) FROM courseregistrations where grade < 5 and pcpr.studentregistrationid = studentregistrationid) < 1
 AND (avgMark) > 9
 ORDER BY studentid;

/*Q3: The ministry of education says that you should promote the participation of female students in your university.
You want to prove that this is not an issue at TU Eindhoven. Considering only the active students, compute the percentage
of female students for each degree id (see the definition for degree completion at the preceding assumptions). The correct
answer will adhere to the following schema: [int degreeid, float percentage].
Answers should be ordered on degree id..*/
--Complete & Checked

--CREATE MATERIALIZED VIEW ActiveStudents(studentid) AS select studentid FROM PassedCreditsPerRegistration d natural join studentregistrationstodegrees natural join degrees where totalects <= passedcredits GROUP BY studentid;
select degreeid, cast((1.0*sum(case when gender='F' THEN 1 ELSE 0 END)/count(*))*100 as decimal(10,2)) as percentage
from students s
natural join studentregistrationstodegrees
where EXISTS (select * from ActiveStudents where studentid = s.studentid)
GROUP BY degreeid;

/*Q4  The ministry of education says that you should promote the participation of female students in the degrees offered
by department %1%. Compute the percentage of all female students (both active and with completed degrees) in the degrees
offered by department %1%. The query will be executed 10 times sequentially in our testing workload, with different
parameter values. The correct answer will adhere to the following schema: [float percentage]
*/
--Complete & Checked
select cast((1.0*sum(case when gender='F' THEN 1 ELSE 0 END)/count(*))*100 as decimal(10,2)) as percentage from
studentregistrationstodegrees
natural join students
natural join degrees
where dept = 'standard a'

/*Q5 TUe student administration wants to examine the introduction of a variable passing grade per course. For example,
course 2id70 might have a passing grade 5, whereas course 2id50 might have a passing grade 4 out of 10. The idea is that
each course offer should have at least 75% of the students passing. Write a query that will enable the student
administrators to find out the percentage of students passing all offers of all courses, where the passing grade %1% is
given at query time (i.e., grade should be greater than or equal to %1% for the student to pass). Students without a grade
(e.g., because they dropped the course) should be ignored in this computation. The query will be executed 5 times
sequentially in our testing workload, with parameter values 4, 5, 6, 7, 8. Results should be ordered on course offer id.
The correct answer will adhere to the following schema [int courseid, float percentagePassing]*/
--Complete & Checked
--TODO: Optimize
select courseid, cast((1.0*sum(case when grade>=5 THEN 1 ELSE 0 END)/count(*))*100 as decimal(10,2)) as percentage
from courseregistrations
natural join courseoffers
where grade IS NOT NULL
group by courseid
order by courseid;

select * from (select studentid, count(*) as numberOfCoursesWhereExcellent from studentregistrationstodegrees natural join (select foo.courseofferid, studentregistrationid from courseregistrations inner join (SELECT courseofferid, max(grade) from courseregistrations cr natural join courseoffers
where year = 2018 and quartile = 1
group by courseofferid) as foo on courseregistrations.courseofferid = foo.courseofferid and grade = max) as foo2
group by studentid) as total
where numberOfCoursesWhereExcellent >= 1;

/*Q7 Q7: Student administration hired a consultant to find out which parameters influence the performance of students. The
 consultant wants to analyze the GPA of all active students, considering the following attributes: degree, year of birth,
 and gender. Write a query to construct a cube in Posgresql on these attributes in the aforementioned order. The records
 should be ordered ascending on degree, then year of birth, and then gender (Female precedes Male). The expected output
 has the following format: [int degreeid, int birthyear, char gender, float avgGrade].
*/

SELECT degreeid, birthyearstudent, gender, 1.0*sum(ects*grade)/sum(ects) as avgGrade
FROM students
natural join studentregistrationstodegrees
natural join courseregistrations
natural join courseoffers
natural join courses
GROUP BY CUBE(degreeid, birthyearstudent, gender)
ORDER BY degreeid, birthyearstudent, gender;

/*Q8 In theory, each course offer gets at least one student assistant for every 50 students. Write a query to list the
course names, years, and quartiles of all courses that received less student assistants than the required ones. The list
should be sorted by CourseOfferId. The expected output has the following format:
[varchar courseName, in year, int quartile]*/
--Complete & Checked
select coursename, year, quartile from ((select courseofferid, count(*) as numstudents from courseregistrations group by courseofferid) as foo
natural join (select courseofferid, count(*) as numassistants from studentassistants group by courseofferid) as foo2) natural join courseoffers natural join courses where foo.numstudents > 50 * foo2.numassistants;
