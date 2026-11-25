USE steam;

-- 27. Devuelve la información de los juegos que sólo se puedan jugar en inglés.
--     Algunos juegos solo en inglés llevan la nota de audio pegada al idioma, por eso se aceptan las dos formas.
SELECT *
FROM juegos
WHERE TRIM(SupportedLanguages) IN ('English', 'English**languages with full audio support');

-- 28. Devuelve el nombre (en minúscula) y la web (en mayúscula) de los juegos de acción o casuales.
SELECT LOWER(Nombre) AS Nombre, UPPER(Website) AS Web
FROM juegos
WHERE Genre LIKE '%Action%'
   OR Genre LIKE '%Casual%';

-- 29. ¿Cuál es el juego indie con mayor nota?
SELECT Nombre, Genre, Metacritic
FROM juegos
WHERE Genre LIKE '%Indie%'
ORDER BY Metacritic DESC
LIMIT 1;

-- 30. ¿Y con menor nota?
--     Los juegos con Metacritic = 0 no tienen nota, así que no cuentan.
SELECT Nombre, Genre, Metacritic
FROM juegos
WHERE Genre LIKE '%Indie%'
  AND Metacritic > 0
ORDER BY Metacritic ASC
LIMIT 1;

-- 31. [Subconsulta] Devuelve toda la información del juego con menor nota, siempre que sea mayor a cero.
SELECT *
FROM juegos
WHERE Metacritic = (SELECT MIN(Metacritic)
                    FROM juegos
                    WHERE Metacritic > 0);

-- 32. [Subconsulta] Devuelve aquellos juegos que tengan mayor nota que la media.
--     La media se calcula solo con los juegos que tienen nota (Metacritic > 0).
SELECT Nombre, Metacritic
FROM juegos
WHERE Metacritic > (SELECT AVG(Metacritic)
                    FROM juegos
                    WHERE Metacritic > 0)
ORDER BY Metacritic DESC;

-- 33. [Subconsulta] Devuelve el juego con mayor nota del año 2008.
SELECT Nombre, ReleaseDate, Metacritic
FROM juegos
WHERE ReleaseDate = '2008'
  AND Metacritic = (SELECT MAX(Metacritic)
                    FROM juegos
                    WHERE ReleaseDate = '2008');

-- 34. [Subconsulta] Devuelve toda la información de los juegos que valgan más que la media.
SELECT *
FROM juegos
WHERE PriceFinal > (SELECT AVG(PriceFinal)
                    FROM juegos);

-- 35. [Subconsulta] Devuelve toda la información de los juegos de Linux que tengan el mayor número de logros.
SELECT *
FROM juegos
WHERE PlatformLinux = 'True'
  AND AchievementCount = (SELECT MAX(AchievementCount)
                          FROM juegos
                          WHERE PlatformLinux = 'True');

