SELECT

	ipt.created_date
    , ipt.product_id
    , ipt.page_url
    , count(distinct ipt.session_id) session_count
    , count(ipt.session_id) page_view_count
    , count(distinct ipt.user_id) user_count
    , sum(iso.order_count) order_count
    
FROM 	  {{ ref('int_product_traffic') }} AS ipt
LEFT JOIN {{ ref('int_session_orders') }}  AS iso 
		ON ipt.session_id = iso.session_id
GROUP BY ALL