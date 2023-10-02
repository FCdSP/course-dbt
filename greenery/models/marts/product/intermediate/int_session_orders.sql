SELECT 
    
	session_id
    , COUNT(DISTINCT order_id)	AS order_count

FROM {{ ref('stg_postgres__events') }}
WHERE order_id IS NOT NULL
GROUP BY ALL