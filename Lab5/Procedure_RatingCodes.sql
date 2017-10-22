use aviationco;
drop procedure if exists aviationco.RatingCodes;

delimiter $$
create procedure aviationco.RatingCodes(in rating varchar(5))
begin
select CONCAT(EMP_TITLE,' ', EMP_FNAME, ' ', EMP_LNAME) as 'Employee Name',
	RTG_CODE as 'Rating Code',
 	QueryAuthor() as 'Query Author'
from employee
join earnedrating on employee.EMP_NUM = earnedrating.EMP_NUM
where earnedrating.RTG_CODE = rating;
end $$

call RatingCodes('CFI');