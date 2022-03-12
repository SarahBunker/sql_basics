-- \i ~/environment/sql_basics/films_3_5.sql

-- CREATE TABLE directors (
--   id serial PRIMARY KEY,
--   name text NOT NULL);

-- INSERT INTO directors (name) VALUES
--   ('John McTiernan'),
--   ('Michael Curtiz'),
--   ('Francis Ford Coppola'),
--   ('Michael Anderson'),
--   ('Tomas Alfredson'),
--   ('Mike Nichol');
  
-- SELECT * FROM directors;

-- ALTER TABLE films
--   ADD COLUMN director_id integer REFERENCES directors(id);

-- UPDATE films
--   SET director_id = 1 
--   WHERE director = 'John McTiernan';

-- UPDATE films
--   SET director_id = 2
--   WHERE director = 'Michael Curtiz';

-- UPDATE films
--   SET director_id = 3 
--   WHERE director = 'Francis Ford Coppola';

-- UPDATE films
--   SET director_id = 4 
--   WHERE director = 'Michael Anderson';

-- UPDATE films
--   SET director_id = 5
--   WHERE director = 'Tomas Alfredson';

-- UPDATE films
--   SET director_id = 6 
--   WHERE director = 'Mike Nichols';

-- ALTER TABLE films
--   ALTER COLUMN director_id
--   SET NOT NULL;

-- ALTER TABLE films
--   DROP COLUMN director;

-- ALTER TABLE directors
--   ADD CONSTRAINT valid_name
--   CHECK (length(name) >= 1 AND position(' ' in name) > 0);

\d films

\d directors

SELECT f.title, f.year, f.genre, d.name AS director, f.duration
  FROM films AS f
  INNER JOIN directors AS d
    ON f.director_id = d.id;

