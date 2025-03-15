--Tutoriales: Aprende SQL paso a paso
---0 SELECCIONE CONCEPTOS BASICOS
    ----Ejercicio 1
    /*
    El ejemplo utiliza una cláusula WHERE para mostrar la población de 'Francia'.
    Tenga en cuenta que las cadenas deben estar en 'citas únicas';
    Modificarlo para mostrar la población de Alemania  
    */
    --CODIGO :
    SELECT population FROM world
    WHERE name ='Germany'
     ----Ejercicio 2
    /*
    Comprobando una lista La palabra EN nos permite comprobar si un elemento está en una lista. 
    El ejemplo muestra el nombre y la población de los países 'Brasil', 'Rusia', 'India' y 'China'.        
    Mostrar el nombre y el población para 'Suecia', 'Noruega' y 'Dinamarca'. 
    */ 
    --CODIGO :
    SELECT name, population FROM world
    WHERE name IN ('Sweden', 'Norway', 'denmark');
    ----Ejercicio 3
    /*
    ¿Qué países no son demasiado pequeños y no demasiado grandes? BETWEEN permite la comprobación del rango
    (el rango especificado incluye los valores límite). El siguiente ejemplo muestra países con un área de 250,000-300,000
    kilómetros cuadrados. Modificarlo para mostrar el país y el área para países con un área entre 200,000 y 250,000.
    */
    --CODIGO :
    SELECT name, area FROM world
    WHERE area BETWEEN 200000 AND 250000
---1 SELECCIONE NOMBRE
    ----Ejercicio 1
    /*
    Puedes usar WHERE name LIKE 'B%' para encontrar los países que comienzan con "B".
    El % es a comodín puede coincidir con cualquier personaje
    Encuentra el país que comienza con Y
    */
    --CODIGO :
    SELECT name FROM world
    WHERE name LIKE 'Y%'
    ----Ejercicio 2
    /*
    Encuentra los países que terminan con y
    */
    --CODIGO :
    SELECT name FROM world
    WHERE name LIKE '%y'
    ----Ejercicio 3
    /* 
    Luxemburgo tiene un x también lo hace otro país. Enumerar ambos.
    Encuentra los países que contienen la carta x
    */
    --CODIGO :
    SELECT name FROM world
    WHERE name LIKE '%x%'
    ----Ejercicio 4
    /*
    Islandia, Suiza termina con land ¿pero hay otros?
    Encuentra los países que terminan con land
    */
    --CODIGO :
    SELECT name FROM world
    WHERE name LIKE '%land'
    ----Ejercicio 5
    /*
    Columbia comienza con un C y termina con ia hay dos más como este.
    Encuentra los países que comienzan con C y terminar con ia 
    */
    --CODIGO :
    SELECT name FROM world
    WHERE name LIKE 'C%ia'
    ----Ejercicio 6
    /*
    Grecia tiene un doble e - que tiene un doble o¿?
    Encuentra el país que tiene oo en el nombre
    */
    --CODIGO :
    SELECT name FROM world
    WHERE name LIKE '%oo%'
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */ 
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
     ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */ 
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
     ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */ 
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :
    ----Ejercicio 1
    /* */
    --CODIGO :



