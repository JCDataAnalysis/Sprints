-- Exercici 2

SELECT person_name, person_country, person_dob 
FROM movies.tb_person
WHERE person_dod IS NULL
ORDER BY person_dob;

-- Exercici 3

SELECT G.genre_name, COUNT(*) movie_count
FROM movies.tb_genre G
JOIN movies.tb_movie M ON G.genre_id = M.movie_genre_id
GROUP BY G.genre_name
ORDER BY COUNT(*) DESC;

-- Exercici 4

SELECT P.person_name, MAX(role_count) max_roles
FROM movies.tb_person P
JOIN (
	SELECT M.movie_id, MP.person_id, COUNT(DISTINCT(MP.role_id)) role_count
    FROM movies.tb_movie_person MP
    JOIN movies.tb_movie M ON MP.movie_id = M.movie_id 
    GROUP BY M.movie_id, MP.person_id
    HAVING role_count > 1
    ) Sub
ON P.person_id = Sub.person_id
GROUP BY P.person_name
HAVING max_roles > 1
ORDER BY max_roles DESC;

-- Exercise 5 

INSERT INTO movies.tb_genre (genre_id, genre_name) VALUES (69, 'Documental');

SELECT *
FROM movies.tb_genre;

-- Exercisi 6

SELECT movie_id
FROM movies.tb_movie
WHERE movie_title = 'La Gran Familia Española';

DELETE FROM movies.tb_movie_person
WHERE movie_id = 11;

DELETE FROM movies.tb_movie
WHERE movie_id = 11;

SELECT *
FROM movies.tb_movie;

-- Exercici 7 

SELECT genre_name, genre_id 
FROM movies.tb_genre
WHERE genre_name IN('Comedia', 'Romance');

UPDATE movies.tb_movie
SET movie_genre_id = 3
WHERE movie_title = 'Ocho apellidos catalanes';

SELECT *
FROM movies.tb_movie;