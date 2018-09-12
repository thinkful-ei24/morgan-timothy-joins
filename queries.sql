--- psql -U dev -d dev-restaurant-data -f ./queries.sql

-- DELETE FROM restaurants WHERE id = '1000';

-- SELECT * FROM grades WHERE restaurant_id = 1000;

-- SELECT id, grade, restaurant_id FROM grades;

-- ALTER TABLE grades
--     DROP CONSTRAINT grades_restaurant_id_fkey,
--     ADD CONSTRAINT grades_restaurant_id_fkey
--         FOREIGN KEY (restaurant_id)
--         REFERENCES restaurants(id)
--         ON DELETE CASCADE;

-- SELECT count(*) from grades;
-- DELETE FROM restaurants WHERE id = 1000;
-- SELECT count(*) from grades;

--ALTER TABLE grades
--   DROP CONSTRAINT grades_restaurant_id_fkey,
--    ADD CONSTRAINT grades_restaurant_id_fkey
        -- FOREIGN KEY (restaurant_id)
        -- REFERENCES restaurants(id)
        -- ON DELETE SET NULL;

-- SELECT * FROM grades WHERE id = 15; -- it has restaurant_id of 10
-- DELETE FROM restaurants WHERE id = 9;
-- SELECT * FROM grades WHERE id = 15; -- restaurant_id is null

-- SELECT grades.id as "grade id", grades.grade, grades.date as "grade date", restaurants.id as "restaurant id", restaurants.name, restaurants.borough
--     FROM restaurants
--     INNER JOIN grades
--     ON grades.restaurant_id = restaurants.id
--     WHERE BOROUGH = 'Staten Island'
--     LIMIT 5;

-- SELECT restaurants.id, restaurants.name, grades.date as "date of C grade"
--     FROM restaurants
--     INNER JOIN grades
--     ON grades.restaurant_id = restaurants.id
--     AND grades.grade = 'C'
--     LIMIT 5;

-- SELECT count(distinct restaurants.id)
--     FROM restaurants
--     INNER JOIN grades
--     ON grades.restaurant_id = restaurants.id
--     AND grades.grade = 'C';

-- SELECT restaurants.id, restaurants.name, grades.date as "date of C grade"
--     FROM restaurants
--     LEFT JOIN grades
--     ON grades.restaurant_id = restaurants.id
--     AND grades.grade = 'C'
--     ORDER BY grades.date DESC
--     LIMIT 5;

-- SELECT restaurants.id, restaurants.name, grades.date
--     FROM restaurants
--     RIGHT JOIN grades
--     ON grades.restaurant_id = restaurants.id
--     WHERE BOROUGH = 'Staten Island'
--     ORDER BY grades.date DESC
--     LIMIT 5;


-- CREATE TABLE products (
--     id SERIAL PRIMARY KEY,
--     name TEXT NOT NULL,
--     price NUMERIC NOT NULL DEFAULT 0
-- );

-- CREATE TYPE order_statuses AS ENUM (
--     'open', 'in progress', 'shipped', 'returned');

-- CREATE TABLE ORDERS (
--     id SERIAL PRIMARY KEY,
--     status order_statuses NOT NULL DEFAULT 'open',
--     created DATE NOT NULL DEFAULT CURRENT_DATE
-- );

-- CREATE TABLE order_products (
--     order_id INT REFERENCES orders ON DELETE CASCADE,
--     product_id INT REFERENCES products ON DELETE RESTRICT,
--     quantity INT NOT NULL DEFAULT 1,
--     PRIMARY KEY (order_id, product_id)
-- );

-- INSERT INTO products (name, price) VALUES
--     ('shirt', 25),
--     ('pants', 42),
--     ('hat', 23),
--     ('monocle', 50);

-- INSERT INTO orders (status) VALUES
--     ('open'),
--     ('open'),
--     ('shipped');

-- INSERT INTO order_products (order_id, product_id, quantity) VALUES
--     (1, 1, 2),
--     (1, 3, 1),
--     (1, 4, 1),
--     (2, 4, 5),
--     (3, 1, 1),
--     (3, 3, 1);

-- SELECT
--     orders.id as "order id",
--     orders.status,
--     products.name as "product",
--     products.price * order_products.quantity as "price",
--     order_products.quantity

--     FROM orders
--     INNER JOIN order_products
--     ON orders.id = order_products.order_id
--     INNER JOIN products
--     on products.id = order_products.product_id;

SELECT COUNT(*) FROM order_products where order_id = 1;
DELETE FROM orders WHERE id = 1;
SELECT COUNT(*) FROM order_products where order_id = 1;