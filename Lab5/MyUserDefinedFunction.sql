use airsupply;
drop function if exists QueryAuthor;
delimiter $$

create function QueryAuthor() 
returns varchar(40)
	deterministic
BEGIN
	declare myName varchar(20);
    set myName = 'Josh';
    return CONCAT('Ran on ', ' ', date_format(now(),'%M %D, %Y'), ' by ', myName, ' ');
END $$

delimiter ;

#GRANT EXECUTE ON FUNCTION aviationco.
select QueryAuthor() as 'Query Author';