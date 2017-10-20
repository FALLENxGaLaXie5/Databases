use aviationco;

select aircraft.AC_NUMBER as 'Craft Number', model.MOD_NAME as 'Model Name',
 model.MOD_MANUFACTURER as 'Model Manufacturer',
round(avg(TripMPG), 2) as MPG,
 QueryAuthor() as 'Query Author'
from  (select charter.AC_NUMBER as Craft, (charter.CHAR_DISTANCE / charter.CHAR_FUEL_GALLONS) as TripMPG
		from aviationco.charter) as charterMPG
join aircraft on Craft = aircraft.AC_NUMBER
join model on aircraft.MOD_CODE = model.MOD_CODE
group by Craft
order by MPG desc;
 #sum(charter.CHAR_DISTANCE)/sum(charter.CHAR_FUEL_GALLONS) as MPG