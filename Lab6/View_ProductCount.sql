use airsupply;
drop view if exists airsupply.vendor_product_count;

create view airsupply.vendor_product_count as
select VENDOR_NAME as 'Vendor_Name',
	count(orders.PRODUCT_ID) as 'Number of Products',
    QueryAuthor() as 'Query Author'
	from vendor
	join orders on vendor.VENDOR_ID = orders.VENDOR_ID
    group by orders.VENDOR_ID
    order by count(orders.PRODUCT_ID) desc;
;

select * from vendor_product_count;