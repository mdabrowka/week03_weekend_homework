DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;


CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);


-- INSERT INTO customers (id, name, funds) VALUES (1, 'Mary', 70);
-- INSERT INTO customers (id, name, funds) VALUES (2, 'Lola', 60);
--
-- INSERT INTO films (id, title, price) VALUES (1, 'The Deer Hunter', 12);
-- INSERT INTO films (id, title, price) VALUES (2, 'Lola rennt', 10);
--
-- INSERT INTO tickets (id, customer_id, film_id) VALUES (1, 1, 1);
-- INSERT INTO tickets (id, customer_id, film_id) VALUES (2, 2, 2);
--
-- SELECT films.* FROM films
-- INNER JOIN tickets
-- ON films.id = tickets.film_id
-- WHERE film_id = 2;
