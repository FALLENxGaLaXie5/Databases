use aviationco;
alter table aviationco.pilot drop column pilot.PIL_RATINGS;

select *, QueryAuthor() as 'Query Author' from aviationco.pilot;