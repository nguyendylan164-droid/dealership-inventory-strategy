SELECT 
	brand,
	mileage_cohort,
	listing_count,
	avg_price,
	(avg_price - LAG(avg_price) OVER (
		PARTITION BY brand ORDER BY cohort_order
	)) AS price_change_prev_tier,
	ROUND(
		100 * (avg_price - FIRST_VALUE(avg_price) OVER (PARTITION BY brand ORDER BY cohort_order))
		/ NULLIF(FIRST_VALUE(avg_price) OVER (PARTITION BY brand ORDER BY cohort_order), 0),
		2
	) AS pct_change_from_low
FROM (
	SELECT
		ROUND(AVG(price),2) as avg_price, 
		brand, 
		mileage_cohort,
		COUNT(*) AS listing_count,
		CASE
			WHEN mileage_cohort LIKE 'Low%' THEN 1
			WHEN mileage_cohort LIKE 'Medium%' THEN 2
			WHEN mileage_cohort LIKE 'High%' THEN 3
			WHEN mileage_cohort LIKE 'Very High%' THEN 4
		END AS cohort_order
	FROM inventory_pricing
	WHERE brand IN ('chevrolet', 'ford', 'dodge', 'nissan')
	GROUP BY brand, mileage_cohort
) AS cohort_stats
ORDER BY brand ASC, cohort_order ASC;