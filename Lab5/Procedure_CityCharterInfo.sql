use aviationco;
drop procedure if exists aviationco.CityCharterInfo;

delimiter $$
create procedure aviationco.CityCharterInfo(in city varchar(15))
begin
select charter.AC_NUMBER as 'Aircrafts that have been charted to this city',
	MOD_CODE as 'Model Code',
    count(charter.AC_NUMBER) as 'Number of Flights with this Airplane',
    sum(charter.CHAR_DISTANCE) as 'Total Distance Traveled for this Aircraft',
    
    #count(CHAR_DESTINATION) as 'Number of Charters to this city',
    QueryAuthor() as 'Query Author'
    from charter
    join aircraft on charter.AC_NUMBER = aircraft.AC_NUMBER
    where CHAR_DESTINATION = city
    group by charter.AC_NUMBER;
    
    
	#(select * from charter
	#	where charter.CHAR_DATE <= date2 and charter.CHAR_DATE >= date1) as charterInfo,
    #(select QueryAuthor() as 'Query Author') as Author;
end $$

call CityCharterInfo('STL');