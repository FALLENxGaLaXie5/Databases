use aviationco;

insert into pilot values (108, 'COM', 1, '2013-01-02 00:00:00', '2014-12-12');
insert into earnedrating values (108, 'INSTR','1998-08-20'), (108, 'MEL', '1999-06-12'), (108,'SEL','2001-05-9');

alter table aviationco.crew drop foreign key crew_ibfk_2;

alter table aviationco.crew add constraint `fk_from_pilotempnum` foreign key (`EMP_NUM`) references `pilot`(`EMP_NUM`);
#alter table aviationco.pilot drop column pilot.PIL_RATINGS;

select *, QueryAuthor() as 'Query Author' from aviationco.pilot;