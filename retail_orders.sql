#find top 5 highest revenue generating products

SELECT product_id, round(sum(sales_price),2) as revenue
FROM orders
GROUP BY 1 ORDER BY 2 DESC LIMIT 5 ;


#find top 10 highest revenue generating products in each region
with cte1 as (SELECT region, product_id, round(sum(sales_price),2) as revenue,
row_number()over(partition by region order by sum(sales_price) DESC) as rn
FROM orders
GROUP BY 1,2 ORDER BY 1,3 DESC )

SELECT *
FROM cte1
WHERE rn<=10 ;



#find month over month growth comparision for 2022 and 2023 

with cte1 as (SELECT year(order_date) as year, month(order_date) as month, round(sum(sales_price),2) as revenue
FROM orders
GROUP BY 1,2  ORDER BY 1,2),

cte2 as (
SELECT month, 
sum(case when year= 2022 then revenue else 0 end) as twenty_two,
sum(case when year= 2023 then revenue else 0 end) as twenty_three
FROM cte1
GROUP BY month)

SELECT month, twenty_two, 
round(100.00*(twenty_two- lag(twenty_two,1,twenty_two)over(order by month asc))/twenty_two,2)  as lag_2022_mom, 
twenty_three,
round(100.00* (twenty_three- lag(twenty_three,1,twenty_three)over(order by month asc))/twenty_three,2)  as lag_2023_mom

FROM cte2;



#For a given category, which month had the highest sales
with cte1 as (SELECT category, date_format(order_date, "%Y-%m") as month, round(sum(sales_price),2) as revenue
FROM orders
GROUP BY 1,2 ORDER BY 3 DESC)

SELECT category, month, revenue
FROM (
SELECT category, month,revenue,  dense_rank()over(partition by category, year(month) order by revenue DESC) as rank_check
FROM cte1) as base
WHERE rank_check = 1 ;





#Sub-category with highest sales growth 2022 v/s 2023
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
GROUP BY sub_category
ORDER BY growth DESC
LIMIT 1;


