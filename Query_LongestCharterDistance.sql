select AC_NUMBER, sum(CHAR_DISTANCE) as 'Total Distance Travelled', "Josh" as 'Query Executor', now() as 'Query Date'
from charter
group by AC_NUMBER;