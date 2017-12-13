use airsupply;
drop view if exists airsupply.DueDates;

create view airsupply.DueDates as
select ORDER_ID as 'Order Number',
	ORDER_DATE as 'Date Order Made',
	date_add(ORDER_DATE, interval vendor.ACCOUNTS_PAYABLE_TERMS day) as 'Payment Due Date',
	VENDOR_NAME as 'Vendor_Name',
	PRODUCT_ID as 'Product ID',
    QueryAuthor() as 'Query Author'
	from orders
	join vendor on orders.VENDOR_ID = vendor.VENDOR_ID
;

select * from DueDates;