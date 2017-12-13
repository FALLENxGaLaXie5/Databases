use airsupply;
drop view if exists airsupply.vendor_purchases;

create view airsupply.vendor_purchases as
select VENDOR_NAME as 'Vendor_Name',
	count(orders.VENDOR_ID) as 'Number of Orders',
    sum(orders.ORDER_QUANTITY * product.PRODUCT_PRICE) as 'Overall dollar amount',
    QueryAuthor() as 'Query Author'
	from vendor
	join orders on vendor.VENDOR_ID = orders.VENDOR_ID
    join product on orders.PRODUCT_ID = product.PRODUCT_ID
    group by orders.VENDOR_ID
    order by sum(orders.ORDER_QUANTITY * product.PRODUCT_PRICE) desc;
;

select * from vendor_purchases;