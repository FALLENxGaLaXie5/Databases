use aviationco;

#insert into crew values (10019, 109, 'Pilot');
#insert into crew values (10019, 106, 'Pilot');

#insert into crew values (10020, 101, 'Pilot');
#insert into crew values (10020, 104, 'Pilot');

insert into crew values (10021, 101, 'Pilot');
insert into crew values (10021, 104, 'Pilot');

select * from crew where CHAR_TRIP = 10021;
drop trigger if exists PilotCheck;
delimiter $$
create trigger PilotCheck before update on crew
for each row
begin
if new.CREW_JOB = 'Pilot' and old.CREW_JOB = 'Pilot' then
	set new.CREW_JOB = 'Copilot';
end if;
end $$