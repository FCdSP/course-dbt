WITH
products AS (
SELECT 
	product_id
	,name 
	,price
	,inventory
FROM {{ ref("stg_postgres__products") }}
)--products

, ordered_products AS (
SELECT 
	product_id
	,num_orders
	,quantity_shipped
	,quantity_delivered
	,quantity_preparing
	,total_quantity 
FROM {{ ref("int_products") }}
)--ordered_products

SELECT 
	products.product_id
	,products.name 
	,products.price
	,products.inventory
	,ordered_products.num_orders
	,ordered_products.quantity_shipped
	,ordered_products.quantity_delivered
	,ordered_products.quantity_preparing
	,ordered_products.total_quantity 

FROM products
left join ordered_products 
	ON products.product_id = ordered_products.product_id
