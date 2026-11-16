SELECT ROUND(AVG(price),2) as avg_price, title_status, brand, mileage_cohort
FROM inventory_pricing
GROUP BY title_status, brand, mileage_cohort