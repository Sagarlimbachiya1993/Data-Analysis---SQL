

--Table View Inventory Section

SELECT * FROM brands
SELECT * FROM categories
SELECT * FROM products
SELECT * FROM Stocks

--Table View Sales Section

SELECT * FROM stores
SELECT * FROM orders
SELECT * FROM order_items
SELECT * FROM customers

--Business Analysis

--**Using subquery & Left Join, Full Join to get Inventory Price then get Inventory Value 
--& store details --Query uses 2 tables to get below data

select x.store_id,y.store_name,y.city,x.Quantity,x.Inventory_Value_Millions from (
SELECT store_id,sum(s.quantity) as Quantity,sum(p.list_price*s.quantity/1000000) 
as Inventory_Value_Millions FROM
Stocks s left join products p on p.product_id=s.product_id
group by store_id
) x join stores y on x.store_id=y.store_id
order by 1

--Value of inventor Store-wise

SELECT store_id,p.product_id,p.product_name,p.list_price,sum(s.quantity) as Quantity,sum(p.list_price*s.quantity) as Inventory_Value FROM
Stocks s left join products p on p.product_id=s.product_id
group by store_id,p.list_price,p.product_id,p.product_name


SELECT * FROM brands
SELECT * FROM categories
SELECT * FROM products
SELECT * FROM Stocks

--*category-wise Inventory QTY & Value of Inventory

Select c.category_name,xyz.category_id,sum(xyz.quantity) as Inventory,sum(xyz.Inventory_Value) 
as Inventory_Value from
(
Select category_id,list_price,p.product_id,product_name,s.quantity,list_price*quantity as 
Inventory_Value from products p left join stocks s
on p.product_id=s.product_id ) xyz left join categories c on xyz.category_id=c.category_id
group by xyz.category_id,c.category_name

--*Brand-wise QTY & Inventory Value

Select b.brand_name,abc.brand_id,sum(abc.quantity) as Inventory,sum(abc.Inventory_Value) 
as Inventory_value from (
Select category_id,p.brand_id,p.product_id,product_name,s.quantity,list_price*quantity 
as Inventory_Value from products p left join stocks s
on p.product_id=s.product_id ) abc join brands b on abc.brand_id=b.brand_id
group by b.brand_name,abc.brand_id
order by 2

--*Total_inventory
select * from(
SELECT sum(quantity) as Inventory_Quantity FROM Stocks ) as total

--Stores having 86% inventory of only two brands from Eight
Select b.brand_name,abc.brand_id,sum(abc.quantity) as Inventory,
sum(abc.quantity)*100/(select * from(
SELECT sum(quantity) as Inventory_Quantity FROM Stocks ) as total)
as Inventory_Percent,sum(abc.Inventory_Value) as Inventory_value from (
Select category_id,p.brand_id,p.product_id,product_name,s.quantity,list_price*quantity 
as Inventory_Value from products p left join stocks s
on p.product_id=s.product_id ) abc join brands b on abc.brand_id=b.brand_id
group by b.brand_name,abc.brand_id
order by 4 desc


SELECT * FROM stores
SELECT * FROM orders
SELECT * FROM order_items
SELECT * FROM customers

--*Total Sales
SELECT sum(quantity*list_price) as Total_sales FROM order_items 

--*Store-wise sales & its contribution

select qwerty.store_id,s.store_name,qwerty.Sales_Value,qwerty.Sales_Value*100/
(SELECT sum(quantity*list_price) as Total_sales FROM order_items) 
as Sales_Contribution from (
SELECT store_id,sum(zzz.Order_value) as Sales_Value FROM orders o 
left join (SELECT order_id,sum(quantity*list_price) as Order_value FROM order_items
group by order_id) zzz on zzz.order_id=o.order_id
group by store_id
) qwerty join stores s on qwerty.store_id=s.store_id
order by 4 desc


--Order_id with Order_value
SELECT order_id,sum(quantity*list_price) as Order_value FROM order_items
group by order_id

--**Most product sold

Select pqrs.product_id,pqrs.Sale_value,p.product_name,pqrs.Sale_value*100/8578988 as 
Sale_percent from (
SELECT product_id,sum(quantity*list_price) as Sale_value FROM order_items
group by product_id ) pqrs left join products p on p.product_id=pqrs.product_id
order by 4 desc


