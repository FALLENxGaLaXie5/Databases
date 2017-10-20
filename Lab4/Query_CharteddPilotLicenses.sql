select CONCAT(EMP_TITLE, ' ', EMP_FNAME, ' ', EMP_LNAME) as Employee_Name, "Josh" as 'Query Executor', now() as 'Query Date'
from crew
inner join employee on (crew.EMP_NUM = employee.EMP_NUM)
left join pilot on (employee.EMP_NUM = pilot.EMP_NUM)
where pilot.EMP_NUM is null;