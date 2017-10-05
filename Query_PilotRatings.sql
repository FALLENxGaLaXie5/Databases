select CONCAT(EMP_TITLE, ' ', EMP_FNAME, ' ', EMP_LNAME) as 'Employee Name', RTG_NAME as 'Rating', "Josh" as 'Query Executor', now() as 'Query Date'
from employee
join earnedrating on employee.EMP_NUM = earnedrating.EMP_NUM
join rating on earnedrating.RTG_CODE = rating.RTG_CODE
order by employee.EMP_LNAME asc;