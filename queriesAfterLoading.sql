select , (select count(*) from courseregistrations where courseofferid = 1) as NumberOfRegStudents,
	(select count(*) from studentassistants where courseofferid = 1) as NumberOfStudAssistants
	from courseoffers
	natural join courses
	natural join degrees
	natural join teacherassignmentstocourses
	natural join teachers
	where courseofferid = 1;

select * , (select count(*) from courseregistrations where courseofferid = 1) as NumberOfRegStudents,
	(select count(*) from studentassistants where courseofferid = 1) as NumberOfStudAssistants
	from courseoffers
	natural join courses
	natural join degrees
	natural join teacherassignmentstocourses
	natural join teachers
	where courseofferid = 1;

select avg(grade) from courseregistrations where studentregistrationid = 140;
