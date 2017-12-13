use airsupply;
drop view if exists airsupply.AllOrders;

create view airsupply.AllOrders as
select orders.ORDER_ID as 'Order_ID',
	orders.VENDOR_ID as 'Vendor_ID',
    VENDOR_NAME as 'Vendor_Name',
    orders.PRODUCT_ID as 'Product_ID',
    PRODUCT_NAME as 'Product_Name',
    PRODUCT_DESCRIPTION as 'Product_Description',
    PRODUCT_PRICE as 'Product_Price',
    orders.ORDER_QUANTITY as 'Order_QUANTITY',
    PRODUCT_PRICE * ORDER_QUANTITY as 'Cost_Per_Order',
    ACCOUNTS_PAYABLE_TERMS as 'Accounts_Payable_Terms',
    orders.ORDER_DATE as 'Order_Date',
    orders.ARRIVAL_DATE as 'Arrival_Date',
    QueryAuthor() as 'Query Author'
	from orders
	join product on orders.PRODUCT_ID = product.PRODUCT_ID
    join vendor on orders.VENDOR_ID = vendor.VENDOR_ID
    order by orders.ORDER_ID asc;
;

select * from AllOrders;