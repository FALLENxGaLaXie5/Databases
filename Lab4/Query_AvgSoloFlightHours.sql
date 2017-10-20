#find the flights that only have 1 crew, aka in crew table, only get rows where no other occurrences of that CHAR_TRIP number; store in table
select AVG(Hrs) as 'Solo Pilots: Avg Hours Flown',
	"Josh" as 'Query Executor', 
	now() as 'Query Date'
from (select charter.CHAR_HOURS_FLOWN as Hrs
		from crew
        join charter on crew.CHAR_TRIP = charter.CHAR_TRIP
        group by crew.CHAR_TRIP
        having count(crew.CHAR_TRIP) = 1) V1;