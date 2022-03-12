-- ALTER TABLE orders
--   ADD CONSTRAINT orders_product_id_fkey 
--   FOREIGN KEY (product_id)
--   REFERENCES products(id);

\d orders

\d products

-- INSERT INTO products (name)
--   VALUES ('small bolt'), ('large bolt');

-- SELECT * FROM products;

-- INSERT INTO orders (product_id, quantity)
--   VALUES (1, 10), (1, 25), (2, 15);

-- SELECT * FROM orders;

SELECT orders.quantity, products.name
  FROM orders
  INNER JOIN products
    ON orders.product_id = products.id;

-- INSERT INTO orders (quantity)
--   VALUES (5);

SELECT * FROM orders;

-- DELETE FROM orders
--   WHERE product_id IS NULL;

-- ALTER TABLE orders
--   ALTER COLUMN product_id
--   SET NOT NULL;

DROP TABLE IF EXISTS public.reviews;

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  body text,
  product_id integer REFERENCES products(id) NOT NULL
);

\d reviews

INSERT INTO reviews (product_id, body)
  VALUES (1, 'a little small'), (1, 'very round!'), (2, 'could have been smaller');

SELECT products.name AS Product,
       reviews.body AS Review
  FROM products
  INNER JOIN reviews
    ON reviews.product_id = products.id;