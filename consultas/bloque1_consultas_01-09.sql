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
-- TODO

-- 05. Lista todos aquellos juegos que puedan ser jugados en español pero no en francés.
-- TODO

-- 06. Lista el nombre del juego, su precio inicial, su precio final y la diferencia entre ambos en una nueva columna.
-- TODO

-- 07. ¿Cuántos juegos hay del siglo pasado?
-- TODO

-- 08. Devuelve todos los juegos que terminen en N o en O.
-- TODO

-- 09. Devuelve todos los juegos que empiecen por A y que se puedan jugar con mando.
-- TODO

