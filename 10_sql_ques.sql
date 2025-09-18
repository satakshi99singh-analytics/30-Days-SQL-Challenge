-- find the top 3 customers by the spend?
select customer_id,sum(amount) as total_spend
from customers 
group by customer_id
order by total_spend desc
limit 3;


-- find the total sales in 2024 per customer?
select sum(amount) as total_sales
from customers
where year(order_date)=2024
group by customer_id;