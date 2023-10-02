SELECT

	created_date
	, product_id
	, SUM(session_count)                    AS session_count
	, SUM(order_count)                      AS order_count
	, SUM(order_count) / SUM(session_count) AS daily_conversion

FROM {{ ref ('fact_product_daily_orders') }}
GROUP BY ALL