use airsupply;
drop view if exists airsupply.ShippingStats;

create view airsupply.ShippingStats as
select VENDOR_ID as 'Vendor',
	avg(datediff(ARRIVAL_DATE, ORDER_DATE)) as 'Average Delivery in Days',
    QueryAuthor() as 'Query Author'
	from orders
    group by VENDOR_ID
    order by avg(datediff(ARRIVAL_DATE, ORDER_DATE)) desc;

select * from ShippingStats;