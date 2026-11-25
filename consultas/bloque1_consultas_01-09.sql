USE steam;

-- 01. Lista todas las columnas de la tabla.
SELECT *
FROM juegos;

-- 02. Lista todos los diferentes géneros, eliminando duplicados.
SELECT DISTINCT Genre
FROM juegos
ORDER BY Genre;

-- 03. Lista únicamente aquellos juegos que puedan ser jugados únicamente en Linux.
SELECT Nombre, PlatformLinux, PlatformWindows, PlatformMac
FROM juegos
WHERE PlatformLinux = 'True'
  AND PlatformWindows = 'False'
  AND PlatformMac = 'False';

-- 04. Lista todos los juegos de rol, ordenados por nota.
SELECT Nombre, Genre, Metacritic
FROM juegos
WHERE Genre LIKE '%RPG%'
ORDER BY Metacritic DESC;

-- 05. Lista todos aquellos juegos que puedan ser jugados en español pero no en francés.
SELECT Nombre, SupportedLanguages
FROM juegos
WHERE SupportedLanguages LIKE '%Spanish%'
  AND SupportedLanguages NOT LIKE '%French%';

-- 06. Lista el nombre del juego, su precio inicial, su precio final y la diferencia entre ambos en una nueva columna.
SELECT Nombre, PriceInitial, PriceFinal,
       ROUND(PriceInitial - PriceFinal, 2) AS Diferencia
FROM juegos;

-- 07. ¿Cuántos juegos hay del siglo pasado?
-- ReleaseDate es texto con el año ('1998'). Se quitan los años vacíos ('').
SELECT COUNT(*) AS JuegosSigloPasado
FROM juegos
WHERE ReleaseDate <= '2000'
  AND ReleaseDate <> '';

-- 08. Devuelve todos los juegos que terminen en N o en O.
SELECT Nombre
FROM juegos
WHERE Nombre LIKE '%n'
   OR Nombre LIKE '%o';

-- 09. Devuelve todos los juegos que empiecen por A y que se puedan jugar con mando.
SELECT Nombre, ControllerSupport
FROM juegos
WHERE Nombre LIKE 'A%'
  AND ControllerSupport = 'True';

