-- Find the grades of students in a separate group for a specific subject
select    
	s.group_id,
	s.fullname as student_name,
	g.grade
from students s
join grades g on s.id = g.student_id
where 
	s.group_id = 1 -- replace with a specific group ID
	and g.subject_id = 2 -- replace with a specific subject ID
