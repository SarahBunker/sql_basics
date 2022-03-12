\i ~/environment/sql_basics/mc_dump.sql


SELECT * FROM films;

ALTER TABLE films
ALTER COLUMN title
SET NOT NULL;

ALTER TABLE films
ALTER COLUMN year
SET NOT NULL;

ALTER TABLE films
ALTER COLUMN genre
SET NOT NULL;

ALTER TABLE films
ALTER COLUMN director
SET NOT NULL;

ALTER TABLE films
ALTER COLUMN duration
SET NOT NULL;

ALTER TABLE films
ADD CONSTRAINT title_unique
UNIQUE (title);

ALTER TABLE films
DROP CONSTRAINT title_unique;

ALTER TABLE films
ADD CHECK (length(title) > 0);

-- ALTER TABLE films
-- DROP CONSTRAINT films_title_check;

ALTER TABLE films
ADD CHECK (year BETWEEN 1900 AND 2100);

ALTER TABLE films
ADD CHECK (length(director) >= 3 AND director LIKE ('% %'));

-- ALTER TABLE films
-- ADD CHECK (position(' ' in director) > 0);

-- UPDATE films
-- SET director = 'Jonny'
-- WHERE title = 'Die Hard';



ALTER TABLE films
ALTER COLUMN title
SET DEFAULT '';

\d films

INSERT INTO films VALUES (DEFAULT, 1990, 'spy', 'Bruce Lee', 133);

SELECT * FROM films;