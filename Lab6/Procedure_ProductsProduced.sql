use airsupply;
drop procedure if exists airsupply.findProducts;

delimiter $$
create procedure airsupply.findProducts(in vendor int)
begin
select distinct(product.PRODUCT_ID),
	PRODUCT_NAME as 'Product',
    PRODUCT_DESCRIPTION as 'Description',
    PRODUCT_PRICE as 'Price',
    QueryAuthor() as 'Query Author'
    from orders
    join product on orders.PRODUCT_ID = product.PRODUCT_ID
    where orders.VENDOR_ID = vendor
    group by product.PRODUCT_ID
    order by PRODUCT_PRICE desc;
end $$

call findProducts(1001);