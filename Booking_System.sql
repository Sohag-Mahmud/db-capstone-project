use littleLemondb;
SELECT * FROM Bookings;
--Task 1 - Insert a new booking into the Bookings table

-- Already Done

--Task 2 - Create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked.
DELIMITER //
CREATE PROCEDURE CheckBooking ( IN p_booking_date DATE, IN p_table_no INT)
BEGIN
    DECLARE booking_count INT;

    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE BookingDate = p_booking_date AND TableNo = p_table_no;

    IF booking_count > 0 THEN
        SELECT CONCAT('Table ', p_table_no, ' is already booked on ', DATE_FORMAT(p_booking_date, '%Y-%m-%d')) AS Status,
               booking_count AS ExistingBookings;
    ELSE
        SELECT CONCAT('Table ', p_table_no, ' is available on ', DATE_FORMAT(p_booking_date, '%Y-%m-%d')) AS Status,
               booking_count AS ExistingBookings;
    END IF;
END // 
DELIMITER ;

CALL CheckBooking('2025-10-01', 5);
CALL CheckBooking('2025-10-08', 4);
---------------------------------------------------------
--Task 3 - Verify a booking, and decline any reservations for tables that are already booked under another name.
DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN p_booking_date DATE,
    IN p_booking_time TIME,
    IN p_table_no INT,
    IN p_customer_id INT   -- pass a real CustomerID; StaffID can be NULL
)
BEGIN
    DECLARE v_count INT DEFAULT 0;

    START TRANSACTION;

    -- lock matching rows to avoid races
    SELECT COUNT(*) INTO v_count
    FROM Bookings
    WHERE BookingDate = p_booking_date
      AND TableNo     = p_table_no
    FOR UPDATE;

    IF v_count > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', p_table_no,
                      ' is already booked - booking cancelled') AS `Booking status`;
    ELSE
        INSERT INTO Bookings (TableNo, CustomerID, BookingTime, BookingDate, StaffID)
        VALUES (p_table_no, p_customer_id, p_booking_time, p_booking_date, NULL);

        COMMIT;
        SELECT CONCAT('Table ', p_table_no,
                      ' is available - booking confirmed') AS `Booking status`;
    END IF;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS AddValidBooking;
SELECT * FROM Bookings;
CALL AddValidBooking('2025-10-09', '19:00:00', 6, 1);
CALL AddValidBooking('2025-10-11', '19:00:00', 6, 1);