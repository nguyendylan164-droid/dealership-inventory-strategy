SELECT
	brand,
	model,
	avg_price,
	total_count,
	ROUND(
		100 * (total_count/SUM(total_count) OVER ()), 2
	) AS pct_of_total_volume,
	DENSE_RANK() OVER 
		(PARTITION BY brand ORDER BY total_count DESC)
	AS brand_volume_rank
FROM (
	SELECT 
		brand, 
		model,
		ROUND(AVG(price),2) AS avg_price,
		COUNT(model) as total_count
	FROM inventory_pricing
	GROUP BY brand, model
) AS model_volume
ORDER BY total_count DESC