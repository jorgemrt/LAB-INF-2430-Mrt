--Basic SQL
--Leecson 101 TUTORIAL INTRO
-- 1. SQL Select Practice Exercise
SELECT * FROM products;
--Leeson 102 SQL SELECT
-- 1. SQL WHERE Practice Exercise   
SELECT user_id, stars
FROM reviews
WHERE stars = 3;
--Leeeson 103 SQL WHERE
-- 1. SQL WHERE Practice Exercise
SELECT user_id, stars
FROM reviews
WHERE stars = 3;
--leeson 104 SQL AND, OR, NOT
-- 1. SQL WHERE AND Practice Exercise
SELECT * FROM reviews
WHERE stars >= 4 
AND review_id < 6000
AND review_id > 2000
AND user_id != 142;
-- 2. SQL WHERE AND OR Practice Exercise
SELECT * FROM reviews
WHERE stars > 2
AND stars <= 4
AND (user_id = 123 OR user_id = 265 OR user_id = 362)
--leeson 105 SQL BETWEEN
-- 1. SQL BETWEEN Practice Exercise 
SELECT manufacturer, drug, units_sold
FROM pharmacy_sales
WHERE (manufacturer = 'Biogen' OR manufacturer = 'AbbVie' OR manufacturer = 'Eli Lilly')
AND units_sold BETWEEN 100000 AND 105000;
-- leeson 106 SQL IN
-- 1. SQL IN Practice Exercise
SELECT manufacturer, drug, units_sold FROM pharmacy_sales
WHERE manufacturer IN ('Roche', 'Bayer', 'AstraZeneca')
AND units_sold NOT BETWEEN 55000 AND 550000;
-- lesson 107 SQL LIKE
-- 1. SQL LIKE % Practice Exercise
SELECT *
FROM customers
WHERE customer_name LIKE 'F%ck';
-- 2. SQL LIKE _ Practice Exercise
SELECT *
FROM customers
WHERE customer_name LIKE '_ee%';
-- leeson 108 filtering review
-- 1. SQL Filtering Practice Exercise #1
SELECT *
FROM customers
WHERE age BETWEEN 18 AND 22
  AND state IN ('Victoria', 'Tasmania', 'Queensland')
  AND gender != 'n/a'
  AND (customer_name LIKE 'A%' OR customer_name LIKE 'B%'); 
--INTERMEDIATE SQL
-- leeson 202 SUN ,AVG, COUNT
-- 1.SQL COUNT Practice Exercise
SELECT COUNT(*) FROM pharmacy_sales;
-- 2. SQL SUM Practice Exercise
SELECT COUNT(*), SUM(total_sales)
FROM pharmacy_sales
WHERE manufacturer = 'Pfizer'
-- 3. SQL AVG Practice Exercise
SELECT AVG(open)
FROM stock_prices
WHERE ticker='GOOG';
-- 4. SQL MIN Practice Exercise: Microsoft Stock
SELECT MIN(open)
FROM stock_prices
WHERE ticker='MSFT';
--5. SQL MAX Practice Exercise: Tesla Stock
SELECT MAX(open)
FROM stock_prices
WHERE ticker='NFLX';
-- leeson 203 SQL GROUP BY
-- 1.Easy SQL GROUP BY Practice Exercise
SELECT ticker, MIN(open)
FROM stock_prices
GROUP BY ticker
ORDER BY min DESC;
-- 2. SQL GROUP BY Practice Exercise: Candidate Skills
SELECT skill, COUNT(candidate_id) FROM candidates
GROUP BY skill
ORDER BY count DESC;
-- leeson 204 SQL HAVING
-- 1. SQL HAVING MIN  Practice Exercise
SELECT ticker, MIN(open)
FROM stock_prices
GROUP BY ticker
HAVING MIN(open) > 100;
--2. SQL HAVING Practice Exercise
SELECT candidate_id FROM candidates
GROUP BY candidate_id
HAVING COUNT(candidate_id) > 2;
-- leeson 205 SQL distinct
-- 1. SQL COUNT DISTINCT Practice Exercise
SELECT category, COUNT(DISTINCT product)
FROM product_spend
GROUP BY category;
-- leeson 206 SQL arithmetic
-- 1. Pharmacy Analytics (Part 1)
SELECT
  drug,
  total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;
-- 2. Cards Issued Difference
SELECT 
  card_name, 
  MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;
-- 3. SQL Math Practice Exercise: Big-Mover Months
SELECT ticker, COUNT(ticker)
FROM stock_prices
WHERE (close - open)/open > 0.10 OR (close - open)/open < -0.10
GROUP BY ticker
ORDER BY count DESC;
-- leeson 207  SQL Math Functions
-- 1. SQL CEIL Practice Exercise
SELECT drug, CEIL(total_sales / units_sold) AS unit_cost
FROM pharmacy_sales
WHERE manufacturer = 'Merck'
ORDER BY unit_cost;
-- leeson 208 SQL DIVISION 
-- 1. SQL DIVISION Practice Exercise
-- pregunta bloqueada por subcripcion --
-- leeson 209 SQL NULL
-- 1. Unfinished Parts
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
-- leeson 210 SQL CASE 
-- 1. SQL Tutorial Lesson: Superheroes' Likes
SELECT
  actor,
  character,
  platform,
  avg_likes,
  CASE 
    WHEN avg_likes >= 15000 THEN 'Super Likes'
    WHEN avg_likes BETWEEN 5000 AND 14999 THEN 'Good Likes'
    ELSE 'Low Likes'
  END AS likes_category
FROM marvel_avengers
ORDER BY avg_likes DESC;
-- 2. Laptop vs. Mobile Viewership
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;
-- leeson 211 SQL JOIN
-- 1. Easy SQL JOIN Practice Exercise
SELECT *
FROM trades
INNER JOIN users
  ON trades.user_id = users.user_id;
  -- 2. Cities With Completed Trades
  SELECT 
  users.city, 
  COUNT(trades.order_id) AS total_orders 
FROM trades 
INNER JOIN users 
  ON trades.user_id = users.user_id 
WHERE trades.status = 'Completed' 
GROUP BY users.city 
ORDER BY total_orders DESC
LIMIT 3;
-- 3. Page With No Likes
SELECT p.page_id 
FROM p LEFT JOIN page_likes 
ON p.page_id=page_likes.page_id
where page_likes.page_id is NULL;
-- leeson 212 SQL Date Functions
-- 1. Average Post Hiatus (Part 1)
SELECT 
	user_id, 
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(post_id)>1;
-- 2. Second Day Confirmation
SELECT DISTINCT user_id
FROM emails 
INNER JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.action_date = emails.signup_date + INTERVAL '1 day'
  AND texts.signup_action = 'Confirmed';
  -- 3. Average Post Hiatus (Part 1)
  SELECT 
	user_id, 
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(post_id)>1;
-- Advanced SQL
-- leeson 302 SQL CTE vs. SUBQUERY
-- 1. SQL Tutorial Lesson: Top-Selling Artists
WITH max_rev_per_genre AS(
SELECT genre, MAX(concert_revenue/number_of_members) AS revenue_per_member
FROM concerts
GROUP BY genre
)
SELECT artist_name, concert_revenue,
      genre, number_of_members,
      (concert_revenue/number_of_members) AS revenue_per_member
FROM concerts
WHERE concert_revenue/number_of_members IN (
SELECT revenue_per_member FROM max_rev_per_genre
WHERE concerts.genre=max_rev_per_genre.genre
)
ORDER BY revenue_per_member DESC, genre
-- 2. Supercloud Customer
WITH supercloud_cust AS (
  SELECT 
    customers.customer_id, 
    COUNT(DISTINCT products.product_category) AS product_count
  FROM customer_contracts AS customers
  INNER JOIN products 
    ON customers.product_id = products.product_id
  GROUP BY customers.customer_id
)

SELECT customer_id
FROM supercloud_cust
WHERE product_count = (
  SELECT COUNT(DISTINCT product_category) FROM products
);
-- 3. Swapped Food Delivery
WITH order_counts AS (
  SELECT COUNT(order_id) AS total_orders 
  FROM orders
)

SELECT
  CASE
    WHEN order_id % 2 != 0 AND order_id != total_orders THEN order_id + 1
    WHEN order_id % 2 != 0 AND order_id = total_orders THEN order_id
    ELSE order_id - 1
  END AS corrected_order_id,
  item
FROM orders
CROSS JOIN order_counts
ORDER BY corrected_order_id;
-- leeson 303 SQL Window Functions
-- 1. SQL Card Launch Success
WITH card_launch AS (
  SELECT 
    card_name,
    issued_amount,
    MAKE_DATE(issue_year, issue_month, 1) AS issue_date,
    MIN(MAKE_DATE(issue_year, issue_month, 1)) OVER (
      PARTITION BY card_name) AS launch_date
  FROM monthly_cards_issued
)
SELECT 
  card_name, 
  issued_amount
FROM card_launch
WHERE issue_date = launch_date
ORDER BY issued_amount DESC;
-- leeson 304 SQL Ranking
-- 1. SQL Top 5 Artists
WITH top_10_cte AS (
  SELECT 
    artists.artist_name,
    DENSE_RANK() OVER (
      ORDER BY COUNT(songs.song_id) DESC) AS artist_rank
  FROM artists
  INNER JOIN songs
    ON artists.artist_id = songs.artist_id
  INNER JOIN global_song_rank AS ranking
    ON songs.song_id = ranking.song_id
  WHERE ranking.rank <= 10
  GROUP BY artists.artist_name
)

SELECT artist_name, artist_rank
FROM top_10_cte
WHERE artist_rank <= 5;
-- 2. Histogram of Users and Purchases
WITH latest_transactions_cte AS (
  SELECT 
    transaction_date, 
    user_id, 
    product_id, 
    RANK() OVER (
      PARTITION BY user_id 
      ORDER BY transaction_date DESC) AS transaction_rank 
  FROM user_transactions) 
  
SELECT 
  transaction_date, 
  user_id,
  COUNT(product_id) AS purchase_count
FROM latest_transactions_cte
WHERE transaction_rank = 1 
GROUP BY transaction_date, user_id
ORDER BY transaction_date;
-- 3. Odd and Even Measurements
WITH ranked_measurements AS (
  SELECT 
    CAST(measurement_time AS DATE) AS measurement_day, 
    measurement_value, 
    ROW_NUMBER() OVER (
      PARTITION BY CAST(measurement_time AS DATE) 
      ORDER BY measurement_time) AS measurement_num 
  FROM measurements
) 

SELECT 
  measurement_day, 
  SUM(measurement_value) FILTER (WHERE measurement_num % 2 != 0) AS odd_sum, 
  SUM(measurement_value) FILTER (WHERE measurement_num % 2 = 0) AS even_sum 
FROM ranked_measurements
GROUP BY measurement_day;
-- leeson 305 SQL  LEAD & LAG
-- 1. SQL Tutorial Lesson: Stock Performance
WITH per_month AS 
(SELECT DISTINCT DATE_TRUNC('month', date) as date,
MIN(open) OVER(PARTITION BY DATE_TRUNC('month', date) 
ORDER BY EXTRACT('day' FROM date)) AS open_month,
MAX(close) OVER(PARTITION BY DATE_TRUNC('month', date) 
ORDER BY EXTRACT('day' FROM date)) AS close_month
from stock_prices
ORDER BY date ),
 logs AS (SELECT *,
LAG(close_month,1) OVER(ORDER BY date ) AS prev_close,
LAG(close_month,3) OVER(ORDER BY date ) AS m3_close
FROM per_month) 
SELECT date,close_month-prev_close as consec_month,
close_month-m3_close as months3_prior
FROM logs
-- 2. SQL Y-on-Y Growth Rate
WITH yearly_spend_cte AS (
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    spend AS curr_year_spend,
    LAG(spend) OVER (
      PARTITION BY product_id 
      ORDER BY 
        product_id, 
        EXTRACT(YEAR FROM transaction_date)) AS prev_year_spend 
  FROM user_transactions
)

SELECT 
  year,
  product_id, 
  curr_year_spend, 
  prev_year_spend, 
  ROUND(100 * 
    (curr_year_spend - prev_year_spend)
    / prev_year_spend
  , 2) AS yoy_rate 
FROM yearly_spend_cte;
-- 3. SQL Y-on-Y Growth Rate
WITH yearly_spend_cte AS (
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    spend AS curr_year_spend,
    LAG(spend) OVER (
      PARTITION BY product_id 
      ORDER BY 
        product_id, 
        EXTRACT(YEAR FROM transaction_date)) AS prev_year_spend 
  FROM user_transactions
)

SELECT 
  year,
  product_id, 
  curr_year_spend, 
  prev_year_spend, 
  ROUND(100 * 
    (curr_year_spend - prev_year_spend)
    / prev_year_spend
  , 2) AS yoy_rate 
FROM yearly_spend_cte;
-- leeson 307  SQL UNION
-- 1. Maximize Prime Item Inventory
WITH summary AS (
  SELECT 
    SUM(square_footage) FILTER (WHERE item_type = 'prime_eligible') AS prime_sq_ft,
    COUNT(item_id) FILTER (WHERE item_type = 'prime_eligible') AS prime_item_count,
    SUM(square_footage) FILTER (WHERE item_type = 'not_prime') AS not_prime_sq_ft,
    COUNT(item_id) FILTER (WHERE item_type = 'not_prime') AS not_prime_item_count
  FROM inventory
),
prime_occupied_area AS (
  SELECT FLOOR(500000/prime_sq_ft)*prime_sq_ft AS max_prime_area
  FROM summary
)

SELECT 
  'prime_eligible' AS item_type,
  FLOOR(500000/prime_sq_ft)*prime_item_count AS item_count
FROM summary

UNION ALL

SELECT 
  'not_prime' AS item_type,
  FLOOR((500000-(SELECT max_prime_area FROM prime_occupied_area)) 
    / not_prime_sq_ft) * not_prime_item_count AS item_count
FROM summary;
-- 2. Page With No Likes
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
ORDER BY p.page_id ASC;
-- leeson 311 SQL STRING Functions
-- 1. SQL LOWER Practice Exercise
SELECT *
FROM customers
WHERE LOWER(customer_name) LIKE '%son'
  AND gender = 'Male'
  AND age = 20;
-- 2. Pharmacy Analytics (Part 3)
WITH drug_sales AS (
  SELECT 
    manufacturer, 
    SUM(total_sales) as sales 
  FROM pharmacy_sales 
  GROUP BY manufacturer
) 

SELECT 
  manufacturer, 
  ('$' || ROUND(sales / 1000000) || ' million') AS sales_mil 
FROM drug_sales 
ORDER BY sales DESC, manufacturer;
-- leeson 312 Instacart SQL Data Analytics Case Study
-- 1. Instacart Exploration – Case Study Checkpoint #1
SELECT prior.product_id, product_name, department, aisle
FROM ic_products prod
  JOIN ic_order_products_prior prior
    ON prod.product_id = prior.product_id
  JOIN ic_departments dept
    ON prod.department_id = dept.department_id
  JOIN ic_aisles aisle
    ON prod.aisle_id = aisle.aisle_id
GROUP BY 1,2,3,4
ORDER BY count(1) DESC
LIMIT 5;
-- 2. Instacart Reorders – Case Study Checkpoint #2
SELECT
      prod.product_id,
      prod.product_name,
      prod.aisle_id,
      prod.department_id,
      dept.department,
      aisles.aisle,
      SUM(op_prior.reordered) AS prior_reorders,
      SUM(op_curr.reordered) AS current_reorders
  FROM
      ic_products AS prod
  JOIN
      Ic_order_products_prior AS op_prior
      ON prod.product_id = op_prior.product_id
  JOIN
      ic_order_products_curr AS op_curr
      ON prod.product_id = op_curr.product_id
  JOIN
      ic_departments AS dept
      ON prod.department_id = dept.department_id
  JOIN
      ic_aisles AS aisles
      ON prod.aisle_id = aisles.aisle_id
  GROUP BY
      prod.product_id,
      prod.product_name,
      prod.aisle_id,
      prod.department_id,
      dept.department,
      aisles.aisle
  HAVING
      SUM(op_prior.reordered) < 10
      AND SUM(op_curr.reordered) >= 10
  ORDER BY
      current_reorders DESC;