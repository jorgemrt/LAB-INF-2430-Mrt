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
LIMIT 1 ;
-- lesson 2602 leven 4 basic select 
SELECT name
FROM customers
WHERE state = 'RS';
-- lesson 2605 leven 4 executive representatives 
SELECT 
    p.name AS name,
    pr.name AS name
FROM 
    products p
JOIN 
    providers pr ON p.id_providers = pr.id
WHERE 
    p.id_categories = 6;
-- lesson 2611 leven 4 astion movies 
SELECT 
    m.id,
    m.name
FROM 
    movies m
JOIN 
    genres g ON m.id_genres = g.id
WHERE 
    g.description = 'Action';
-- lesson 2623 leven 4 categories with various products
SELECT 
    p.name AS name,
    c.name AS name
FROM 
    products p
JOIN 
    categories c ON p.id_categories = c.id
WHERE 
    p.amount > 100
    AND p.id_categories IN (1, 2, 3, 6, 9)
ORDER BY 
    p.id_categories ASC;
-- lesson 2625 leven 4 CPF validation 
SELECT
  SUBSTRING(cpf FROM 1 FOR 3) || '.' ||
  SUBSTRING(cpf FROM 4 FOR 3) || '.' ||
  SUBSTRING(cpf FROM 7 FOR 3) || '-' ||
  SUBSTRING(cpf FROM 10 FOR 2) AS cpf
FROM natural_person;
-- lesson 2738 leven 4 contest
SELECT
    c.name,
    ROUND((s.math * 2 + s.specific * 3 + s.project_plan * 5) / 10.0, 2) AS avg
FROM
    candidate c
JOIN
    score s ON c.id = s.candidate_id
ORDER BY
    avg DESC;
-- lesson 2988 leven 4 cearense championship
SELECT 
    t.name,
    COUNT(*) AS matches,
    SUM(CASE 
            WHEN (t.id = m.team_1 AND m.team_1_goals > m.team_2_goals) 
              OR (t.id = m.team_2 AND m.team_2_goals > m.team_1_goals)
            THEN 1 ELSE 0 
        END) AS victories,
    SUM(CASE 
            WHEN (t.id = m.team_1 AND m.team_1_goals < m.team_2_goals) 
              OR (t.id = m.team_2 AND m.team_2_goals < m.team_1_goals)
            THEN 1 ELSE 0 
        END) AS defeats,
    SUM(CASE 
            WHEN m.team_1_goals = m.team_2_goals THEN 1 ELSE 0 
        END) AS draws,
    SUM(CASE 
            WHEN (t.id = m.team_1 AND m.team_1_goals > m.team_2_goals) 
              OR (t.id = m.team_2 AND m.team_2_goals > m.team_1_goals)
            THEN 3
            WHEN m.team_1_goals = m.team_2_goals THEN 1
            ELSE 0 
        END) AS score
FROM 
    teams t
JOIN 
    matches m ON t.id = m.team_1 OR t.id = m.team_2
GROUP BY 
    t.name
ORDER BY 
    score DESC;
-- lesson 2990 leven 4 employees CPF
SELECT 
    e.cpf,
    e.enome,
    d.dnome
FROM 
    empregados e
JOIN 
    departamentos d ON e.dnumero = d.dnumero
WHERE 
    e.cpf NOT IN (
        SELECT cpf_emp FROM trabalha
    )
ORDER BY 
    e.cpf;
-- lesson 2614 leven 5 september rentals
SELECT 
    c.name, 
    r.rentals_date
FROM 
    rentals r
JOIN 
    customers c ON r.id_customers = c.id
WHERE 
    EXTRACT(MONTH FROM r.rentals_date) = 9
    AND EXTRACT(YEAR FROM r.rentals_date) = 2016;
-- lesson 2616 leven 5 No rental
SELECT 
    c.id, 
    c.name
FROM 
    customers c
WHERE 
    c.id NOT IN (
        SELECT id_customers FROM locations
    )
ORDER BY 
    c.id;
-- lesson 2740 leven 5 league 
SELECT 'Podium: ' || team AS name
FROM league
WHERE position BETWEEN 1 AND 3

UNION ALL

SELECT 'Demoted: ' || team AS name
FROM league
WHERE position >= 14;
-- lesson 2741 leven 5 students grades
SELECT 
    'Approved: ' || name AS name, 
    grade
FROM 
    students
WHERE 
    grade >= 7
ORDER BY 
    grade DESC;
-- lesson 2742 leven 5 Richard's Multiverse
SELECT 
    lr.name, 
    ROUND(lr.omega * 1.618, 3) AS "The N Factor"
FROM 
    life_registry lr
JOIN 
    dimensions d ON lr.dimensions_id = d.id
WHERE 
    lr.name LIKE 'Richard%' 
    AND d.name IN ('C875', 'C774')
ORDER BY 
    lr.omega;
-- lesson 2995 leven 5 The Sensor Message
SELECT 
    temperature, 
    COUNT(*) AS number_of_records
FROM 
    records
GROUP BY 
    mark, temperature
ORDER BY 
    MIN(id);
-- lesson 2996 leven 5 Package Delivery
SELECT 
  p.year,
  us.name AS sender,
  ur.name AS receiver
FROM 
  packages p
JOIN users us ON p.id_user_sender = us.id
JOIN users ur ON p.id_user_receiver = ur.id
WHERE
  (p.color = 'blue' OR p.year = 2015)
  AND (us.address != 'Taiwan' OR ur.address != 'Taiwan')
ORDER BY 
  p.year DESC;
-- lesson 2999 leven 5 Highest Division Salary
WITH net_salaries AS (
  SELECT
    e.matr,
    e.nome,
    e.lotacao_div,
    COALESCE(SUM(CASE WHEN v.tipo IN ('V','G') THEN v.valor ELSE 0 END), 0)
    - COALESCE((SELECT SUM(d.valor)
                FROM emp_desc ed
                JOIN desconto d ON ed.cod_desc = d.cod_desc
                WHERE ed.matr = e.matr AND d.tipo = 'V'), 0) AS net_salary
  FROM empregado e
  LEFT JOIN emp_venc ev ON e.matr = ev.matr
  LEFT JOIN vencimento v ON ev.cod_venc = v.cod_venc
  WHERE e.lotacao_div IS NOT NULL
  GROUP BY e.matr, e.nome, e.lotacao_div
),
avg_div_salary AS (
  SELECT
    lotacao_div,
    AVG(net_salary) AS avg_salary
  FROM net_salaries
  GROUP BY lotacao_div
)
SELECT
  n.nome,
  ROUND(n.net_salary, 2) AS salario
FROM net_salaries n
JOIN avg_div_salary a ON n.lotacao_div = a.lotacao_div
WHERE n.net_salary > a.avg_salary
ORDER BY n.net_salary DESC;
-- lesson 2609 leven 6 Products by Category
SELECT
  c.name,
  SUM(p.amount) AS sum
FROM
  categories c
JOIN
  products p ON c.id = p.id_categories
GROUP BY
  c.name
ORDER BY
  c.name;
-- lesson 2737 leven 6 Lawyers
SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MAX(customers_number) FROM lawyers)
UNION ALL
SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MIN(customers_number) FROM lawyers)
UNION ALL
SELECT 'Average' AS name, CAST(ROUND(AVG(customers_number)) AS INTEGER) AS customers_number
FROM lawyers;
-- lesson 2739 leven 6 Payday 
SELECT 
  name,
  DAY(payday) AS day
FROM loan
ORDER BY id;
-- lesson 2998 leven 6 The Payback
WITH cumulative_profits AS (
  SELECT
    c.id,
    c.name,
    c.investment,
    o.month,
    SUM(o.profit) OVER (PARTITION BY c.id ORDER BY o.month) AS accumulated_profit
  FROM clients c
  JOIN operations o ON c.id = o.client_id
),
payback AS (
  SELECT
    id,
    name,
    investment,
    month AS month_of_payback,
    accumulated_profit - investment AS return_value,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY month) AS rn
  FROM cumulative_profits
  WHERE accumulated_profit >= investment
)
SELECT
  name,
  investment,
  month_of_payback,
  return_value AS "return"
FROM payback
WHERE rn = 1
ORDER BY return_value DESC;
-- lesson 3001 leven 6 Update sem where
SELECT
  name,
  CASE
    WHEN type = 'A' THEN 20.0
    WHEN type = 'B' THEN 70.0
    WHEN type = 'C' THEN 530.5
  END AS price
FROM products
ORDER BY
  CASE type
    WHEN 'A' THEN 1
    WHEN 'B' THEN 2
    WHEN 'C' THEN 3
  END,
  id DESC;
-- lesson 2989 leven 7 Departments  and Divisions
SELECT 
    dpto.nome AS departamento,
    div.nome AS divisao,
    ROUND(COALESCE(AVG(v.valor), 0), 2) AS media,
    ROUND(COALESCE(MAX(v.valor), 0), 2) AS maior
FROM divisao div
JOIN departamento dpto ON div.cod_dep = dpto.cod_dep
JOIN empregado e ON e.lotacao_div = div.cod_divisao
JOIN emp_venc ev ON ev.matr = e.matr
JOIN vencimento v ON v.cod_venc = ev.cod_venc
GROUP BY dpto.nome, div.nome
ORDER BY media DESC;
-- lesson 2992 leven 7 highest avarage salary division
SELECT 
    dep.nome AS departamento,
    div.nome AS divisao,
    ROUND(AVG(COALESCE(v.valor, 0)), 2) AS media
FROM empregado e
JOIN emp_venc ev ON e.matr = ev.matr
JOIN vencimento v ON ev.cod_venc = v.cod_venc
JOIN divisao div ON e.lotacao_div = div.cod_divisao
JOIN departamento dep ON div.cod_dep = dep.cod_dep
GROUP BY dep.cod_dep, dep.nome, div.cod_divisao, div.nome
HAVING media = (
    SELECT MAX(sub.media) FROM (
        SELECT 
            ROUND(AVG(COALESCE(v2.valor, 0)), 2) AS media
        FROM empregado e2
        JOIN emp_venc ev2 ON e2.matr = ev2.matr
        JOIN vencimento v2 ON ev2.cod_venc = v2.cod_venc
        JOIN divisao div2 ON e2.lotacao_div = div2.cod_divisao
        WHERE div2.cod_dep = dep.cod_dep
        GROUP BY div2.cod_divisao
    ) AS sub
)
ORDER BY media DESC;
-- lesson 2991 leven 9 Departments statistics
SELECT
  d.nome AS `Nome Departamento`,
  COUNT(DISTINCT e.matr) AS `Numero de Empregados`,
  ROUND(COALESCE(AVG(v.valor), 0), 2) AS `Media Salarial`,
  COALESCE(MAX(v.valor), 0) AS `Maior Salario`,
  COALESCE(MIN(v.valor), 0) AS `Menor Salario`
FROM departamento d
LEFT JOIN divisao di ON di.cod_dep = d.cod_dep
LEFT JOIN empregado e ON e.lotacao_div = di.cod_divisao
LEFT JOIN emp_venc ev ON ev.matr = e.matr
LEFT JOIN vencimento v ON v.cod_venc = ev.cod_venc
GROUP BY d.cod_dep, d.nome
ORDER BY `Media Salarial`;
-- lesson 2997 leven 9 Employees payment
SELECT 
  d.nome AS Departamento,
  di.nome AS Divisao,
  e.nome AS Empregado,
  ROUND(COALESCE(SUM(v.valor), 0), 2) AS `Salario Bruto`,
  ROUND(COALESCE(SUM(ds.valor), 0), 2) AS `Total Desconto`,
  ROUND(COALESCE(SUM(v.valor), 0) - COALESCE(SUM(ds.valor), 0), 2) AS `Salario Liquido`
FROM empregado e
LEFT JOIN divisao di ON e.lotacao_div = di.cod_divisao
LEFT JOIN departamento d ON di.cod_dep = d.cod_dep
LEFT JOIN emp_venc ev ON e.matr = ev.matr
LEFT JOIN vencimento v ON ev.cod_venc = v.cod_venc
LEFT JOIN emp_desc ed ON e.matr = ed.matr
LEFT JOIN desconto ds ON ed.cod_desc = ds.cod_desc
GROUP BY d.nome, di.nome, e.nome, e.matr
ORDER BY d.nome, di.nome, `Salario Liquido` DESC;