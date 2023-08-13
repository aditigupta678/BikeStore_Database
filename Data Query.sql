select 
	orde.order_id, concat(cust.first_name,' ',cust.last_name) as customers,
	cust.city,
    cust.state,
    orde.order_date, 
	sum(ite.quantity) as 'total_units',
	sum(ite.quantity * ite.list_price) as 'revenue',
    pro.product_name,
    cat.category_name,
    sto.store_name,
    concat(sta.first_name,' ',sta.last_name) as 'sales_rep'
from sales.orders orde join sales.customers cust
on orde.Customer_id = cust.Customer_id
join sales.order_items ite
on orde.order_id = ite.order_id
join production.products pro
on ite.product_id = pro.product_id
join production.categories cat
on pro.category_id = cat.category_id
join sales.stores sto
on orde.store_id = sto.store_id
join sales.staffs sta
on orde.staff_id = sta.staff_id
group by
	orde.order_id, customers,
	cust.city,
    cust.state,
    orde.order_date,
    pro.product_name,
    cat.category_name,
    sto.store_name,
    sales_rep;