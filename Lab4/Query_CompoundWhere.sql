select *, "Josh" as 'Query Executor', now() as 'Query Date'
from charter
where (charter.CHAR_DISTANCE < 1000.0 and charter.CHAR_DISTANCE > 500.0) or
		(charter.CHAR_DISTANCE < 1600 and charter.CHAR_DISTANCE > 1500)
order by charter.CHAR_DISTANCE desc;