select charter.CUS_CODE as 'Customer', charter.AC_NUMBER as 'Aircraft', "Josh" as 'Query Executor', now() as 'Query Date'
from charter
where charter.CUS_CODE > (select avg(customer.CUS_CODE) from customer);