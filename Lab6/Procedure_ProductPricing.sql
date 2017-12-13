use airsupply;
drop procedure if exists airsupply.productPricing;

delimiter $$
create procedure airsupply.productPricing(in description varchar(100))
begin
select distinct(product.PRODUCT_ID),
	PRODUCT_NAME as 'Product',
    PRODUCT_DESCRIPTION as 'Description',
    PRODUCT_PRICE as 'Price',
    VENDOR_ID,
    QueryAuthor() as 'Query Author'
    from product
    join orders on product.PRODUCT_ID = orders.PRODUCT_ID
    where PRODUCT_DESCRIPTION = description
    order by PRODUCT_PRICE asc;
end $$

call productPricing('Airframe fasteners by Hulkey Fasteners');