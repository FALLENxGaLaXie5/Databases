select AC_NUMBER as AC, max(Total_Distance) as 'Total Distance Travelled', "Josh" as 'Query Executor', now() as 'Query Date'
from (select AC_NUMBER, sum(CHAR_DISTANCE) as Total_Distance from charter group by AC_NUMBER) as x
group by AC
order by Total_Distance desc limit 1;