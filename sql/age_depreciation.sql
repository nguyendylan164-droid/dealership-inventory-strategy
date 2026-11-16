SELECT "year", ROUND(AVG(price),2) AS avg_price
FROM inventory_pricing
GROUP BY "year"
ORDER BY "year" DESC