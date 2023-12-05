-- Find a list of courses a student is taking
select    
	s.fullname as student_name,
	sub.name as course_name
from students s
join grades g on s.id = g.student_id
join subjects sub on g.subject_id = sub.id
where s.id = 1 -- Replace with a specific student 'id'
group by s.id, sub.name;
