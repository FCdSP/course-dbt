SELECT 
	address_id 
	,address 
	,zipcode 
	,state
	,country
FROM {{ source("postgres", "addresses") }}