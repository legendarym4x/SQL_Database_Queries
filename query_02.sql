-- Find the student with the highest average grade in a particular subject
select
    s.id,
    s.fullname,
    round(avg(g.grade), 2) as average_grade
from students s
join grades g on s.id = g.student_id
where g.subject_id = 1  -- replace with a specific 'id' of the subject  
group by s.id 
order by average_grade desc   
limit 1;