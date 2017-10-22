use aviationco;
drop procedure if exists aviationco.ChartersBetween;

delimiter $$
create procedure aviationco.ChartersBetween(in date1 datetime,in date2 datetime)
begin
select CHAR_TRIP as 'Trip Number',
	CHAR_DATE as 'Trip Date',
    AC_NUMBER as 'Aircraft Number',
    CHAR_DESTINATION as 'Destination',
    CHAR_DISTANCE as 'Distance Flown',
    CHAR_HOURS_FLOWN as 'Hours in flight',
    CHAR_HOURS_WAIT as 'Waiting time in hours',
    CHAR_FUEL_GALLONS as 'Fuel in Gallons',
    CHAR_OIL_QTS as 'Oil in quarts',
    CUS_CODE as 'Customer Code',
    QueryAuthor() as 'Query Author'
    from charter
    where charter.CHAR_DATE <= date2 and charter.CHAR_DATE >= date1;
	#(select * from charter
	#	where charter.CHAR_DATE <= date2 and charter.CHAR_DATE >= date1) as charterInfo,
    #(select QueryAuthor() as 'Query Author') as Author;
end $$

call ChartersBetween('2014-02-07 00:00:00','2014-02-09 00:00:00');