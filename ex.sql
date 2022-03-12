DROP TABLE user_roles;
DROP TABLE users;


CREATE TABLE users (
id serial PRIMARY KEY,
name varchar(50) NOT NULL
);

CREATE TABLE user_roles (
id serial PRIMARY KEY,
role varchar(50),
user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

\d users
\d user_roles

INSERT INTO users (name)
VALUES ('Alex'), ('Jess'), ('Jin'), ('Paulo'), ('Sarah');

INSERT INTO user_roles (role, user_id)
VALUES ('Admin', 2),
       ('Member', 3),
       ('Admin', 1),
       ('Member', 4),
       ('Editor', 5);
       
SELECT * FROM users;
SELECT * FROM user_roles;

-- SELECT users.name AS "Admins" FROM
--   users JOIN user_roles
--   ON users.id = user_roles.user_id
--   WHERE user_roles.role = 'Admin';

SELECT name AS "Admins" FROM users
  WHERE id NOT IN
  (SELECT user_id FROM user_roles
    WHERE role = 'Admin');

SELECT name AS "Admins" FROM users
  WHERE id IN
  (SELECT user_id FROM user_roles
    WHERE role = 'Admin');

SELECT name AS "Admins" FROM users
  WHERE id NOT IN
  (SELECT user_id FROM user_roles
    WHERE role != 'Admin');

-- SELECT name AS "Admins" FROM users
--   WHERE id =
--   (SELECT user_id FROM user_roles
--     WHERE role = 'Admin');