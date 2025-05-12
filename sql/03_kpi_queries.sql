SELECT 
    dp.product_name,
    SUM(fs.total_amount) AS total_revenue
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dp.product_name
ORDER BY total_revenue DESC
LIMIT 3;


SELECT 
    ds.region,
    SUM(fs.total_amount) AS region_sales
FROM fact_sales fs
JOIN dim_store ds ON fs.store_id = ds.store_id
GROUP BY ds.region;


SELECT 
    dd.is_weekend,
    COUNT(fs.sales_id) AS total_sales,
    SUM(fs.total_amount) AS revenue
FROM fact_sales fs
JOIN dim_date dd ON fs.date_id = dd.date_id
GROUP BY dd.is_weekend;
