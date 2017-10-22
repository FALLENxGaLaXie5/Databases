use aviationco;
drop view if exists aviationco.CustomerDistTravelled;

create view aviationco.CustomerDistTravelled as
select CONCAT(CUS_FNAME, ' ', CUS_LNAME) as 'Customer Name',
	sum(charter.CHAR_DISTANCE) as 'Total Distance Travelled',
	QueryAuthor() as 'Query Author'
from customer
join charter on customer.CUS_CODE = charter.CUS_CODE
group by charter.CUS_CODE
order by sum(charter.CHAR_DISTANCE) desc;

select * from CustomerDistTravelled;