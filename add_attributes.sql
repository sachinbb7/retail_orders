ALTER TABLE orders
ADD COLUMN sales_2022 DECIMAL(10,2),
ADD COLUMN sales_2023 DECIMAL(10,2),
ADD COLUMN growth DECIMAL(10,2);

CREATE TEMPORARY TABLE subcat_aggregates AS
SELECT 
    sub_category,
    ROUND(SUM(CASE WHEN YEAR(order_date) = 2022 THEN sales_price ELSE 0 END), 2) AS sales_2022,
    ROUND(SUM(CASE WHEN YEAR(order_date) = 2023 THEN sales_price ELSE 0 END), 2) AS sales_2023,
    ROUND(
        100.0 * (
            SUM(CASE WHEN YEAR(order_date) = 2023 THEN sales_price ELSE 0 END) - 
            SUM(CASE WHEN YEAR(order_date) = 2022 THEN sales_price ELSE 0 END)
        ) / NULLIF(SUM(CASE WHEN YEAR(order_date) = 2022 THEN sales_price ELSE 0 END), 0),
    2) AS growth
FROM orders
GROUP BY sub_category;


UPDATE orders o
JOIN subcat_aggregates s ON o.sub_category = s.sub_category
SET
    o.sales_2022 = s.sales_2022,
    o.sales_2023 = s.sales_2023,
    o.growth = s.growth;
