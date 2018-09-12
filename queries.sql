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

ALTER TABLE grades
    DROP CONSTRAINT grades_restaurant_id_fkey,
    ADD CONSTRAINT grades_restaurant_id_fkey
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(id)
        ON DELETE SET NULL;

SELECT * FROM grades WHERE id = 15; -- it has restaurant_id of 10
DELETE FROM restaurants WHERE id = 9;
SELECT * FROM grades WHERE id = 15; -- restaurant_id is null