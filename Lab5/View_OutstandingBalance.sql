use aviationco;
drop view if exists aviationco.OutstandingBalances;

create view aviationco.OutstandingBalances as
select CONCAT(customer.CUS_FNAME, ' ', customer.CUS_LNAME) as 'Customer Name',
	customer.CUS_PHONE as Contact,
    customer.CUS_BALANCE as Balance,
    QueryAuthor() as 'Query Author'
	from aviationco.customer
    where customer.CUS_BALANCE > 0
    order by Balance desc;
;

select * from OutstandingBalances;