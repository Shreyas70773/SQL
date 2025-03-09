# Question: Get all the products available in the market

select * from farmers_market.product;

# Question: Get 10 products available in the market 

select * from farmers_market.product
limit 10;

#Question: List down 10 rows of farmers market vendor booth asssignment, displaying the market date, vendor ID and booth number from the vendor booth assignments table

select market_date,vendor_id,booth_number from farmers_market.vendor_booth_assignments
limit 10;

## Question: Get 10 products available in the market sorted by product id

select * from farmers_market.product
order by product_id
limit 10;

## Question: what will be the output of the following set of operations 

select * from farmers_market.product 
order by product_category_id desc, product_name
limit 10;

## Answer: First Order in Desending order of PCID, then within same PCID order Ascending Alphabetical Order

## Question: get only the values of product id 4,5

select * from farmers_market.product
order by product_id
limit 2
offset 3;

## Question: get only the values of product id 13,14,15

select * from farmers_market.product
order by product_id
limit 3
offset 12;


## Question:In the customer purchases we have quantity and cost per qty, query the total amount the customer has paid along with the date , customer id, vendor  id, qty, cost per qty and total qty

select market_date,
       customer_id,
       cost_to_customer_per_qty,
       vendor_id,
       quantity,
       ROUND(quantity*cost_to_customer_per_qty,2) as total_amount
      from farmers_market.customer_purchases;


## Question: we want to merge each customers name into a single column that contains the first name, then a space then the last name,

select 
concat(customer_first_name,' ',customer_last_name) 
as customer_full_name 
from farmers_market.customer;


## Question: we want all characters except first lette of first name & last name to be capitalized.

select 
concat(concat(lower(substring(customer_first_name,1,1)),
upper(substring(customer_first_name,2))),' ',
concat(lower(substring(customer_last_name,1,1)),
upper(substring(customer_last_name,2)))) as edited_name
from farmers_market.customer;

## Question: Extract all the product names that are a part of product category 1;

select * from farmers_market.product
where product_category_id = 1;

## Question : print a report of everything customer_id 4 has purchased at the farmers market, sorted by market date, vendor ID, product ID

select * from farmers_market.customer_purchases
where customer_id = 4
order by market_date, vendor_id, product_id;

## Question : get all the products info for products with id between 3,10 but 8 muust not be included

select * from farmers_market.product
where product_id != 8
order by product_id
limit 7
offset 2;

## Method 2 for above question

select * from farmers_market.product
where product_id BETWEEN 3 and 7 OR product_id BETWEEN 9 and 10
order by product_id;

# Question find the customer detail with the first name "Carlos" and last name "Diaz"

select * from farmers_market.customer
where customer_first_name = "Carlos" AND customer_last_name = "Diaz";


# Question find all the customer detail with the last name "Diaz","Edwards","Wilson"

select * from farmers_market.customer
where customer_last_name IN ("Edwards","Diaz","Wilson");

# Question: you want to get data about a customer named Jerry but you arent sure if his name is Jerry, Jeremy, Jeremiah

select * from farmers_market.customer
where lower(customer_first_name) like 'jer%';

# Question: Find all the products from the product table without their prices

select * from farmers_market.product
where product_size is null
or trim(product_size) = "";

select product_size,
       ifnull(product_size,"NA") as replacing_null_values
       from farmers_market.product;

# Implementation of coalecse (null,null,f,g)

select *,coalesce(product_size,product_qty_type,"amit singh") from farmers_market.product;

# Question : Analyze purchases made at the farmers market on days when it rained

select * from farmers_market.customer_purchases where market_date IN (
select market_date from farmers_market.market_date_info where market_rain_flag = 1);
