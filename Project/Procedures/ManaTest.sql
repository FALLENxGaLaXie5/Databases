use magic;
drop procedure if exists magic.ManaTest;

delimiter $$
create procedure magic.ManaTest(in mana numeric)
begin
select Artist.Name as 'Artist Name',
    Card.Name as 'Card Name',
    Types.Name as 'Types',
    Subtypes.Name as 'Subtypes',
    Card.Mana_Cost as 'Mana Cost',
    Card.Power as 'Power',
    Card.Toughness as 'Toughness',
    Card.Loyalty as 'Loyalty',
    Card.Ability as 'Ability',
    Card.Flavor_Text as 'Flavor Text',
    Card.Color as 'Color',
    Artist.Name as 'Artist'
    #QueryAuthor() as 'Query Author'
    from Card
    join Artist on Card.Artist_ID = Artist.Artist_ID
    join Types on Card.Card_ID = Types.Card_ID
    join Subtypes on Card.Card_ID = Subtypes.Card_ID
    where Card.ConvManaCost = mana;
	#(select * from charter
	#	where charter.CHAR_DATE <= date2 and charter.CHAR_DATE >= date1) as charterInfo,
    #(select QueryAuthor() as 'Query Author') as Author;
end $$

call ManaTest(6.0);