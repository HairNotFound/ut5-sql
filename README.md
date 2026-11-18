# UT5 PR05 · Consultas SQL (Steam)

- `bd/juegos_steam_mysql.sql`: crea la base de datos `steam` y la tabla `juegos` en MySQL. Se importa una vez.
- `consultas/`: las 35 consultas del Anexo II, repartidas en 4 ficheros. Cada consulta va debajo de su comentario, en lugar del `-- TODO`.

## Cómo trabajar

1. Nunca se programa en `main` ni en `develop`.
2. Crea tu rama desde `develop`: `git switch develop`, `git pull` y `git switch -c feature/nombre-tarea`.
3. Commits pequeños con mensaje claro: `feat: calcular mediana`, `fix: error al leer número vacío`.
4. Sube tu rama (`git push -u origin feature/nombre-tarea`) y abre un pull request hacia `develop`.
5. El jefe revisa el PR y lo fusiona. Después mueve tu issue a DONE y ciérralo.

Al final de cada sprint, el jefe fusiona `develop` en `main` con un pull request.
