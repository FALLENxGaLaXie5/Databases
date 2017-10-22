use aviationco;
drop procedure if exists aviationco.FlightsCustomer;

delimiter $$
create procedure aviationco.FlightsCustomer(in cus_code int(6))
begin
select concat(CUS_FNAME, ' ', CUS_LNAME) as 'Costumer Name', 
	CHAR_TRIP as 'Trip Number',
	CHAR_DATE as 'Flight Date',
    AC_NUMBER as 'Aircraft Number',
    CHAR_DESTINATION as 'Flight Destination',
    CHAR_DISTANCE as 'Flight distance',
    CHAR_HOURS_FLOWN as 'Hours Flown',
    CHAR_HOURS_WAIT as 'Waiting hours',
    CHAR_FUEL_GALLONS as 'Fuel in gallons',
    CHAR_OIL_QTS as 'Oil in quarts',
    QueryAuthor() as 'Query Author'
from customer
join charter on customer.CUS_CODE = charter.CUS_CODE
where customer.CUS_CODE = cus_code;
end $$

call FlightsCustomer(10011);