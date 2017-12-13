use magic;
drop procedure if exists magic.DeckSearch;

delimiter $$
create procedure magic.DeckSearch(in deck varchar(30))
begin
select Deck.DeckName as 'Deck Name',
	Card.Name as 'Card Name',
    DeckCard.Number_Of_Cards as 'Number of Card'
    #QueryAuthor() as 'Query Author'
    from Deck
    join DeckCard on Deck.Deck_ID = DeckCard.Deck_ID
    join Card on Card.Card_ID = DeckCard.Card_ID
    where Deck.DeckName = deck;
	#(select * from charter
	#	where charter.CHAR_DATE <= date2 and charter.CHAR_DATE >= date1) as charterInfo,
    #(select QueryAuthor() as 'Query Author') as Author;
end $$

call DeckSearch('Dimir Pirates');