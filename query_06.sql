-- Find a list of students in a specific group
select 
	id as student_id,    
	fullname as student_name
from students s
where group_id = 1; -- replace with a specific group ID
