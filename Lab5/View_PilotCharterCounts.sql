use aviationco;
drop view if exists aviationco.PilotCharterCounts;

create view aviationco.PilotCharterCounts as
select CONCAT(EMP_TITLE, ' ', EMP_FNAME, ' ',EMP_LNAME) as 'Pilot Name',
	count(crew.EMP_NUM) as 'Pilot Count',
	QueryAuthor() as 'Query Author'
from pilot
join employee on pilot.EMP_NUM = employee.EMP_NUM
join crew on pilot.EMP_NUM = crew.EMP_NUM
where crew.CREW_JOB = 'Pilot'
group by crew.EMP_NUM
order by count(crew.EMP_NUM) desc;

select * from PilotCharterCounts;