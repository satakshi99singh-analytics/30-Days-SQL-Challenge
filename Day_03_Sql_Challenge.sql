use ecommerce_challenge;  

/*Q1.Total number of orders placed*/ 

select count(*) as order_count 
from orders ;  

/*Q2.Find the cheapest and most expensive product*/ 

select min(price) as cheapest_product ,
       max(price) as expensive_product 
       from products;  
       
/*Q3.Count number of distinct customers who placed an order*/ 

select count(distinct customer_id) as unique_customers
from orders ; 

/*Q4.Find the average product price for each category*/ 

select category,round(avg(price),2) as avg_price 
from products 
group by category ; 

/*Q5.Total quantity of products sold (overall)*/ 

select sum(quantity) as total_items_sold 
from order_items ;  

/*Q6.Total revenue per category (after discount)*/ 

select p.category,round(sum(p.price *oi.quantity-(1-oi.discount/100)),2) as total_revenue 
from products p 
join order_items oi on p.product_id=oi.product_id 
group by p.category ;  

/*Q7.Find the customer who spent the most money*/ 

select c.customer_id,c.customer_name ,round(sum(p.price*oi.quantity-(1-oi.discount/100)),2) as total_spend 
from orders o 
join customers c on o.customer_id=c.customer_id 
join order_items oi on o.order_id=oi.order_id 
join products p on p.product_id=oi.product_id 
group by c.customer_id,c.customer_name 
order by total_spend desc 
limit 1 ;  

/*Q8.Average order value (AOV) for each payment method*/ 

select o.payment_method,round(sum(p.price*oi.quantity -(1-oi.discount/100))/count(distinct o.order_id),2)as avg_order_value 
from orders o 
join order_items oi on o.order_id=oi.order_id 
join products p on p.product_id=oi.product_id
group by o.payment_method ;  

/*Q9.Calculate the average discount per category, weighted by quantity sold (so big-volume discounts matter more).*/

select p.category,round(sum(oi.discount*oi.quantity)/nullif(sum(oi.quantity),0),2) as weighted_avg_discount_percent ,
sum(oi.quantity) as total_quantity_sold 
from products p 
join order_items oi on p.product_id=oi.product_id 
group by p.category; 

/*Q10. Top 3 Products with highest revenue per unit sold (avg revenue per item)*/ 

select p.product_id,p.product_name,sum(p.price*oi.quantity)/sum(oi.quantity) as revenue_per_unit,
sum(oi.quantity) as total_quantity 
from order_items oi 
join products p on p.product_id=oi.product_id 
group by p.product_id,product_name 
having sum(oi.quantity)>0
order by revenue_per_unit desc 
limit 3 ; 


