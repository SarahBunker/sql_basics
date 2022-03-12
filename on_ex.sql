-- DROP TABLE directors_films;

-- CREATE TABLE directors_films  (
--   id serial PRIMARY KEY,
--   film_id integer NOT NULL REFERENCES films(id),
--   director_id integer NOT NULL REFERENCES directors(id)
-- );

-- INSERT INTO directors_films (film_id, director_id)
-- VALUES (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,3), (8,7), (9,8), (10,4);

-- ALTER TABLE films
-- DROP COLUMN director_id;

-- SELECT f.title, d.name
-- FROM films AS f
-- JOIN directors_films AS df
--   ON f.id = df.film_id
-- JOIN directors AS d
--   ON d.id = df.director_id
-- ORDER BY title;

-- INSERT INTO films (title, year, genre, duration)
-- VALUES ('Fargo', 1996, 'comedy', 98),
--       ('No Country for Old Men', 2007, 'western', 122),
--       ('Sin City', 2005, 'crime', 124),
--       ('Spy Kids', 2001, 'scifi', 88);

-- INSERT INTO directors (name)
-- VALUES ('Joel Coen'), ('Ethan Coen'), ('Frank Miller'), ('Robert Rodriguez');

-- INSERT INTO directors_films (film_id, director_id)
-- VALUES (11,9), (12,9), (12,10), (13, 11), (13, 12), (14, 12);

SELECT d.name AS director, count(df.film_id) AS films
FROM directors AS d
JOIN directors_films AS df
  ON d.id = df.director_id
GROUP BY director
ORDER BY films DESC, director;

-- SELECT * FROM films;
-- SELECT * FROM directors;
-- SELECT * FROM directors_films;

\d films
\d directors
\d directors_films 

