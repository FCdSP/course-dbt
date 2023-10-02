SELECT 
    
	DISTINCT DATE(created_at) AS created_date
    , product_id
    , page_url
    , session_id
    , user_id

FROM {{ ref('stg_postgres__events') }}
WHERE event_type = 'page_view' AND product_id IS NOT NULL