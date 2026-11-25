SELECT 
	"year",
	listing_count,
	avg_mileage,
	avg_price,
	avg_price - LAG(avg_price) OVER (ORDER BY "year" DESC
	) AS yoy_price_change,
	ROUND(
		100 * (avg_price - LAG(avg_price) OVER (ORDER BY "year" DESC))
		/ NULLIF(LAG(avg_price) OVER (ORDER BY "year" DESC), 0),
		2
	) AS yoy_pct_change
FROM (
	SELECT 
		"year",
		ROUND(AVG(mileage)) AS avg_mileage,
		ROUND(AVG(price),2) AS avg_price,
		COUNT(*) AS listing_count
	FROM inventory_pricing
	GROUP BY "year"
) AS yearly_fmv
ORDER BY "year" DESC