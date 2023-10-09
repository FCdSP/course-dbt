SELECT 

	DATE(created_at) AS created_date                                                  
	, user_id
	{{ events_sorter('stg_postgres__events', 'event_type') }}

FROM  {{ ref ('stg_postgres__events') }}
GROUP BY ALL