-- Find the average grade on a stream (across the entire grade table)
select
    round(avg(grade), 2) as average_grade
from grades; 
