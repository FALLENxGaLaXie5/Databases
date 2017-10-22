use aviationco;
drop view if exists aviationco.RelevantAirportInfo;

create view aviationco.RelevantAirportInfo as
select AIRPORT_CODE as 'Airport Number',
	AIRPORT_STATE as 'Airport State',
    PORT_CITY as 'Airport City',
    PORT_COUNTRY as 'Airport Country',
    count(CHAR_DESTINATION) as 'Charter Count',
 	QueryAuthor() as 'Query Author'
from charter
join airport on charter.CHAR_DESTINATION = airport.AIRPORT_CODE
group by charter.CHAR_DESTINATION;

select * from RelevantAirportInfo;

