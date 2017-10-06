select *, "Josh" as 'Query Executor', now() as 'Query Date'
from customer
group by customer.CUS_BALANCE
having count(customer.CUS_BALANCE) > 2;