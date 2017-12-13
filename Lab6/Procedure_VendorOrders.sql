use airsupply;
drop procedure if exists airsupply.findVendorOrders;

delimiter $$
create procedure airsupply.findVendorOrders(in vendor int)
begin
select ORDER_ID,
	PRODUCT_ID,
    VENDOR_ID,
    ORDER_QUANTITY, 
    ORDER_DATE,
    ARRIVAL_DATE,
    QueryAuthor() as 'Query Author'
    from orders
    where VENDOR_ID = vendor;
	#(select * from charter
	#	where charter.CHAR_DATE <= date2 and charter.CHAR_DATE >= date1) as charterInfo,
    #(select QueryAuthor() as 'Query Author') as Author;
end $$

call findVendorOrders(1001);