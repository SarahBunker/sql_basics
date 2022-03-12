-- CREATE TABLE devices (
--   id serial PRIMARY KEY,
--   name text NOT NULL,
--   created_at timestamp DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE parts (
--   id serial PRIMARY KEY,
--   part_number integer UNIQUE NOT NULL,
--   device_id integer REFERENCES devices(id)
-- );

\d devices

\d parts

-- INSERT INTO devices (name) VALUES ('Accelerometer'), ('Gyroscope');

-- INSERT INTO parts (part_number, device_id) 
--   VALUES (1456, 1), (1457, 1), (1458, 1),
--   (1323, 2), (1324, 2), (1325, 2), (1326, 2), (1327, 2);

-- INSERT INTO parts (part_number) VALUES (500), (501), (502);

-- SELECT devices.name, parts.part_number FROM devices
--   INNER JOIN parts
--     ON devices.id = parts.device_id;

-- SELECT * FROM parts
-- WHERE part_number::text LIKE '%6';

-- SELECT devices.name, count(parts.id)
--   FROM devices
--   LEFT JOIN parts
--     ON devices.id = parts.device_id
--   GROUP BY devices.name
--   ORDER BY devices.name DESC;

-- SELECT part_number, device_id
--   FROM parts
--   WHERE device_id IS NOT NULL;

-- SELECT part_number, device_id
--   FROM parts
--   WHERE device_id IS NULL;
  
-- INSERT INTO devices (name) VALUES ('Magnetometer');
-- INSERT INTO parts (part_number, device_id) VALUES (1001, 3);

-- SELECT * FROM devices
--   ORDER BY created_at ASC
--   LIMIT 1;

-- SELECT * FROM parts;

-- SELECT * FROM devices;

-- UPDATE parts
--   SET device_id = 1
--   WHERE id = 15 OR id = 16;
  
-- UPDATE parts
--   SET device_id = 2
--   WHERE part_number = 
--     (SELECT min(part_number)
--       FROM parts);

-- SELECT * FROM parts;

DELETE FROM parts
  WHERE device_id = 1;
  
DELETE FROM devices
  WHERE id = 1;