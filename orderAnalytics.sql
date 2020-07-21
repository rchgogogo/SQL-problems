DROP PROCEDURE IF EXISTS orderAnalytics;
CREATE PROCEDURE orderAnalytics()
BEGIN

    DROP TABLE IF EXISTS order_analytics;
    CREATE TABLE order_analytics
    (id INT, year DATETIME, quarter DATETIME, type VARCHAR(20), total_price INT);
    SELECT id, YEAR(order_date) AS year, QUARTER(order_date) AS quarter, type, (price*quantity) AS total_price
    FROM orders;

    SELECT *
    FROM order_analytics
    ORDER by id;
END;