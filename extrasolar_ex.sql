-- CREATE TABLE stars (
--   id serial PRIMARY KEY,
--   name varchar(25) UNIQUE NOT NULL,
--   distance integer NOT NULL CHECK (distance > 0),
--   spectral_type char(1),
--   companion integer NOT NULL CHECK (companion >= 0)
-- );

-- CREATE TABLE planets (
--   id serial PRIMARY KEY,
--   designation char(1) UNIQUE,
--   mass integer
-- );

-- ALTER TABLE planets
--   ADD COLUMN stars_id integer NOT NULL
--   REFERENCES stars(id);

-- ALTER TABLE stars
--   ALTER COLUMN name
--   TYPE varchar(50);

-- ALTER TABLE stars
--   RENAME COLUMN companion
--   TO companions;
  

-- ALTER TABLE stars
-- ALTER COLUMN name TYPE varchar(25);

-- INSERT INTO stars (name, distance, spectral_type, companions)
--           VALUES ('Alpha Centauri B', 4, 'K', 3);

-- ALTER TABLE stars
-- ALTER COLUMN name TYPE varchar(50);

-- ALTER TABLE stars
--   ALTER COLUMN distance TYPE numeric;

-- ALTER TABLE stars
-- ALTER COLUMN distance TYPE integer;

-- INSERT INTO stars (name, distance, spectral_type, companions)
--           VALUES ('Alpha Orionis', 643, 'M', 9);

-- ALTER TABLE stars
-- ALTER COLUMN distance TYPE numeric ;

-- ALTER TABLE stars
-- ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M'));

-- ALTER TABLE stars
-- ALTER COLUMN spectral_type SET NOT NULL;

-- DELETE FROM stars;

-- SELECT * FROM stars;

-- SELECT * FROM planets;

-- ALTER TABLE stars
-- DROP CONSTRAINT stars_spectral_type_check,
-- ALTER COLUMN spectral_type DROP NOT NULL;

-- ALTER TABLE stars
-- DROP CONSTRAINT stars_spectral_type_check1,
-- ALTER COLUMN spectral_type DROP NOT NULL;

-- INSERT INTO stars (name, distance, companions)
--           VALUES ('Epsilon Eridani', 10.5, 0);

-- INSERT INTO stars (name, distance, spectral_type, companions)
--           VALUES ('Lacaille 9352', 10.68, 'X', 0);
           
-- UPDATE stars
-- SET spectral_type = '?'
-- WHERE (spectral_type NOT IN ('O', 'B', 'A', 'F', 'G', 'K', 'M'))
-- OR spectral_type IS NULL;

-- ALTER TABLE stars
-- ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M', '?')),
-- ALTER COLUMN spectral_type SET NOT NULL;

-- ALTER TABLE stars
-- DROP CONSTRAINT stars_spectral_type_check;

-- CREATE TYPE spectral_type_enum as ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M', '?');

-- ALTER TABLE stars
-- ALTER COLUMN spectral_type
-- TYPE spectral_type_enum
-- USING spectral_type::spectral_type_enum;

-- ALTER TABLE planets
-- ALTER COLUMN mass
-- TYPE numeric,
-- ALTER COLUMN mass
-- SET NOT NULL,
-- ADD CHECK (mass > 0),
-- ALTER COLUMN designation
-- SET NOT NULL;

-- ALTER TABLE planets
-- ADD COLUMN semi_major_axis numeric NOT NULL;

-- SELECT * FROM planets;

-- ALTER TABLE planets
-- DROP COLUMN semi_major_axis;

-- ALTER TABLE planets
-- DROP COLUMN semi_major_axis;

-- DELETE FROM stars;
-- INSERT INTO stars (name, distance, spectral_type, companions)
--           VALUES ('Alpha Centauri B', 4.37, 'K', 3);
-- INSERT INTO stars (name, distance, spectral_type, companions)
--           VALUES ('Epsilon Eridani', 10.5, 'K', 0);

-- INSERT INTO planets (designation, mass, stars_id)
--           VALUES ('b', 0.0036, 29); -- check star_id; see note below
-- INSERT INTO planets (designation, mass, stars_id)
--           VALUES ('c', 0.1, 30); -- check star_id; see note below

-- ALTER TABLE planets
-- ADD COLUMN semi_major_axis numeric NOT NULL;

-- DELETE FROM planets;
-- ALTER SEQUENCE planets_id_seq RESTART WITH 1;
-- DELETE FROM stars;
-- ALTER SEQUENCE stars_id_seq RESTART WITH 1;

-- ALTER TABLE planets
-- ADD COLUMN semi_major_axis numeric NOT NULL;

-- INSERT INTO stars (name, distance, spectral_type, companions)
--           VALUES ('Alpha Centauri B', 4.37, 'K', 3);
-- INSERT INTO stars (name, distance, spectral_type, companions)
--           VALUES ('Epsilon Eridani', 10.5, 'K', 0);

-- INSERT INTO planets (designation, mass, stars_id, semi_major_axis)
--           VALUES ('b', 0.0036, 1, -14); -- check star_id; see note below
-- INSERT INTO planets (designation, mass, stars_id, semi_major_axis)
--           VALUES ('c', 0.1, 2, -14); -- check star_id; see note below

-- SELECT * FROM planets;

-- SELECT * FROM stars;

-- CREATE TABLE moons (
--   id serial PRIMARY KEY,
--   designation integer NOT NULL CHECK (designation > 0),
--   semi_major_axis numeric CHECK (semi_major_axis > 0.0),
--   mass numeric CHECK (mass > 0.0),
--   planet_id integer NOT NULL REFERENCES planets(id)
-- );