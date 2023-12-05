-- Find the average grade given by a particular teacher to a particular student
select    
	t.fullname as teacher_name,
	s.fullname as student_name,
	round(avg(g.grade), 2) as average_grade
from teachers t 
join subjects sub on t.id = sub.teacher_id
join grades g on sub.id = g.subject_id
join students s on g.student_id = s.id 
where 
	s.id = 2 -- replace with a specific student 'id'
	and t.id = 3 -- replace with a specific teacher 'id'
group by t.fullname, s.fullname;
