DROP TABLE IF EXISTS public.temperatures;

CREATE TABLE temperatures (
date date NOT NULL,
low integer NOT NULL,
high integer NOT NULL
);

INSERT INTO temperatures
VALUES
  ('2016-03-01', 34, 43),
  ('2016-03-02', 32, 44),
  ('2016-03-03', 31, 47),
  ('2016-03-04', 33, 42),
  ('2016-03-05', 39, 46),
  ('2016-03-06', 32, 43),
  ('2016-03-07', 29, 32),
  ('2016-03-08', 23, 31),
  ('2016-03-09', 17, 28);

SELECT date, round((high + low)/2.0 , 1) AS average
FROM temperatures
WHERE date_part('day', date) >= 2
AND date_part('day', date) <= 8;

ALTER TABLE temperatures
ADD COLUMN rainfall integer DEFAULT 0;

UPDATE temperatures
SET rainfall = (high + low)/2 - 35
WHERE ((high + low)/2)  > 35;

ALTER TABLE temperatures
ALTER COLUMN rainfall
TYPE decimal(6,3);

UPDATE temperatures
SET rainfall = rainfall * 0.039
WHERE ((high + low)/2)  > 35;

ALTER TABLE temperatures
RENAME TO weather;

SELECT * FROM weather;

