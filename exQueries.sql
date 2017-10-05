select "Josh" as 'Query Executor', now() as 'Query Date', CONCAT(CUS_FNAME, ' ', CUS_LNAME) as 'Customer Name'
from customer
where CUS_LNAME = "Steward";