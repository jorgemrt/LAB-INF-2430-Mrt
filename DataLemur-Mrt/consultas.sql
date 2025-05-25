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
