-- DROP TABLE IF EXISTS planets, moons, systems;

-- CREATE TABLE systems (
-- id serial PRIMARY KEY,
-- name varchar(50)
-- );

-- CREATE TABLE planets (
-- id serial PRIMARY KEY,
-- name varchar(50),
-- len_to_sun decimal(6, 2),
-- system_id integer,
-- FOREIGN KEY (system_id) REFERENCES systems(id)
-- );

-- ALTER TABLE planets
-- ADD COLUMN habitable boolean DEFAULT false;

-- ALTER TABLE planets
-- ADD CONSTRAINT optional_constraint_name
-- CHECK (length(name) > 0);

-- CREATE TABLE moons(
-- id serial PRIMARY KEY);

-- ALTER TABLE planets
-- ADD COLUMN population integer;

-- ALTER TABLE planets
-- ALTER COLUMN population
-- SET DEFAULT 0;

-- ALTER TABLE planets
-- ADD COLUMN diameter decimal(4,2);

-- INSERT INTO planets (name, len_to_sun)
-- VALUES ('Mercury', 0.39),
--       ('Venus', 0.72),
--       ('Earth', 1),
--       ('Mars', 1.5);

-- INSERT INTO planets (name, len_to_sun)
-- VALUES ('Jupiter', 5.2), ('saturn', 9.54), ('Uranus', 19.2), ('Neptune', 30.06);

-- UPDATE planets
-- SET len_to_sun = 1.52
-- WHERE name = 'Mars';

-- UPDATE planets
-- SET name = 'Saturn'
-- WHERE name = 'saturn';

-- UPDATE planets
-- SET habitable = true
-- WHERE name = 'Earth';

-- ALTER TABLE planets
-- ALTER COLUMN diameter
-- TYPE decimal(5, 2);  

-- ALTER TABLE planets
-- DROP COLUMN diameter;

-- ALTER TABLE planets
-- ADD CHECK (length(name) > 0);

-- ALTER TABLE planets
-- DROP CONSTRAINT planets_name_check;

-- ALTER TABLE planets
-- ALTER COLUMN name
-- SET NOT NULL;

-- ALTER TABLE planets
-- ALTER COLUMN name
-- DROP NOT NULL;

-- ALTER TABLE planets
-- ADD UNIQUE (name);

-- ALTER TABLE planets
-- DROP CONSTRAINT planets_name_key;

-- ALTER TABLE planets
-- DROP CONSTRAINT planets_pkey;

-- ALTER TABLE planets
-- DROP COLUMN population;

-- SELECT * FROM planets
-- ORDER BY len_to_sun, name;

-- ALTER TABLE planets
-- ALTER COLUMN population
-- DROP DEFAULT;

-- -- ALTER TABLE planets
-- -- DROP CONSTRAINT optional_constraint_name;



-- \d planets

DROP TABLE IF EXISTS menu_items;


CREATE TABLE menu_items (
    item text,
    prep_time integer,
    ingredient_cost numeric(4,2),
    sales integer,
    menu_price numeric(4,2)
);

INSERT INTO menu_items VALUES ('omelette', 10, 1.50, 182, 7.99);
INSERT INTO menu_items VALUES ('tacos', 5, 2.00, 254, 8.99);
INSERT INTO menu_items VALUES ('oatmeal', 1, 0.50, 79, 5.99);

SELECT item, (menu_price - ingredient_cost) AS profit
FROM menu_items
ORDER BY profit DESC
LIMIT 1;

SELECT item, menu_price, ingredient_cost,
        round(prep_time/60.0*13, 2) AS labor,
        round(menu_price - (prep_time/60.0*13) - ingredient_cost, 2) AS profit
FROM menu_items
ORDER BY profit DESC;