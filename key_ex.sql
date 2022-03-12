\i ~/environment/sql_basics/key_dump.sql

INSERT INTO films(title, year, genre, director, duration) VALUES ('Godzilla', 1998, 'scifi', 'Roland Emmerich', 139);
INSERT INTO films(title, year, genre, director, duration) VALUES ('Godzilla', 2014, 'scifi', 'Gareth Edwards', 123);

ALTER TABLE films
ADD COLUMN id serial PRIMARY KEY;

\d films

-- INSERT INTO films VALUES ('true love', 1997, 'spy', 'John Luke', 60, 5);

-- ALTER TABLE films
-- ADD COLUMN id_2 serial PRIMARY KEY;

ALTER TABLE films
DROP CONSTRAINT films_pkey;