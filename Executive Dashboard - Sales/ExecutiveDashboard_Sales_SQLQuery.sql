--To get the orders, cutomers who purchased
select a.order_id, CONCAT(b.first_name,' ', b.last_name) as customer_name, b.city, b.state, a.order_date
from sales.orders a, sales.customers b
where a.customer_id=b.customer_id;

/* To get the orders, cutomers who purchased, number of sales and the revenue generated*/
select a.order_id, CONCAT(b.first_name,' ', b.last_name) as customer_name, b.city, b.state, a.order_date, sum(c.quantity) as 'total_units', sum(c.quantity*c.list_price) as 'revenue'
from sales.orders a join sales.customers b
on a.customer_id=b.customer_id 
join sales.order_items c
on a.order_id=c.order_id
group by a.order_id, CONCAT(b.first_name,' ', b.last_name), b.city, b.state, a.order_date;

/* To get the orders, cutomers who purchased, number of sales, revenue it generated against each product*/
select a.order_id, CONCAT(b.first_name,' ', b.last_name) as customer_name, b.city, b.state, a.order_date, sum(c.quantity) as 'total_units', sum(c.quantity*c.list_price) as 'revenue', d.product_name, e.category_name, f.store_name, h.brand_name, CONCAT(g.first_name,' ', g.last_name) as sales_rep_name
from sales.orders a join sales.customers b
on a.customer_id=b.customer_id 
join sales.order_items c
on a.order_id=c.order_id
join production.products d
on c.product_id=d.product_id
join production.categories e
on d.category_id=e.category_id
join sales.stores f
on a.store_id=f.store_id
join sales.staffs g
on a.staff_id=g.staff_id 
join production.brands h
on d.brand_id=h.brand_id
group by a.order_id, CONCAT(b.first_name,' ', b.last_name), b.city, b.state, a.order_date, d.product_name, e.category_name, f.store_name, h.brand_name, CONCAT(g.first_name,' ', g.last_name);