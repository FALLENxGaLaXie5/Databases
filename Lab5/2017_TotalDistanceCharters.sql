use aviationco;

select CONCAT(CUS_FNAME, ' ', CUS_LNAME) as 'Customer Name',
	sum(charter.CHAR_DISTANCE) as 'Total Distance Travelled',
    QueryAuthor() as 'Query Author'
from customer
join charter on customer.CUS_CODE = charter.CUS_CODE
where YEAR(charter.CHAR_DATE) = 2017
group by charter.CUS_CODE;