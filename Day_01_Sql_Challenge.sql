use ecommerce_challenge

/*Q1. List all orders placed by customers from the East region, showing customer name, city, order_id, 
and order_date.*/

select  c.customer_name,c.city,o.order_id,o.order_date
from customers c
 join orders o 
on c.customer_id=o.customer_id
where region='East';

/*Q2.Find customers who made orders using Credit Card, sorted by most recent order date.*/

select c.customer_id,c.customer_name,o.payment_method,o.order_date
from customers c
 join orders o
on c.customer_id=o.customer_id
where o.payment_method='Credit Card'
order by o.order_date desc;

/*Q3.Show the top 5 most recent orders across all customers (order_id, customer_name, order_date).*/

select o.order_id,c.customer_name,o.order_date
from customers c 
 join orders o 
on c.customer_id=o.customer_id
order by o.order_date
limit 5;

/*Q4. Find customers from West region who had at least one order shipped later than the order date.*/

select distinct c.customer_name,c.city
from customers c 
join orders o 
on c.customer_id=o.customer_id
where region='West'
and o.ship_date > o.order_date;

/*Q5. Retrieve all orders placed in the year 2023 by customers in the South region.*/
select c.customer_name,c.city,o.order_id,o.order_date
from customers c 
join orders o 
on c.customer_id=o.customer_id
where c.region='South' 
and year(o.order_date)=2023;

/*Q6. Get a list of customers from East or West region whose orders were paid via UPI, sorted by region.*/

select c.customer_id,c.customer_name,c.region,o.payment_method
from customers c 
join orders o 
on c.customer_id=o.customer_id
where c.region in('East','West') 
and o.payment_method='UPI' 
order by c.region ; 

/*Q7. Find the first order placed by each customer (minimum order_date).*/ 

select c.customer_id,c.customer_name,min(o.order_date)as first_order_date
from customers c
join orders o 
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name; 

/*Q8. Retrieve the last 3 shipped orders (non-NULL ship_date), showing customer name and ship_date.*/ 

select c.customer_name,o.ship_date
from customers c 
join orders o 
on c.customer_id=o.customer_id
where o.ship_date is not null
order by o.ship_date desc 
limit 3; 

/*Q9. List all products that have been ordered with a discount greater than 20%.*/ 

select p.product_name,oi.discount
from products p 
join order_items oi 
on p.product_id=oi.product_id 
where oi.discount>0.2 ; 

/*Q10. List the top 5 most expensive products that belong to category = 'Electronics'.*/ 

select product_id,product_name,category,price 
from products
where category='Electronics'
order by price desc 
limit 5 ; 



