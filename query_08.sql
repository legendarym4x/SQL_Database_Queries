-- Find the grades of students in a separate group for a specific subject
select    
	t.fullname as teacher_name,
	round(avg(g.grade), 2) as average_grade
from teachers t
join subjects s on t.id = s.teacher_id
join grades g on s.id = g.subject_id 
group by t.id, t.fullname;
