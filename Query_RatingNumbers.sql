select CONCAT(EMP_TITLE, ' ', EMP_FNAME, ' ', EMP_LNAME) as Employee_Name, count(earnedrating.EMP_NUM) as Rating_Count, "Josh" as 'Query Executor', now() as 'Query Date'
from employee
join earnedrating on (employee.EMP_NUM = earnedrating.EMP_NUM)
group by Employee_Name having Rating_Count > 3
order by count(earnedrating.EMP_NUM) desc;