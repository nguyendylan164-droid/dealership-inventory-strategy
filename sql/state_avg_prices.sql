SELECT
	"state",
	COUNT(*) AS listing_count,
	ROUND(AVG(price), 2) AS avg_price,
	ROUND(AVG(price) - (
		SELECT AVG(price)
		FROM inventory_pricing
		WHERE country = 'usa'
		), 2) AS diff_from_national_avg, 
	ROUND(AVG("year")) AS avg_year,
	ROUND(AVG(mileage)) AS avg_mileage
FROM inventory_pricing
WHERE country = 'usa'
GROUP BY "state"
HAVING COUNT(*) > 10
ORDER BY avg_price ASC;