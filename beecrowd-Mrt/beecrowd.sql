-- lesson 2603 leven 1 Customer Addres 
SELECT name, street
FROM customers
WHERE city = 'Porto Alegre';
-- lesson 2607 leven 1 Providers'city in Alphabetical Orden
SELECT DISTINCT city
FROM providers
ORDER BY city ASC;
-- lesson 2608 leven 1 Higher and Lower Price
SELECT 
    MAX(price) AS price,
    MIN(price) AS price
FROM products;
-- lesson 2615 leven 1 Expanding the Business
SELECT DISTINCT city
FROM customers
ORDER BY city;
-- lesson 2617 leven 1 Provider Ajax SA
SELECT p.name AS name, pr.name AS name
FROM products p
JOIN providers pr ON p.id_providers = pr.id
WHERE pr.name = 'Ajax SA';
-- lesson 2622 leven 1 Legal Person 
SELECT c.name
FROM customers c
JOIN legal_person lp ON c.id = lp.id_customers;
-- lesson 2744 leven 1 Paswords
SELECT id,password,
    MD5(password) AS MD5
FROM account;
-- lesson 2746 leven 1 viruses
SELECT 
    REPLACE(name, 'H1', 'X') AS name
FROM virus;
-- lesson 2604 leven 2 Under 10 or Greater Than 100
SELECT id, name
FROM products
WHERE price < 10 OR price > 100
ORDER BY id;
-- lesson 2613 leven 2 Cheap Movies 
SELECT m.id, m.name
FROM movies m
JOIN prices p ON m.id_prices = p.id
WHERE p.value < 2.00;
-- lesson 2619 leven 2 Super Luxury
SELECT 
    prod.name AS name,
    prov.name AS name,
    prod.price AS price
FROM 
    products prod
JOIN 
    providers prov ON prod.id_providers = prov.id
JOIN 
    categories cat ON prod.id_categories = cat.id
WHERE 
    prod.price > 1000
    AND cat.name = 'Super Luxury';
-- lesson 2994 leven 2 How much earn a Doctor?
SELECT 
    d.name AS name,
    ROUND(SUM(a.hours * 150 * (1 + ws.bonus/100)), 1) AS salary
FROM 
    doctors d
JOIN 
    attendances a ON d.id = a.id_doctor
JOIN 
    work_shifts ws ON a.id_work_shift = ws.id
GROUP BY 
    d.id, d.name
ORDER BY 
    salary DESC;
-- lesson 3480 leven 2 Adjacent Chairs
SELECT 
    c1.queue,c1.id AS let,c2.id AS rig
FROM 
    chairs c1
JOIN 
    chairs c2 ON c1.queue = c2.queue AND c1.id + 1 = c2.id
WHERE 
    c1.available = TRUE AND c2.available = TRUE
ORDER BY 
    c1.id;
-- lesson 3481 leven 2 Classifying a Tree
 WITH all_nodes AS (
    SELECT node_id FROM nodes
    UNION
    SELECT pointer FROM nodes WHERE pointer IS NOT NULL
)
SELECT n.node_id,
    CASE
        WHEN NOT EXISTS (SELECT 1 FROM nodes WHERE pointer = n.node_id) THEN 'ROOT'
        WHEN EXISTS (SELECT 1 FROM nodes WHERE node_id = n.node_id AND pointer IS NOT NULL) THEN 'INNER'
        ELSE 'LEAF'
    END AS type
FROM all_nodes n
WHERE n.node_id IS NOT NULL
ORDER BY n.node_id ;
-- lesson 3482 leven 2 Seguidores
SELECT 
    LEAST(u1.user_name, u2.user_name) AS u1_name,
    GREATEST(u1.user_name, u2.user_name) AS u2_name
FROM 
    followers f1
JOIN 
    followers f2 ON f1.user_id_fk = f2.following_user_id_fk
                AND f1.following_user_id_fk = f2.user_id_fk
JOIN 
    users u1 ON f1.user_id_fk = u1.user_id
JOIN 
    users u2 ON f1.following_user_id_fk = u2.user_id
WHERE 
    f1.user_id_fk < f2.user_id_fk
ORDER BY 
    u1.user_id;
-- lesson 3483 leven 2 econd Largest and Smallest
(
    SELECT city_name, population
    FROM cities
    ORDER BY population DESC
    LIMIT 1 OFFSET 1
)
UNION ALL
(
    SELECT city_name, population
    FROM cities
    ORDER BY population ASC
    LIMIT 1 OFFSET 1
);
-- lesson 2606 leven 3 Categories
SELECT p.id, p.name
FROM products p
JOIN categories c ON p.id_categories = c.id
WHERE c.name LIKE 'super%';
-- lesson 2610 leven 3 Average Value of Produscts
SELECT ROUND(AVG(price), 2) AS price
FROM products;
-- lesson 2618 leven 3 imported products
SELECT 
    p.name AS name,
    pr.name AS name,
    c.name AS name
FROM 
    products p
JOIN 
    providers pr ON p.id_providers = pr.id
JOIN 
    categories c ON p.id_categories = c.id
WHERE 
    pr.name = 'Sansul SA'
    AND c.name = 'Imported';
-- lesson 2620 leven 3 Orders in First Half
SELECT 
    c.name,
    o.id
FROM 
    customers c
JOIN 
    orders o ON c.id = o.id_customers
WHERE 
    o.orders_date BETWEEN '2016-01-01' AND '2016-06-30'
ORDER BY 
    o.id;
-- lesson 2621 leven 3 Amounts between 10 and 20
SELECT p.name
FROM products p
JOIN providers pr ON p.id_providers = pr.id
WHERE p.amount BETWEEN 10 AND 20
AND pr.name LIKE 'P%';
-- lesson 2624 leven 3 Number id of cities per customers
SELECT COUNT(DISTINCT city) AS count
FROM customers;
-- lesson 2743 leven 3 Number of characters
SELECT 
    name,
    LENGTH(name) AS length
FROM 
    people
ORDER BY 
    length DESC, name;
-- lesson 2745 leven 3 Taxes 
SELECT 
    name,
    ROUND(salary * 0.10, 2) AS tax
FROM 
    people
WHERE 
    salary > 3000
ORDER BY 
    name;
-- lesson 2993 leven 3 Most frequent 
SELECT amount AS most_frequent_value
FROM value_table
GROUP BY amount
ORDER BY COUNT(*) DESC
LIMIT 1 
-- lesson 2602 leven 4 basic select 
-- lesson 2605 leven 4 executive representatives 
-- lesson 2611 leven 4 astion movies 
-- lesson 2623 leven 4 categories with various products
-- lesson 2625 leven 4 CPF validation 
-- lesson 2738 leven 4 contest
-- lesson 2988 leven 4 cearense championship
-- lesson 2990 leven 4 employees CPF
-- lesson 2614 leven 5 september rentals
-- lesson 2616 leven 5 No rental
-- lesson 2740 leven 5 league 
-- lesson 2741 leven 5 students grades
-- lesson 2742 leven 5 Richard's Multiverse
-- lesson 2995 leven 5 The Sensor Message
-- lesson 2996 leven 5 Package Delivery
-- lesson 2999 leven 5 Highest Division Salary
-- lesson 2609 leven 6 Products by Category
-- lesson 2737 leven 6 Lawyers
-- lesson 2739 leven 6 Payday 
-- lesson 2998 leven 6 The Payback
-- lesson 3001 leven 6 Update sem where
-- lesson 2989 leven 7 Departments  and Divisions
-- lesson 2992 leven 7 highest avarage salary division
-- lesson 2991 leven 9 Departments statistics
-- lesson 2997 leven 9 Employees payment