use airsupply;
drop procedure if exists airsupply.ordersByDate;

delimiter $$
create procedure airsupply.ordersByDate(in startDate datetime, in endDate datetime)
begin
select ORDER_ID,
	PRODUCT_ID,
    VENDOR_ID,
    QueryAuthor() as 'Query Author'
    from orders
    where (ORDER_DATE between startDate and endDate) or ORDER_DATE = startDate or ORDER_DATE = endDate
    order by ORDER_DATE asc;
end $$

call ordersByDate('2017-05-27 00:00:00', '2017-09-13 00:00:00');