-- Find a list of courses taught to a specific student by a specific teacher
select    
	s.fullname as student_name,
	sub.name as subject,
	t.fullname as teacher_name
from students s 
join grades g on s.id = g.student_id
join subjects sub on g.subject_id = sub.id 
join teachers t on sub.teacher_id = t.id 
where 
	s.id = 2 -- replace with a specific student 'id'
	and t.id = 3 -- replace with a specific teacher 'id'

