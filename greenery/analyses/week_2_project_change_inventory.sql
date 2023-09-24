WITH change_inventory AS (

SELECT 

product_id
, name
, price
, inventory
, COALESCE(LAG(INVENTORY) OVER (PARTITION BY product_id ORDER BY dbt_updated_at),INVENTORY)  AS previous_inventory
, inventory - (COALESCE(LAG(INVENTORY) OVER (PARTITION BY product_id ORDER BY dbt_updated_at),INVENTORY)) AS change_in_inventory
, CASE WHEN (inventory - (COALESCE(LAG(INVENTORY) OVER (PARTITION BY product_id ORDER BY dbt_updated_at),INVENTORY))) != 0 THEN 1 ELSE 0 END AS flag_change_in_inventory
, dbt_scd_id
, dbt_updated_at
, dbt_valid_from
, dbt_valid_to


FROM dev_db.dbt_fpetribufundthroughcom.products_snapshot
ORDER BY product_id, dbt_updated_at
)--change_inventory

SELECT * FROM change_inventory WHERE flag_change_in_inventory = 1 order by change_in_inventory DESC