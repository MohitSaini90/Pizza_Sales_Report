select * from pizza_sales;

--Total revenue
select sum(total_price) as total_revenue from pizza_sales;

--Average order cost per order : Total revenue divided by total distinct orders
select sum(total_price)/count(distinct(order_id)) as average_order_value from pizza_sales;

--Total quantity of pizza sold
select sum(quantity) as total_pizza_quantity from pizza_sales;

--Total orders placed
select count(distinct(order_id)) as total_orders from pizza_sales;

--Average pizza per Order
select 
	cast(
		cast(sum(quantity) as decimal(10,2)) /
		cast(count(distinct(order_id)) as decimal(10, 2)) 
		as decimal(10,2)
		)
	as pizza_per_order 
from pizza_sales;

--Daily trend of orders
select DATENAME(DW, order_date) as order_day, 
	count(distinct(order_id)) as total_orders 
from pizza_sales 
	group by DATENAME(DW, order_date);

--Monthly trend of orders
select DATENAME(month, order_date) as order_month, 
	count(distinct(order_id)) as total_orders 
from pizza_sales 
	group by DATENAME(month, order_date);

--quantity of pizza sold per Category 
select pizza_category as pizza_category, 
	sum(quantity) as total_orders_quantity
from pizza_sales 
	group by pizza_category;


--percentage of pizza sales by pizza category
select pizza_category as pizza_category, 
	(sum(total_price)*100/(select sum(total_price) from pizza_sales)) as percentage_sales
from pizza_sales 
	group by pizza_category;


--percentage of pizza sales by pizza category and day of the week
select pizza_category as pizza_category,DateName(DW, order_date) as order_day, 
	(sum(total_price)*100/(select sum(total_price) from pizza_sales as p2 where DateName(DW, p2.order_date)=DateName(DW,p1.order_date))) as percentage_sales
from pizza_sales as p1
	group by pizza_category, DateName(DW, order_date) 
	order by DateName(DW, order_date);


--percentage of pizza sales by pizza size
select pizza_size as pizza_size, sum(total_price) as total_sales,
	(sum(total_price)*100/(select sum(total_price) from pizza_sales)) as percentage_sales
from pizza_sales 
	group by pizza_size;

--top 5 best most sold pizzas
select top 5 pizza_name as pizza_name, sum(quantity) as pizza_quantity
	from pizza_sales 
		group by pizza_name order by pizza_quantity DESC;

--top 5 best selling pizzas by revenue
select top 5 pizza_name as pizza_name, sum(total_price) as total_price
	from pizza_sales 
		group by pizza_name order by total_price DESC;


--bottom 5 best most sold pizzas
select top 5 pizza_name as pizza_name, sum(quantity) as pizza_quantity
	from pizza_sales 
		group by pizza_name order by pizza_quantity ASC;

--bottom 5 best selling pizzas by revenue
select top 5 pizza_name as pizza_name, sum(total_price) as total_price
	from pizza_sales 
		group by pizza_name order by total_price ASC;




