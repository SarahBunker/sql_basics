DROP TABLE customers_services;
DROP TABLE customers;
DROP TABLE services;

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) NOT NULL UNIQUE
    CHECK (payment_token ~ '^[A-Z]{8}$') 
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10,2) NOT NULL CHECK (price >= 0.00)
);

INSERT INTO customers (name, payment_token)
VALUES  ('Pat Johnson', 'XHGOAHEQ'),
        ('Nancy Monreal', 'JKWQPJKL'),
        ('Lynn Blake', 'KLZXWEEE'),
        ('Chen Ke-Hua', 'KWETYCVX'),
        ('Scott Lakso', 'UUEAPQPS'),
        ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
VALUES  ('Unix Hosting', 5.95),
        ('DNS', 4.95),
        ('Whois Registration', 1.95),
        ('High Bandwidth', 15.00),
        ('Business Support', 250.00),
        ('Dedicated Hosting', 50.00),
        ('Bulk Email', 250.00),
        ('One-to-one Training', 999.00);
        
CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id integer NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  service_id integer NOT NULL REFERENCES services(id),
  UNIQUE (customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id)
VALUES (1, 1), (1, 2), (1,3),
      (3,1), (3,2), (3,3), (3,4), (3,5),
      (4,1), (4,4),
      (5,1), (5,2), (5,6),
      (6,1), (6,6), (6,7);


-- SELECT * FROM customers;
-- SELECT * FROM services;
-- SELECT * FROM customers_services;

-- SELECT c.id, c.name, c.payment_token FROM customers AS c
-- JOIN customers_services AS cs ON c.id = cs.customer_id
-- GROUP BY c.id;

-- SELECT DISTINCT customers.* FROM customers
-- LEFT OUTER JOIN customers_services ON customers.id = customers_services.customer_id
-- WHERE customer_id IS NULL;

-- SELECT c.*, s.* FROM customers AS c
-- FULL JOIN customers_services AS cs ON cs.customer_id = c.id
-- FULL JOIN services AS s ON cs.service_id = s.id
-- WHERE c.id  IS NULL OR s.id IS NULL;

-- select s.description FROM customers_services AS cs
-- RIGHT OUTER JOIN services AS s
--   ON s.id = cs.service_id
-- WHERE cs.service_id IS NULL;

-- SELECT c.name, string_agg(s.description, ', ') AS services
-- FROM customers AS c
-- LEFT OUTER JOIN customers_services AS cs ON c.id = cs.customer_id
-- LEFT JOIN services AS s ON s.id = cs.service_id
-- GROUP BY c.id;

-- SELECT CASE WHEN customers.name =
--       lag(customers.name) OVER (ORDER BY customers.name) THEN ''
--       ELSE customers.name
--       END,
--       services.description
-- FROM customers
-- LEFT OUTER JOIN customers_services
--             ON customer_id = customers.id
-- LEFT OUTER JOIN services
--             ON services.id = service_id;

-- SELECT s.description, count(cs.customer_id)
-- FROM services AS s
-- JOIN customers_services AS cs ON s.id = cs.service_id
-- GROUP BY s.description
-- HAVING count(cs.customer_id) >= 3;

-- SELECT sum(s.price) AS gross
-- FROM services AS s
-- JOIN customers_services AS cs
-- ON s.id = cs.service_id;

-- INSERT INTO customers (name, payment_token)
-- VALUES ('John Doe', 'EYODHLCN');

-- INSERT INTO customers_services (customer_id, service_id)
-- VALUES (7,1), (7,2), (7,3);

-- current expected income level
-- SELECT sum(s.price) FROM services as s
-- JOIN customers_services AS cs
-- ON s.id = cs.service_id
-- WHERE price > 100;

-- potential income
-- SELECT count(c.id) * (SELECT sum(s.price) FROM services AS s
--                       WHERE price > 100)
-- FROM customers AS c;

-- deleting rows
DELETE FROM customers_services
WHERE service_id = 7;

DELETE FROM services
WHERE description = 'Bulk Email';

DELETE FROM customers
WHERE name = 'Chen Ke-Hua';

SELECT * FROM customers;
SELECT * FROM services;
SELECT * FROM customers_services;