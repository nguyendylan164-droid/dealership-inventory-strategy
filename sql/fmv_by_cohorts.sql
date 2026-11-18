SELECT ROUND(AVG(price),2) as avg_price, brand, mileage_cohort
FROM inventory_pricing
GROUP BY brand, mileage_cohort
ORDER BY brand ASC, mileage_cohort ASC