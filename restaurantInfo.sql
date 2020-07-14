CREATE PROCEDURE restaurantInfo()
BEGIN
    ALTER TABLE restaurants ADD description VARCHAR(100);
    ALTER TABLE restaurants ADD active INT;
    UPDATE restaurants
    SET description = 'TBD', active = 1;

    SELECT * FROM restaurants ORDER BY id;
END