use aviationco;
drop procedure if exists aviationco.AvailableAircrafts;

delimiter $$
create procedure aviationco.AvailableAircrafts(in seats float)
begin
select MOD_CODE as 'Aircraft Model Code',
	MOD_NAME as 'Aircraft Model Name',
    AC_NUMBER as 'Aircraft Number',

    QueryAuthor() as 'Query Author'
    from model
    join aircraft on model.MOD_CODE = aircraft.MOD_CODE
    where MOD_SEATS >= seats;
	#(select * from charter
	#	where charter.CHAR_DATE <= date2 and charter.CHAR_DATE >= date1) as charterInfo,
    #(select QueryAuthor() as 'Query Author') as Author;
end $$

call AvailableAircrafts(8);