use aviationco;

INSERT INTO `charter` (`CHAR_TRIP`, 
`CHAR_DATE`, `AC_NUMBER`, `CHAR_DESTINATION`, 
`CHAR_DISTANCE`, `CHAR_HOURS_FLOWN`, 
`CHAR_HOURS_WAIT`, `CHAR_FUEL_GALLONS`,
 `CHAR_OIL_QTS`, `CUS_CODE`) VALUES
(10019, '2017-08-08 00:00:00', '2289L', 'GNV', 1609.5, 7, 11.7, 460, 1, 10020),
(10020, '2017-08-15 00:00:00', '2778V', 'MQY', 312, 2, 0, 67.2, 0, 10020),
(10021, '2017-08-23 00:00:00', '4278Y', 'ATL', 967, 6, 0, 291, 0, 10020),
(10022, '2017-09-01 00:00:00', '2778V', 'BNA', 320, 2, 4.9, 72.6, 0, 10020),
(10023, '2017-09-15 00:00:00', '4278Y', 'GNV', 1574, 8, 3.5, 340, 2, 10020),
(10024, '2017-09-22 00:00:00', '1484P', 'TYS', 644, 4, 5.2, 141, 1, 10020);

select QueryAuthor() as 'Query Author';