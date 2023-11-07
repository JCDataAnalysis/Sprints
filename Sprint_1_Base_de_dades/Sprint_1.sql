-- Exercici 2: Realitza la següent consulta sobre la base de dades acabada de crear: Has d'obtenir el nom, el país i la data de naixement d'aquelles persones per les quals no consti una data de mort i ordenar les dades de la persona més vella a la persona més jove.

SELECT person_name, person_country, person_dob 
FROM movies.tb_person
WHERE person_dod IS NULL
ORDER BY person_dob;

-- Exercici 3: Realitza la següent consulta sobre la base de dades acabada de crear: Has d'obtenir el nom del gènere i el nombre total de pel·lícules d'aquest gènere i ordenar-ho per ordre descendent de nombre total de pel·lícules.  

SELECT G.genre_name, COUNT(*) movie_count
FROM movies.tb_genre G
JOIN movies.tb_movie M ON G.genre_id = M.movie_genre_id
GROUP BY G.genre_name
ORDER BY movie_count DESC;

-- Exercici 4: Realitza la següent consulta sobre la base de dades acabada de crear: Has d'obtenir, per a cada persona, el seu nom i el nombre màxim de rols diferents que ha tingut en una mateixa pel·lícula. Posteriorment, mostra únicament aquelles persones que hagin assumit més d'un rol en una mateixa pel·lícula.

SELECT P.person_name, MAX(role_count) max_roles
FROM movies.tb_person P
JOIN (
	SELECT M.movie_id, MP.person_id, COUNT(DISTINCT(MP.role_id)) role_count
    FROM movies.tb_movie_person MP
    JOIN movies.tb_movie M ON MP.movie_id = M.movie_id 
    HAVING role_count > 1
    ) Sub
ON P.person_id = Sub.person_id
GROUP BY P.person_name
HAVING max_roles > 1
ORDER BY max_roles DESC;

-- Exercise 5: Realitza la següent operació sobre la base de dades acabada de crear: Has de crear un nou gènere anomenat "Documental" el qual tingui com a identificador el nombre 69.

INSERT INTO movies.tb_genre (genre_id, genre_name) VALUES (69, 'Documental');

SELECT *
FROM movies.tb_genre;

-- Exercisi 6: Fes la següent operació sobre la base de dades acabada de crear: Elimina la pel·lícula "La Gran Familia Española" de la base de dades.

SELECT movie_id
FROM movies.tb_movie
WHERE movie_title = 'La Gran Familia Española';

DELETE FROM movies.tb_movie_person
WHERE movie_id = 11;

DELETE FROM movies.tb_movie
WHERE movie_id = 11;

SELECT *
FROM movies.tb_movie;

-- Exercici 7: Realitza la següent operació sobre la base de dades acabada de crear: Canvia el gènere de la pel·lícula "Ocho apellidos catalanes" perquè consti com a comèdia i no com a romàntica.

SELECT genre_name, genre_id 
FROM movies.tb_genre
WHERE genre_name IN('Comedia', 'Romance');

UPDATE movies.tb_movie
SET movie_genre_id = 3
WHERE movie_title = 'Ocho apellidos catalanes';

SELECT *
FROM movies.tb_movie;
