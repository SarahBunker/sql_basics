SELECT count(id) FROM tickets;

\d customers

\d tickets

SELECT count(DISTINCT customer_id) FROM tickets;
    
-- SELECT DISTINCT count(c.id) FROM customers AS t INNER JOIN customers AS c ON c.id = t.customer_id;

SELECT round( count(DISTINCT t.customer_id) / count(DISTINCT c.id)::decimal * 100, 2)
    AS percent
FROM customers AS c
LEFT OUTER JOIN tickets AS t
ON t.customer_id = c.id;

SELECT e.name, count(t.id) AS popularity
FROM events AS e
LEFT OUTER JOIN tickets AS t
ON e.id = t.event_id
GROUP BY e.name
ORDER BY popularity DESC;

SELECT c.id, c.email, count( DISTINCT t.event_id)
  FROM customers AS c
  INNER JOIN tickets AS t
    ON c.id = t.customer_id
  GROUP BY c.id
  HAVING count( DISTINCT t.event_id) = 3;

SELECT e.name AS event,
       e.starts_at,
       sections.name AS section,
       seats.row,
       seats.number AS seat
  FROM customers AS c
  INNER JOIN tickets AS t
    ON c.id = t.customer_id
  INNER JOIN events AS e
    ON t.event_id = e.id
  INNER JOIN seats
    ON t.seat_id = seats.id
  INNER JOIN sections
    ON seats.section_id = sections.id
  WHERE c.email = 'gennaro.rath@mcdermott.co';