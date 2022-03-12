-- DROP TABLE bids;
-- DROP TABLE bidders;
-- DROP TABLE items;


-- CREATE TABLE bidders (
-- id serial PRIMARY KEY,
-- name text NOT NULL
-- );

-- CREATE TABLE items (
-- id serial PRIMARY KEY,
-- name text NOT NULL,
-- initial_price decimal(6,2) NOT NULL CHECK (initial_price BETWEEN 0.01 AND 1000.00),
-- sales_price decimal(6,2)
-- );

-- CREATE TABLE bids (
-- id serial PRIMARY KEY,
-- bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
-- item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
-- amount decimal(6,2) NOT NULL CHECK (amount BETWEEN 0.01 AND 1000.00)
-- );

-- CREATE INDEX bids_mm_idx ON bids (bidder_id, item_id);

-- \copy bidders from 'bidders.csv' CSV HEADER;
-- \copy items from 'items.csv' CSV HEADER;
-- \copy bids from 'bids.csv' CSV HEADER;

-- SELECT * FROM bidders;
-- SELECT * FROM items;
-- SELECT * FROM bids;

-- Items bid on, and items not bid on
-- SELECT i.name AS "Bid on Items"
-- FROM items AS i 
-- WHERE i.id IN (SELECT item_id FROM bids);

-- SELECT name AS "Not Bid On" FROM items
-- WHERE id NOT IN (SELECT item_id FROM bids);

-- Names of people who have bid on items
-- SELECT name FROM bidders
-- WHERE EXISTS (SELECT 1 FROM bids WHERE bidders.id = bids.bidder_id);

-- SELECT DISTINCT b.name FROM bidders AS b
-- JOIN bids ON bids.bidder_id = b.id;

-- Find largest # bid/ query from a virtual table
-- SELECT max(count)
-- FROM (SELECT count(id)
--         FROM bids
--         GROUP BY item_id)
--       AS item_bids;

-- Find number of bids on each item using a scalar subquery
-- SELECT name,
--       (SELECT count(item_id) from bids WHERE items.id = item_id)
-- FROM items
-- ORDER BY count;

-- SELECT name, count(item_id) FROM items
-- LEFT JOIN bids ON items.id = item_id
-- GROUP BY name
-- ORDER BY count;

-- Compare known data to find id without using And
-- SELECT id FROM items
-- WHERE ROW('Painting', 100.00, 250.00) =
--   ROW(name, initial_price, sales_price);

-- Use explain ANALYZE to check efficiency of a query
-- EXPLAIN SELECT name FROM bidders
-- WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

-- EXPLAIN ANALYZE SELECT name FROM bidders
-- WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

-- EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid FROM bids
--   GROUP BY bidder_id
--   ORDER BY max_bid DESC
--   LIMIT 1;

-- EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
--   (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;



SELECT "scalar subquery";
EXPLAIN ANALYZE SELECT name,
      (SELECT count(item_id) from bids WHERE items.id = item_id)
FROM items
ORDER BY count;

SELECT "JOIN";
EXPLAIN ANALYZE SELECT name, count(item_id) FROM items
LEFT JOIN bids ON items.id = item_id
GROUP BY name
ORDER BY count;