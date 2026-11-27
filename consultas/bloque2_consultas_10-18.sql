USE steam;

-- 10. Devuelve todos aquellos juegos que estén entre el 2000 y el 2010.
SELECT Nombre, ReleaseDate
FROM juegos
WHERE ReleaseDate BETWEEN '2000' AND '2010';

-- 11. Devuelve todos los juegos que sean de la saga Final Fantasy.
SELECT Nombre
FROM juegos
WHERE Nombre LIKE '%Final Fantasy%';

-- 12. Devuelve todos los juegos que sean de deportes y en los que hayan trabajado más de 3 desarrolladores.
SELECT Nombre, Genre, DeveloperCount
FROM juegos
WHERE Genre LIKE '%sports%' AND DeveloperCount > 3;

-- 13. ¿Cuántos juegos hay asociados a cada categoría?
SELECT Category, COUNT(*) AS Juegos
FROM juegos
GROUP BY Category
ORDER BY Juegos DESC;

-- 14. ¿Cuántos juegos se han sacado en cada año?
SELECT ReleaseDate, COUNT(*) AS Juegos
FROM juegos
GROUP BY ReleaseDate
ORDER BY ReleaseDate;

-- 15. En base a la consulta anterior, devuelve aquellos años en los que la media de puntuación esté entre un 6 y un 8.
-- Notas sobre 100 (6 y 8 son 60 y 80). No cuento los juegos sin nota (0).
SELECT ReleaseDate, ROUND(AVG(Metacritic), 2) AS Media
FROM juegos
WHERE Metacritic > 0
GROUP BY ReleaseDate
HAVING AVG(Metacritic) BETWEEN 60 AND 80
ORDER BY ReleaseDate;

-- 16. ¿Cuál es la puntuación máxima, mínima y media por género?
SELECT Genre, MAX(Metacritic) AS Maxima, MIN(Metacritic) AS Minima, ROUND(AVG(Metacritic), 2) AS Media
FROM juegos
GROUP BY Genre;

-- 17. Usando LIMIT, devuelve el top 10 de juegos con mayor puntuación del 2012.
SELECT Nombre, Metacritic
FROM juegos
WHERE ReleaseDate = '2012'
ORDER BY Metacritic DESC
LIMIT 10;

-- 18. Usando LIMIT, devuelve el top 10 de juegos más nuevos de género single player.
-- Quito los años vacíos o mal escritos (2O17, 20XX...) para que no salgan los primeros.
SELECT Nombre, ReleaseDate
FROM juegos
WHERE Category LIKE '%Single Player%' AND ReleaseDate BETWEEN '1900' AND '2099'
ORDER BY ReleaseDate DESC
LIMIT 10;

