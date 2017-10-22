use aviationco;
drop view if exists aviationco.CusLastThirtyDays;

create view aviationco.CusLastThirtyDays as
select CHAR_TRIP as 'Charter Number',
	CHAR_DATE as 'Charter Date',
    CONCAT(CUS_FNAME, ' ',CUS_LNAME) as 'Customer Name',
	QueryAuthor() as 'Query Author'
from charter
join customer on charter.CUS_CODE = customer.CUS_CODE
where CHAR_DATE > now() - interval 30 day;

select * from CusLastThirtyDays;


#CONCAT(EMP_TITLE, ' ', EMP_FNAME, ' ',EMP_LNAME) as 'Pilot Name'