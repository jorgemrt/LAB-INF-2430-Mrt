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