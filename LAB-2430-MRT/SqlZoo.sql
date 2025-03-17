--Tutoriales: Aprende SQL paso a paso

--0 SELECCIONE CONCEPTOS BASICOS

    ----Ejercicio 1
    --Modificarlo para mostrar la población de Alemania  
    --CODIGO :
    SELECT population FROM world
     WHERE name ='Germany'
    ----Ejercicio 2
    --Mostrar el nombre y el población para 'Suecia', 'Noruega' y 'Dinamarca'. 
    --CODIGO :
    SELECT name, population FROM world
     WHERE name IN ('Sweden', 'Norway', 'denmark');
    ----Ejercicio 3
    --Modificarlo para mostrar el país y el área para países con un área entre 200,000 y 250,000.
    --CODIGO :
    SELECT name, area FROM world
     WHERE area BETWEEN 200000 AND 250000

--1 SELECCIONE NOMBRE

    ----Ejercicio 1
   --Encuentra el país que comienza con Y
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE 'Y%'
    ----Ejercicio 2
    --Encuentra los países que terminan con y
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE '%y'
    ----Ejercicio 3
    --Encuentra los países que contienen la carta x
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE '%x%'
    ----Ejercicio 4
    --Encuentra los países que terminan con tierra
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE '%land'
    ----Ejercicio 5
    --Encuentra los países que comienzan con C y terminar con ia
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE 'C%ia'
    ----Ejercicio 6
    --Encuentra el país que tiene oo en el nombre
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE '%oo%'
    ----Ejercicio 7
    --Bahamas tiene tres a ¿quién más?
    --Encuentra los países que tienen tres o más a en el nombre
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE '%a%a%a%'
    ----Ejercicio 8
    --Encuentra los países que tienen "t" como segundo personaje.
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE '_n%'
     ORDER BY name
    ----Ejercicio 9
    --Encuentra los países que tienen dos caracteres "o" separados por otros dos.
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE '_n%'
    ----Ejercicio 10
    --Encuentra los países que tienen exactamente cuatro caracteres.
    --CODIGO :
    SELECT name FROM world
     WHERE name LIKE '____'
    ----Ejercicio 11
    --Encuentra el país donde el nombre es la ciudad capital.
    --CODIGO :
    SELECT name FROM world
     WHERE name = capital 
    ----Ejercicio 12
    --Encuentra el país donde la capital es el país más "Ciudad".
    --CODIGO :
    SELECT name FROM world
     WHERE capital = CONCAT(name, ' City');
     ----Ejercicio 13
    --Encuentre la capital y el nombre donde la capital incluye el nombre del país
    --CODIGO :
    SELECT capital, name
     FROM world
     WHERE capital LIKE CONCAT('%', name, '%')
    ----Ejercicio 14
    --Encuentre la capital y el nombre donde la capital es una extensión del nombre del país.
    --CODIGO :
    SELECT capital ,name
     FROM world
     WHERE capital LIKE CONCAT(name, '_%')   
    ----Ejercicio 15
    --Mostrar el nombre y la extensión donde la capital es una extensión apropiada (no vacía) del nombre del país.
    --CODIGO :
    SELECT name, REPLACE(capital, name, '')
     FROM world
     WHERE capital LIKE CONCAT(name,'_%')

--2 SELECT del mundo

    ----Ejercicio 1
   -- mostrar el nombre, el continente y la población de todos los países.
    --CODIGO :
    SELECT name, continent, population FROM world
    ----Ejercicio 2
    --Mostrar el nombre de los países que tienen una población de al menos 200 millones. 200 millones es 200000000, hay ocho ceros.
    --CODIGO :
    SELECT name FROM world
    WHERE population >=200000000
    ----Ejercicio 3
    --Dar el name y el PIB per cápita para aquellos países con un population de al menos 200 millones.
    --CODIGO :
    SELECT name ,gdp/population 
     FROM world
     WHERE population >=200000000
    ----Ejercicio 4
    --Mostrar el name y population en millones para los países de la continent 'América del Sur'. Divida la población por 1000000 para obtener población en millones
    --CODIGO :
    SELECT name ,population/1000000
     FROM world
     WHERE continent= 'south america'
    ----Ejercicio 5
    --Mostrar el name y population para Francia, Alemania, Italia
    --CODIGO :
    SELECT name , population 
     FROM world 
     WHERE name IN('France','Germany','Italy')
    ----Ejercicio 6
    --Mostrar los países que tienen un name eso incluye la palabra 'Unidos'
    --CODIGO :
    SELECT name FROM world 
     WHERE name LIKE '%United%'
    ----Ejercicio 7
   --Mostrar los países que son grandes por área o grandes por población. Mostrar nombre, población y área.
    --CODIGO :
    SELECT name , population , area
     FROM world
     WHERE area >3000000 OR population > 250000000
    ----Ejercicio 8
    --Mostrar los países que son grandes por área (más de 3 millones) o grandes por población (más de 250 millones) pero no ambos. Mostrar nombre, población y área.
    --CODIGO :
    SELECT name ,population ,area
     FROM world
     WHERE (area>3000000 AND population<250000000)
     OR (area<3000000 AND population>250000000)
    ----Ejercicio 9
    --Para las Américas, muestra población en millones y PIB en miles de millones, tanto a 2 decimales
    --CODIGO :
    SELECT name ,ROUND (population/1000000,2),ROUND(gdp/1000000000,2)
     FROM world
     WHERE continent ='south america'
    ----Ejercicio 10
    --Mostrar PIB per cápita para los países de billones de dólares a la $1000 más cercana
    --CODIGO :
    SELECT name, ROUND(gdp/population,-3)
     FROM world
     WHERE gdp >=1000000000000 
    ----Ejercicio 11
    --Mostrar el nombre y el capital donde el nombre y el capital tienen el mismo número de caracteres.
    --CODIGO :
    SELECT name, capital
     FROM world
     WHERE LENGTH(name) = LENGTH(capital)
    ----Ejercicio 12
    --Mostrar el nombre y la capital donde coinciden las primeras letras de cada partida. No incluya países donde el nombre y la capital son la misma palabra.
    --CODIGO :
    SELECT name,  capital
     FROM world 
     WHERE LEFT(name ,1) =LEFT(capital,1) AND name !=capital
    ----Ejercicio 13
    --Encuentra el país que tiene todas las vocales y sin espacios en su nombre.
    --CODIGO :
    SELECT name
     FROM world
     WHERE name LIKE '%a%'
     AND name LIKE '%e%'
     AND name LIKE '%i%'
     AND name LIKE '%o%'
     AND name LIKE '%u%'
     AND name NOT LIKE '% %'

--3 SELECCIONE de Nobel

    ----Ejercicio 1
    --Enumere cada país nombre donde el población es más grande que la de 'Rusia'.
    --CODIGO :
    SELECT yr, subject, winner
     FROM nobel
     WHERE yr = 1950
    ----Ejercicio 2
    --Mostrar los países de Europa con un PIB per cápita mayor que 'Reino Unido'.
    --CODIGO :
    SELECT winner
     FROM nobel
     WHERE yr = 1962
     AND subject = 'literature'
    ----Ejercicio 3
    --Enumerar el nombre y continente de países de los continentes que contengan Argentina o Australia. Ordenar por nombre del país.
    --CODIGO :
    SELECT yr , subject
     FROM nobel
     WHERE winner ='Albert Einstein'
    ----Ejercicio 4
    --¿Qué país tiene una población que es más que Reino Unido pero menos que Alemania? Mostrar el nombre y la población
    --CODIGO :
    SELECT winner 
     FROM  nobel 
    WHERE subject ='peace'AND yr>=2000 
    ----Ejercicio 5
    --Mostrar el nombre y la población de cada país de Europa. Mostrar la población como porcentaje de la población de Alemania.
    --CODIGO :
    SELECT yr,subject ,winner
     FROM nobel
     WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989
    ----Ejercicio 6
    --¿Qué países tienen un PIB mayor que todos los países de Europa? [Da el nombre solo.] (Algunos países pueden tener valores de gdp NULL)
    --CODIGO :
    SELECT * FROM nobel
     WHERE winner IN ('Theodore Roosevelt', 'Jimmy Carter', 'Barack Obama')
    ----Ejercicio 7
    --Encuentra el país más grande (por área) en cada continente, muestra el continente, el nombre y el área:
    --CODIGO :
    SELECT winner
     FROM nobel
     WHERE winner LIKE'john%'
    ----Ejercicio 8
    --Enumere cada continente y el nombre del país que viene primero alfabéticamente.
    --CODIGO :
    SELECT yr ,subject ,winner
     FROM nobel
     WHERE (subject ='physics'AND yr=1980 ) OR
     (subject ='chemistry'AND yr = 1984)
    ----Ejercicio 9
    --Encuentra los continentes donde todos los países tienen una población <= 25000000. Luego encuentre los nombres de los países asociados con estos continentes. Mostrar nombre, continente y población.
    --CODIGO :
    SELECT yr ,subject,winner
     FROM nobel
     WHERE yr =1980 AND subject NOT IN('chemistry ','medicine')
    ----Ejercicio 10
    --Algunos países tienen poblaciones más de tres veces la de cada uno de sus vecinos (en el mismo continente). Dar a los países y continentes.
    --CODIGO :
    SELECT yr, subject,winner
     FROM nobel
      WHERE (subject ='medicine'AND yr <1910)
     OR (subject ='literature'AND yr >=2004)
    ----Ejercicio 11
    --Encuentra todos los detalles del premio ganado por PETER GRÜNBERG
    --CODIGO :
    SELECT yr ,subject,winner
     FROM nobel
     WHERE winner='PETER GRÜNBERG'
    ----Ejercicio 12
    --Encuentra todos los detalles del premio ganado por EUGENE O'NEILL
    --CODIGO :
    SELECT yr ,subject,winner
     FROM nobel
     WHERE winner='EUGENE O''NEILL'
    ----Ejercicio 13
    --Enumere los ganadores, el año y el tema donde comienza el ganador Señor. Muestre primero el más reciente, luego por orden de nombre.
    --CODIGO :
    SELECT winner, yr, subject
     FROM nobel
     WHERE winner LIKE 'Sir %'
     ORDER BY yr DESC, winner;
    ----Ejercicio 14
    --Muestre los ganadores y el tema de 1984 ordenados por el tema y el nombre del ganador; pero enumere la química y la física por último
    --CODIGO :
    SELECT winner, subject
     FROM nobel
     WHERE yr=1984
     ORDER BY CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 0 END, 
     subject, winner
     
--4 SELECCIONE dentro de SELECT

    ----Ejercicio 1
    --Enumere cada país nombre donde el población es más grande que la de 'Rusia'.
    --CODIGO :
    SELECT name FROM world
      WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
    ----Ejercicio 2
    --Mostrar los países de Europa con un PIB per cápita mayor que 'Reino Unido'.
    --CODIGO :
    SELECT name 
     FROM world
     WHERE continent = 'Europe'
     AND gdp/population > (SELECT gdp/population
                      FROM world
                      WHERE name = 'United Kingdom')
    ----Ejercicio 3
    --Enumerar el nombre y continente de países de los continentes que contengan Argentina o Australia. Ordenar por nombre del país.
    --CODIGO :
    SELECT name, continent
    FROM world
    WHERE continent IN (SELECT continent 
    FROM world 
    WHERE name IN ('Argentina', 'Australia'))
    ----Ejercicio 4
    --Qué país tiene una población que es más que Reino Unido pero menos que Alemania? Mostrar el nombre y la población.
    --CODIGO :
    FROM world
    WHERE population > (SELECT population 
        FROM world 
        WHERE name = 'Canada')
    AND population < (SELECT population 
        FROM world 
        WHERE name = 'Poland')
    ----Ejercicio 5
    --Mostrar el nombre y la población de cada país de Europa. Mostrar la población como porcentaje de la población de Alemania
    --CODIGO :
    SELECT name, 
       CONCAT(CAST(ROUND(population/(SELECT population
    FROM world 
    WHERE name = 'Germany')*100, 0) AS int), '%') AS percentage
    FROM world
    WHERE continent = 'Europe'
    ----Ejercicio 6
    --Qué países tienen un PIB mayor que todos los países de Europa? [Da el nombre solo.] (Algunos países pueden tener valores de gdp NULL)
    --CODIGO :
    SELECT name
    FROM world
    WHERE gdp > (SELECT MAX(gdp) 
    FROM world 
    WHERE continent = 'Europe')
    ----Ejercicio 7
    --Encuentra el país más grande (por área) en cada continente, muestra el continente, el nombre y el área:
    --CODIGO :
    SELECT continent, name, area
    FROM world
    WHERE area IN (SELECT MAX(area) 
    FROM world 
    GROUP BY continent)
    ----Ejercicio 8
    --Enumere cada continente y el nombre del país que viene primero alfabéticamente
    --CODIGO :
    SELECT continent, name
    FROM world
    WHERE name IN (SELECT MIN(name) 
    FROM world 
    GROUP BY continent)
    ----Ejercicio 9
    --Encuentra los continentes donde todos los países tienen una población <= 25000000. Luego encuentre los nombres de los países asociados con estos continentes. Mostrar nombre, continente y población.
    --CODIGO :
    SELECT name, continent, population
    FROM world AS x
    WHERE 25000000 >= ALL(SELECT population 
    FROM world AS y 
    WHERE x.continent = y.continent 
    AND population IS NOT NULL)
    ----Ejercicio 10
    --Algunos países tienen poblaciones más de tres veces la de cada uno de sus vecinos (en el mismo continente). Dar a los países y continentes.
    --CODIGO :
    SELECT name, continent 
    FROM world AS x 
    WHERE population > ALL(SELECT population*3 
    FROM world AS y 
    WHERE y.continent = x.continent 
    AND y.name <> x.name)
--5 SUMA y COUNT
    ----Ejercicio 1
    --Mostrar el total población del mundo.
    --CODIGO :
    SELECT SUM(population)
    FROM world
    ----Ejercicio 2
    --Enumere todos los continentes, solo una vez cada uno.
    --CODIGO :
    SELECT DISTINCT continent
    FROM world
    ----Ejercicio 3
    --Dar el PIB total de África
    --CODIGO :
    SELECT SUM(gdp)
    FROM world
    WHERE continent = 'Africa'
    ----Ejercicio 4
    --Cuántos países tienen un área de al menos 1000000
    --CODIGO :
    SELECT COUNT(name)
    FROM world
    WHERE area >= 1000000
    ----Ejercicio 5
    --Cuál es el total población de ('Estonia', 'Letonia', 'Lituania')
    --CODIGO :
    SELECT SUM(population)
    FROM world
    WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
    ----Ejercicio 6
    --Para cada uno continente mostrar el continente y número de países.
    --CODIGO :
    SELECT continent, COUNT(name)
    FROM world
    GROUP BY continent
    ----Ejercicio 7
    --Para cada uno continente mostrar el continente y número de países con poblaciones de al menos 10 millones.
    --CODIGO :
    SELECT continent, COUNT(name)
    FROM world
    WHERE population >= 10000000
    GROUP BY continent
    ----Ejercicio 8
    --Enumere los continentes que tener una población total de al menos 100 millones.
    --CODIGO :
    SELECT continent
    FROM world
    GROUP BY continent
    HAVING SUM(population) >= 100000000
--6 ÚNETE
    ----Ejercicio 1
    --Modificarlo para mostrar el matchid y jugador nombre de todos los goles marcados por Alemania. Para identificar a los jugadores alemanes, verifique: teamid = 'GER'
    --CODIGO :
    SELECT matchid, player
    FROM goal 
    WHERE teamid = 'GER'
    ----Ejercicio 2
    --Mostrar identificación, estadio, team1, team2 por solo el juego 1012
    --CODIGO :
    SELECT id, stadium, team1, team2
    FROM game
    WHERE id = '1012'
    ----Ejercicio 3
    --Mostrar identificación, estadio, team1, team2 por solo el juego 1012
    --CODIGO :
    SELECT player, teamid, stadium, mdate
    FROM game 
    JOIN goal ON game.id = goal.matchid
    WHERE teamid = 'GER'
    ----Ejercicio 4
    --CODIGO :
    SELECT team1, team2, player
    FROM game 
    JOIN goal ON game.id = goal.matchid
    WHERE player LIKE 'Mario%'
    --Muestre al equipo1, al equipo2 y al jugador por cada gol marcado por un jugador llamado Mario player LIKE 'Mario%'
    ----Ejercicio 5
    SELECT player, teamid, coach, gtime
    FROM goal 
    JOIN eteam ON goal.teamid = eteam.id
    WHERE gtime <= 10
    --Mostrar player, teamid, coach, gtime para todos los goles marcados en los primeros 10 minutos gtime<=10
    --CODIGO :
    SELECT team1, team2, player
    FROM game 
    JOIN goal ON game.id = goal.matchid
    WHERE player LIKE 'Mario%'
    ----Ejercicio 6
    --Enumere las fechas de los partidos y el nombre del equipo en el que 'Fernando Santos' fue el entrenador del equipo1.
    --CODIGO :
    SELECT mdate, teamname
    FROM game 
    JOIN eteam ON game.team1 = eteam.id
    WHERE coach = 'Fernando Santos'
    ----Ejercicio 7
    --Enumere al jugador por cada gol marcado en un juego donde el estadio fue 'National Stadium, Varsovia'
    --CODIGO :
    SELECT player
    FROM game 
    JOIN goal ON game.id = goal.matchid
    WHERE stadium = 'National Stadium, Warsaw'
    ----Ejercicio 8
    --En cambio, mostrar el nombre de todos los jugadores que marcaron un gol contra Alemania.
    --CODIGO :
    SELECT DISTINCT player
    FROM goal
    JOIN game ON goal.matchid = game.id
    WHERE teamid <> 'GER' AND (team1 = 'GER' OR team2 = 'GER')
    ----Ejercicio 9
    --Mostrar nombre del equipo y el número total de goles marcados.
    --CODIGO :
    SELECT teamname, COUNT(*)
    FROM goal
    JOIN eteam ON goal.teamid = eteam.id
    GROUP BY teamname
    ----Ejercicio 10
    --Muestre el estadio y el número de goles marcados en cada estadio.
    --CODIGO :
    SELECT stadium, COUNT(*)
    FROM game
    JOIN goal ON game.id = goal.matchid
    GROUP BY stadium
    ----Ejercicio 11
    --Para cada partido que involucre 'POL', muestre el matchid, la fecha y el número de goles marcados.
    --CODIGO :
    SELECT matchid, mdate, COUNT(*)
    FROM game
    JOIN goal ON game.id = goal.matchid
    WHERE team1 = 'POL' OR team2 = 'POL'
    GROUP BY matchid, mdate
    ----Ejercicio 12
    --Por cada partido donde 'GER' anotó, muestre matchid, fecha del partido y el número de goles marcados por 'GER'
    --CODIGO :
    SELECT matchid, mdate, COUNT(*)
    FROM game
    JOIN goal ON game.id = goal.matchid
    WHERE teamid = 'GER'
    GROUP BY matchid, mdate
    ----Ejercicio 13
    --Ordene su resultado por mdate, matchid, team1 y team2.
    --CODIGO :
    SELECT mdate, team1, SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1, 
       team2, SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
    FROM game
    LEFT JOIN goal ON game.id = goal.matchid
    GROUP BY mdate, matchid, team1, team2
-- 7 Más operaciones JOIN
    ----Ejercicio 1
    --Enumere las películas donde el año es 1962
    --CODIGO :
    SELECT id, title
    FROM movie
    WHERE yr = '1962'
    ----Ejercicio 2
    --Dar año de 'Ciudadano Kane'.
    --CODIGO :
    SELECT yr
    FROM movie
    WHERE title = 'Citizen Kane'
    ----Ejercicio 3
    --Enumere todas las películas de Star Trek, incluya el id, título y año 
    --CODIGO :
    SELECT id, title, yr
    FROM movie
    WHERE title LIKE '%Star Trek%'
    ORDER BY yr
    ----Ejercicio 4
    --Que id ¿número tiene el actor 'Glenn Close'?
    --CODIGO :
    SELECT id
    FROM actor
    WHERE name = 'Glenn Close'
    ----Ejercicio 5
    --Qué es el id de la película 'Casablanca'
    --CODIGO :
    SELECT id
    FROM movie
    WHERE title = 'Casablanca'
    ----Ejercicio 6
    --Obtenga la lista de reparto para 'Casablanca'
    --CODIGO :
    SELECT name
    FROM actor
    JOIN casting ON actor.id = casting.actorid
    WHERE movieid = (SELECT id 
    FROM movie 
    WHERE title = 'Casablanca')
    ----Ejercicio 7
    --Obtenga la lista de reparto para la película 'Alien'
    --CODIGO :
    SELECT name
    FROM movie, actor, casting
    WHERE title = 'Alien'
    AND actor.id = casting.actorid
    AND casting.movieid = movie.id
    ----Ejercicio  8
    --Enumere las películas en las que ha aparecido 'Harrison Ford'
    --CODIGO :
    SELECT title
    FROM movie, actor, casting
    WHERE name = 'Harrison Ford'
    AND actor.id = casting.actorid
    AND casting.movieid = movie.id
    ----Ejercicio 9
    --Enumere las películas donde 'Harrison Ford' ha aparecido, pero no en el papel protagonista.
    --CODIGO :
    SELECT title
    FROM movie, actor, casting
    WHERE name = 'Harrison Ford'
    AND actor.id = casting.actorid
    AND casting.movieid = movie.id
    AND ord <> '1'
    ----Ejercicio 10
    --Enumere las películas junto con la estrella principal de todas las películas de 1962.
    --CODIGO :
    SELECT title, name
    FROM movie, actor, casting
    WHERE yr = '1962'
    AND actor.id = casting.actorid
    AND casting.movieid = movie.id
    AND ord = 1
    ----Ejercicio 11   
    --Cuáles fueron los años más ocupados para 'Rock Hudson', mostrar el año y el número de películas que hizo cada año para cualquier año en el que hizo más de 2 películas.
    --CODIGO :
    SELECT yr, COUNT(title)
    FROM movie
    JOIN actor ON movie.id = actor.id
    JOIN casting ON movie.id = casting.movieid
    WHERE name = 'Rock Hudson'
    GROUP BY yr
    HAVING COUNT(title) > 2
    ----Ejercicio 12
    --Enumere el título de la película y el actor principal de todas las películas en las que interpretó 'Julie Andrews'
    --CODIGO :
    SELECT title, name
    FROM movie, actor, casting
    WHERE movie.id IN (SELECT movie.id
    FROM movie, actor, casting 
    WHERE name = 'Julie Andrews'
    AND casting.movieid = movie.id)
    AND actor.id = casting.actorid
    AND casting.movieid = movie.id
    AND ord = 1
    ----Ejercicio 13
    --Obtenga una lista, en orden alfabético, de actores que hayan tenido al menos 15 protagonizar roles.
    --CODIGO :
    SELECT name
    FROM actor
    JOIN casting ON actor.id = casting.actorid
    WHERE ord = 1
    GROUP BY name
    HAVING COUNT(name) >= 15
    ----Ejercicio 14
    --Enumere las películas estrenadas en el año 1978 ordenadas por el número de actores en el elenco, luego por título.
    --CODIGO :
    SELECT title, COUNT(actorid)
    FROM movie, casting
    WHERE yr = '1978'
    AND casting.movieid = movie.id
    GROUP BY title
    ORDER BY 2 DESC, 1
    ----Ejercicio 15
    --Enumere a todas las personas que han trabajado con 'Art Garfunkel'.
    --CODIGO :
    SELECT DISTINCT name
    FROM actor, casting
    WHERE actor.id = casting.actorid
    AND name <> 'Art Garfunkel'
    AND movieid IN (SELECT movieid
    FROM actor, casting
    WHERE name = 'Art Garfunkel'
    AND actor.id = casting.actorid)
-- 8 Usando Null
    ----Ejercicio 1
    --Enumere los maestros que tienen NULL para su departamento
    --CODIGO :
    SELECT name
    FROM teacher
    WHERE dept IS NULL
    ----Ejercicio 2
    --Tenga en cuenta que INNER JOIN pierde a los maestros sin departamento y los departamentos sin maestro.
    --CODIGO :
    ELECT teacher.name, dept.name
    FROM teacher 
    INNER JOIN dept ON (teacher.dept = dept.id)
    ----Ejercicio 3
    --Use un JOIN diferente para que todos los maestros estén en la lista.
    --CODIGO :
    ELECT teacher.name, dept.name
    FROM teacher 
    LEFT JOIN dept ON (teacher.dept = dept.id)
    ----Ejercicio 4
    --Use un JOIN diferente para que todos los departamentos estén listados
    --CODIGO :
    SELECT teacher.name, dept.name
    FROM teacher 
    RIGHT JOIN dept ON (teacher.dept = dept.id)
    ----Ejercicio 5
    --Mostrar nombre del profesor y número de móvil o '07986 444 2266'
    --CODIGO :
    SELECT name, COALESCE(mobile, '07986 444 2266')
    FROM teacher
    ----Ejercicio 6
    --Utilice la función COALESCE y un LEFT JOIN para imprimir el profesor nombre y nombre del departamento
    --CODIGO :
    SELECT teacher.name, COALESCE(dept.name, 'None')
    FROM teacher
    LEFT JOIN dept ON teacher.dept = dept.id
    ----Ejercicio 7
    --Use COUNT para mostrar el número de maestros y el número de teléfonos móviles
    --CODIGO :
    SELECT COUNT(name), COUNT(mobile)
    FROM teacher
    ----Ejercicio 8
    --Use COUNT y GROUP BY dept.nombre para mostrar cada departamento y el número de persona
    --CODIGO :
    SELECT dept.name, COUNT(teacher.name)
    FROM teacher
    RIGHT JOIN dept ON teacher.dept = dept.id
    GROUP BY dept.name
    ----Ejercicio 9
    --Utilice CASE para mostrar el nombre de cada maestro seguido de 'Sci' si el maestro está en depósito 1 ó 2 y 'Arte' de otra manera.
    --CODIGO :
    SELECT name, (CASE WHEN dept IN ('1', '2') THEN 'Sci' ELSE 'Art' END)
    FROM teacher
    ----Ejercicio 10
    --Use CASE para mostrar el nombre de cada maestro seguido de 'Sci' si el maestro está en el departamento 1 o 2, muestre 'Arte' si el departamento del maestro es 3 y 'Ninguno' de otra manera
    --CODIGO :
    SELECT name, CASE WHEN dept IN (1,2) 
    THEN 'Sci'
    WHEN dept = 3 
    THEN 'Art'
    ELSE 'None' END
    FROM teacher

--9  Window function 
    ----Ejercicio 1
    --Mostrar el últimoNombre, fiesta y votos para el circunscripción 'S14000024' en 2017.
    --CODIGO :
    SELECT lastName, party, votes
    FROM ge
    WHERE constituency = 'S14000024'
    AND yr = '2017'
    ORDER BY votes DESC
    ----Ejercicio 2
    --Mostrar el partido y RANK para la circunscripción S14000024 en 2017. Enumere la salida por parte
    --CODIGO :
    SELECT party, votes, RANK() OVER(ORDER BY votes DESC)
    FROM ge
    WHERE constituency = 'S14000024'
    AND yr = '2017'
    ORDER BY party
    ----Ejercicio 3
    --a elección de 2015 es una PARTICIÓN diferente a la elección de 2017. Solo nos importa el orden de los votos de cada año.
    --CODIGO :
    SELECT yr, party, votes, RANK() OVER(PARTITION BY yr ORDER BY votes DESC)
    FROM ge
    WHERE constituency = 'S14000021'
    ORDER BY party, yr, votes
    ----Ejercicio 4
    --Las circunscripciones de Edimburgo están numeradas S14000021 a S14000026.
    --CODIGO :
    SELECT constituency, party, votes, RANK() OVER(PARTITION BY constituency ORDER BY votes DESC)
    FROM ge
    WHERE yr = '2017'
    AND constituency BETWEEN 'S14000021' AND 'S14000026'
    ORDER BY 4, 1
    ----Ejercicio 5
    --Mostrar los partidos que ganaron para cada circunscripción de Edimburgo en 2017.
    --CODIGO :
    SELECT constituency, party
    FROM (SELECT constituency, party, 
      RANK() OVER(PARTITION BY constituency ORDER BY votes DESC) AS rank 
      FROM ge WHERE yr = '2017' 
      AND constituency BETWEEN 'S14000021' AND 'S14000026') AS ge_rank
    WHERE rank = '1'
    ----Ejercicio 6
    --Mostrar cuántos asientos para cada fiesta en Escocia en 2017
    --CODIGO :
    SELECT party, COUNT(*)
    FROM (SELECT party, RANK() OVER(PARTITION BY constituency ORDER BY votes DESC) AS rank 
      FROM ge 
      WHERE yr = '2017' 
      AND constituency LIKE 'S%') AS ge_rank
    WHERE rank = '1'
    GROUP BY party

-- 9 Self join
    ----Ejercicio 1
    --Cuántos paradas están en la base de datos.
    --CODIGO :
    SELECT DISTINCT COUNT(*) FROM stops
    ----Ejercicio 2
    --Encuentra el id valor para la parada 'Craiglockhart'
    --CODIGO :
    SELECT id FROM stops
  WHERE name = 'Craiglockhart'
    ----Ejercicio 3
    --Dar el id y el nombre para el paradas en el servicio '4' 'LRT'.
    --CODIGO :
    SELECT id, name FROM stops JOIN route ON (stops.id = route.stop)
  WHERE num = 4
    ----Ejercicio 4
    --La consulta que se muestra indica el número de rutas que visitan London Road (149) o Craiglockhart (53). Ejecute la consulta y observe los dos servicios que enlazan estos paradas tener un recuento de 2. Agregue una cláusula HAVING para restringir la salida a estas dos rutas.
    --CODIGO :
    SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2
    ----Ejercicio 5
    --Ejecute la autounión que se muestra y observe que b.stop ofrece todos los lugares a los que puede llegar desde Craiglockhart, sin cambiar de ruta. 
    --CODIGO :
    SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = (SELECT id FROM stops WHERE name = 'London Road')
    ----Ejercicio 6
    --La consulta que se muestra es similar a la anterior, sin embargo, al unir dos copias de la paradas tabla a la que podemos referirnos paradas por nombre en lugar de por número. Cambie la consulta para que se muestren los servicios entre 'Craiglockhart' y 'London Road'. Si estás cansado de estos lugares, prueba 'Fairmilehead' contra 'Tollcross'
    --CODIGO :
    SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'
    ----Ejercicio 7
    --Dar una lista de todos los servicios que conectan las paradas 115 y 137 ('Haymarket' y 'Leith')
    --CODIGO :
    SELECT a.company, a.num  
FROM route a, route b
WHERE a.num = b.num AND (a.stop = 115 AND b.stop = 137)
GROUP BY num
    ----Ejercicio 8
    --Dar una lista de los servicios que conectan el paradas 'Craiglockhart' y 'Tollcross'
    --CODIGO :
    SELECT a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart'
AND stopb.name = 'Tollcross'
    ----Ejercicio 9
    --Dar una lista distinta de la paradas a la que se puede llegar desde 'Craiglockhart' tomando un autobús, incluido 'Craiglockhart', ofrecido por la compañía LRT. Incluya la empresa y el número de autobús de los servicios relevantes.
    --CODIGO :
    SELECT DISTINCT name, a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops ON a.stop = stops.id
WHERE b.stop = 53
    ----Ejercicio 10
    --Encuentre las rutas que involucran dos autobuses que pueden ir desde Craiglockhart a Lochend.
    --Muestre el no de autobús y la compañía para el primer autobús, el nombre de la parada para el traslado, y
    --y el autobús no. y compañía para el segundo autobús.  
    --CODIGO :
    SELECT a.num, a.company, stopb.name, c.num, c.company
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN (route c JOIN route d ON (c.company = d.company AND c.num = d.num))
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
JOIN stops stopc ON c.stop = stopc.id
JOIN stops stopd ON d.stop = stopd.id
WHERE stopa.name = 'Craiglockhart'
	AND stopd.name = 'Sighthill'
	AND stopb.name = stopc.name
ORDER BY LENGTH(a.num), b.num, stopb.name, LENGTH(c.num), d.num


