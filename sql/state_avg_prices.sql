SELECT ROUND(AVG(price),2) as avg_price, "state"
FROM inventory_pricing
WHERE country = 'usa'
GROUP BY "state"
HAVING COUNT(*) > 10
ORDER BY avg_price DESC