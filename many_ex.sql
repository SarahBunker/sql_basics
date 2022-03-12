-- ALTER TABLE books_categories
-- ALTER COLUMN book_id
-- SET NOT NULL,
-- ALTER COLUMN category_id
-- SET NOT NULL,
-- DROP CONSTRAINT books_categories_book_id_fkey,
-- DROP CONSTRAINT books_categories_category_id_fkey,
-- ADD FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
-- ADD FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE;


\d books_categories
\d books
\d categories

SELECT books.id,
      books.author,
      string_agg(categories.name, ', ') AS categories
  FROM books
  JOIN books_categories AS bc
    ON books.id = bc.book_id
  JOIN categories
    ON categories.id = bc.category_id
  GROUP BY books.id
  ORDER BY books.id;

-- SELECT * FROM books;

-- SELECT * FROM categories;

ALTER TABLE books
ALTER COLUMN title
TYPE varchar(100),
ALTER COLUMN author
TYPE varchar(100);

-- INSERT INTO books (title, author)
-- VALUES ('Sally Ride: America''s First Woman in Space', 'Lynn Sherr'),
--       ('Jane Eyre', 'Charlotte Brontë'),
--       ('Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');

-- INSERT INTO categories (name)
-- VALUES ('Space Exploration'),
--       ('Cookbook'),
--       ('South Asia');

-- INSERT INTO books_categories
-- VALUES (4, 5), (4, 1), (4, 7),
--       (5, 2), (5, 4),
--       (6, 8), (6, 1), (6, 9);

-- ALTER TABLE books_categories
-- ADD COLUMN id serial PRIMARY KEY;

-- ALTER TABLE books_categories
-- ADD UNIQUE (book_id, category_id);

-- SELECT * FROM books_categories;

-- SELECT * FROM books;

-- SELECT * FROM categories;

\d books_categories

\d books

\d categories

SELECT c.name, count(b.id) AS book_count, string_agg(b.title, ', ') AS book_titles
  FROM books AS b
  JOIN books_categories AS bc
    ON b.id = bc.book_id
  JOIN categories AS c
    ON c.id = bc.category_id
  GROUP BY c.name
  ORDER BY c.name;
  