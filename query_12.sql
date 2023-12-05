-- Find grades of students in a certain group in a certain subject in the last lesson
select    
	g.grade_date as last_grade,
	gr.name as group_name,
	g.subject_id,
	s.fullname as student_name,
	g.grade as last_grade
from grades g
join students s on g.student_id = s.id 
join groups gr on s.group_id = gr.id
where 
	gr.id = 3 -- replace with a specific group 'id'
	and g.subject_id = 6 -- replace with a specific subject 'id'
order by g.grade_date desc
limit 1;
