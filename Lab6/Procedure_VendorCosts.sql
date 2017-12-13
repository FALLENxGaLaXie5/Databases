use airsupply;
drop procedure if exists airsupply.vendorCosts;

delimiter $$
create procedure airsupply.vendorCosts(in vendor int)
begin
select sum(ORDER_QUANTITY * PRODUCT_PRICE)as 'Total Costs of Goods',
	PRODUCT_NAME as 'Product',
    orders.VENDOR_ID as 'Vendor ID',
    vendor.VENDOR_NAME as 'Vendor Name',
    QueryAuthor() as 'Query Author'
    from orders
    join product on orders.PRODUCT_ID = product.PRODUCT_ID
    join vendor on orders.VENDOR_ID = vendor.VENDOR_ID
    where orders.VENDOR_ID = vendor
    group by orders.VENDOR_ID;
	#(select * from charter
	#	where charter.CHAR_DATE <= date2 and charter.CHAR_DATE >= date1) as charterInfo,
    #(select QueryAuthor() as 'Query Author') as Author;
end $$

call vendorCosts(1001);