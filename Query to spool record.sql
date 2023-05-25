
SELECT 
--order detils
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) customer_name,
	cus.city,
	cus.state,
	ord.order_date,
--sales volume & total revenue generated
	SUM(ite.quantity) total_units,
	SUM(ite.quantity * ite.list_price) revenue,
--name of the product that was purchased
	pro.product_name,
--category of the products that were purchased
	prc.category_name,
--name of the product brand
	prd.brand_name,
--the store at which the sales took place
	sto.store_name,
--sale rep that made the sales
	CONCAT(stf.first_name, ' ', stf.last_name) sale_rep
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
JOIN production.categories prc
ON pro.category_id = prc.category_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs stf
ON ord.staff_id = stf.staff_id
JOIN production.brands prd
ON pro.brand_id = prd.brand_id
GROUP BY 
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	product_name,
	prc.category_name,
	prd.brand_name,
	sto.store_name,
	CONCAT(stf.first_name, ' ', stf.last_name);

