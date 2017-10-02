create table joshuasteward(
	CUS_CODE INT(6) NOT NULL,
	foreign key (CUS_CODE) references customer(CUS_CODE)
)