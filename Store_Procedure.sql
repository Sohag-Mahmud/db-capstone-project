use littleLemondb;
-- Task 1 - Create a procedure that displays the maximum ordered quantity in the Orders table. 
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS 'Max Quantity in Orders' FROM Orders;
END //
DeLIMITER ;
CALL GetMaxQuantity();
-- -----------------------------------------------------
-- Task 2: Create a prepared statement to get order details by CustomerID
DELIMITER //
-- First, prepare the statement
PREPARE GetOrderDetail FROM 
'SELECT Orders.OrderID, Orders.Quantity, Orders.BillAmount
 FROM Orders
 INNER JOIN Bookings ON Orders.BookingID = Bookings.BookingID
 WHERE Bookings.CustomerID = ?';

-- Create a variable and assign a CustomerID value
SET @id = 5;

-- Execute the prepared statement using that variable
EXECUTE GetOrderDetail USING @id;

-- (Optional) When done, deallocate it to free memory
DEALLOCATE PREPARE GetOrderDetail;
-- -----------------------------------------------------
-- Task 3: Create a stored procedure to delete an order by its OrderID
DELIMITER //

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders
    WHERE OrderID = order_id;
END //
DELIMITER ;

CALL CancelOrder(5);

