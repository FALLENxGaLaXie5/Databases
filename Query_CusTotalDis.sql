select aircraft.AC_NUMBER, MOD_CODE, 
	count(charter.AC_NUMBER) as NumOfCharters, 
	sum(CHAR_DISTANCE) as TotalDistanceTravelled, 
    "Josh" as 'Query Executor', 
    now() as 'Query Date'
from aircraft
join charter on aircraft.AC_NUMBER = charter.AC_NUMBER
where CHAR_DESTINATION = 'STL' or CHAR_DESTINATION = 'ATL'
group by aircraft.AC_NUMBER
order by TotalDistanceTravelled desc;