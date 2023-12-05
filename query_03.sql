-- Find the average score in groups for a certain subject
select
    g.subject_id,
    s.group_id,
    round(avg(g.grade), 2) as average_grade
from grades g
join students s on g.student_id = s.id
where g.subject_id = 5  -- replace with a specific 'id' of the subject  
group by g.subject_id, s.group_id 
order by g.subject_id, s.group_id; 
