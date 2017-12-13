use magic;
drop procedure if exists magic.AccessStats;

delimiter $$
create procedure magic.AccessStats(in deck1 varchar(30), in deck2 varchar(30))
begin
select concat(deck1, ' vs. ', deck2) as 'Match',
	#Card.Name as 'Deck 1 Win Chance',
    (WinStat.WinDeck1 + WinStat.WinDeck2) as 'Total Games',
    concat(format(((WinStat.WinDeck1/(WinStat.WinDeck1 + WinStat.WinDeck2)) * 100), 0), '%') as 'Win Chance Deck 1'
    #QueryAuthor() as 'Query Author'
    from WinStat
    where WinStat.Deck1 = deck1 and WinStat.Deck2 = deck2;
    #group by WinStat.WinDeck1, WinStat.WinDeck2;
	#(select * from charter
	#	where charter.CHAR_DATE <= date2 and charter.CHAR_DATE >= date1) as charterInfo,
    #(select QueryAuthor() as 'Query Author') as Author;
end $$

call AccessStats('Dimir Pirates', 'Dimir Pirates');