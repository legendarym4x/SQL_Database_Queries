-- Find what courses a particular teacher teaches
select 
    t.fullname as teacher_name,
    s.name as course_name
from teachers t
join subjects s on t.id = s.teacher_id
where t.id = 1; -- replace with a specific teacher ID
