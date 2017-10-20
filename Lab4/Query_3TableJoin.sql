select airport.AIRPORT_STATE as 'State Arriving At', 
	charter.AC_NUMBER as 'Aircraft',
    model.MOD_MANUFACTURER as 'Aircraft Manufacturer',
    "Josh" as 'Query Executor', 
	now() as 'Query Date'
from airport
join charter on airport.AIRPORT_CODE = charter.CHAR_DESTINATION
join aircraft on charter.AC_NUMBER = aircraft.AC_NUMBER
join model on aircraft.MOD_CODE = model.MOD_CODE
where model.MOD_MANUFACTURER = 'Piper';