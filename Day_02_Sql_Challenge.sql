use ecommerce_challenge;  

/*Q1: Find all distinct product categories that customers from the South region have purchased.*/

select distinct p.category 
from Orders o  
join customers c on o.customer_id=c.customer_id
join order_items oi on oi.order_id=o.order_id 
join products p on p.product_id=oi.product_id 
where c.region='South'; 

/*Q2.Get the first 5 unique cities where orders were shipped using Debit Card.*/ 

select distinct c.city
from orders o
join customers c 
on c.customer_id=o.customer_id 
where o.payment_method='Debit Card' 
order by c.city asc 
limit 5 ;

/*Q3.Find the distinct customers who purchased more than two category of products.*/

select  c.customer_id,c.customer_name 
from customers c 
join orders o on c.customer_id=o.customer_id 
join order_items oi on o.order_id=oi.order_id 
join products p on oi.product_id=p.product_id 
group by c.customer_id,c.customer_name 
having count(distinct p.category)>2; 

/*Q4. List the top 3 most expensive unique products in the Sports category.*/

select distinct product_name ,price 
from products 
where category='Sports' 
order by price desc
limit 3; 

/*Q5. Find all customers who have never used Wallet or Cash on Delivery as a payment method.*/

select distinct c.customer_id,c.customer_name 
from customers c 
join orders o 
on c.customer_id=o.customer_id 
where o.payment_method not in ('Wallet','Cash on Delivery'); 

/*Q6. Get the unique product names purchased in orders placed between June 2025 and August 2025.*/

select distinct p.product_name 
from orders  o 
join order_items oi on o.order_id=oi.order_id 
join products p on p.product_id=oi.product_id 
where o.order_date between '2025-06-01' and '2025-08-31'; 

/*Q7. Find the distinct customers who purchased products priced between 2000 and 4000.*/ 

select distinct c.customer_id,c.customer_name 
from orders o 
join customers c on o.customer_id=c.customer_id 
join order_items oi on oi.order_id =o.order_id 
join products p on oi.product_id=p.product_id 
where p.price between 2000 and 4000; 

/*Q8. Show the top 5 customers (distinct) who placed the earliest orders.*/

select c.customer_id,c.customer_name,o.order_date 
from customers c 
join orders o on c.customer_id=o.customer_id 
order by o.order_date asc 
limit 5;

/*Q9. Retrieve distinct payment methods used by customers in the West region.*/ 

select distinct o.payment_method 
from orders o 
join customers c on o.customer_id=c.customer_id 
where c.region='West';  


/*Q10. Find the top 5 distinct products (by product_id) that gave the highest discount in any order.*/

select distinct p.product_id ,oi.discount
from products p 
join order_items oi on p.product_id=oi.product_id 
order by oi.discount desc 
limit 5;