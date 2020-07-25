CREATE PROCEDURE freeSeats()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT f.flight_id, IFNULL((number_of_seats - temp.num_of_purcased), number_of_seats) AS free_seats
    FROM flights f JOIN planes p 
    ON f.plane_id = p.plane_id
    LEFT JOIN 
    (SELECT flight_id, count(seat_no) AS num_of_purcased FROM purchases
    GROUP BY flight_id) AS temp
    ON f.flight_id = temp.flight_id
    ORDER BY f.flight_id;
END