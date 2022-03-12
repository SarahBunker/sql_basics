-- drop table books;
-- drop table authors;


-- CREATE TABLE authors (
--   id serial PRIMARY KEY,
--   name varchar(100) NOT NULL
-- );

-- CREATE TABLE books (
--   id serial PRIMARY KEY,
--   title varchar(100) NOT NULL,
--   isbn char(13) UNIQUE NOT NULL,
--   author_id int REFERENCES authors(id)
-- );

-- CREATE INDEX ON books (author_id);

-- DROP INDEX books_author_id_idx;

-- \di

-- EXPLAIN SELECT * FROM books;

-- EXPLAIN SELECT books.title FROM books
-- JOIN authors ON books.author_id = authors.id
-- WHERE authors.name = 'William Gibson';

-- EXPLAIN SELECT title FROM books
-- WHERE author_id =
-- (SELECT id FROM authors
-- WHERE name = 'William Gibson');

-- EXPLAIN ANALYZE SELECT books.title FROM books
-- JOIN authors ON books.author_id = authors.id
-- WHERE authors.name = 'William Gibson';

-- # doesn't work because from wrong table.
-- SELECT title FROM books WHERE author_id =
--   (SELECT id FROM authors WHERE name = 'William Gibson');