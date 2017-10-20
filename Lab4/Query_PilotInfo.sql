select CONCAT(EMP_TITLE, ' ', EMP_FNAME, ' ', EMP_LNAME) as 'Employee Name', PIL_LICENSE as 'Pilot License', PIL_RATINGS as 'Pilot Ratings', "Josh" as 'Query Executor', now() as 'Query Date'
from employee
join pilot on employee.EMP_NUM = pilot.EMP_NUM
where pilot.PIL_LICENSE = "COM"
order by employee.EMP_LNAME;