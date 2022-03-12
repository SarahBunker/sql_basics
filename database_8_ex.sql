SELECT calls.when, calls.duration, contacts.first_name, contacts.last_name,
contacts.number
FROM calls INNER JOIN contacts ON calls.contact_id = contacts.id;



-- INSERT INTO calls ("when", duration, contact_id)
--   VALUES ('2016-01-18 14:47:00', 632, 6);

-- SELECT * FROM calls;

-- SELECT * FROM contacts;
\d calls

\d contacts

SELECT c."when", c.duration, con.first_name, con.last_name
  FROM calls AS c
  LEFT JOIN contacts AS con
    ON con.id = c.contact_id
  WHERE con.first_name <> 'William' AND con.last_name <> 'Swift';
  
-- INSERT INTO contacts (first_name, last_name, "number")
--   VALUES ('Merve', 'Elk', '6343511126'),
--   ('Sawa', 'Fyodorov', '6125594874');

-- SELECT * FROM contacts;

-- INSERT INTO calls ("when", duration, contact_id)
--   VALUES ('2016-01-17 11:52:00', 175, 26),
--   ('2016-01-18 21:22:00', 79, 27);
  
-- SELECT * FROM calls;

-- ALTER TABLE contacts
--   ADD CONSTRAINT unique_number
--   UNIQUE ("number");

INSERT INTO contacts (first_name, last_name, "number")
  VALUES ('Joe', 'Biden', '6125594874');
