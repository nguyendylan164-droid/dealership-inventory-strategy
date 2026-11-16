SELECT brand, model, COUNT(model) as total_count
FROM inventory_pricing
GROUP BY brand, model
ORDER BY total_count DESC