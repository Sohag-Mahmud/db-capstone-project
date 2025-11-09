use littleLemondb;
-- -----------------------------------------------------   
--Task 1 - create a virtual table OrdersView
CREATE View OrdersView AS SELECT OrderID, Quantity, BillAmount from Orders
WHERE Quantity > 2;

select *FROM OrdersView;
-- -----------------------------------------------------
--Task 2 - customers with orders above $30
SELECT Customers.CustomerID, CONCAT(Customers.FirstName,' ', Customers.LastName) AS FullName,
Orders.OrderID, Orders.BillAmount, MenuItems.Name AS MenuName, Menus.Cuisine AS CourseName from Customers
INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID
INNER JOIN Orders ON Bookings.BookingID = Orders.BookingID
INNER JOIN Menus ON Orders.MenuID = Menus.MenuID
INNER JOIN MenuItems ON Menus.ItemID = MenuItems.ItemID
WHERE Orders.BillAmount > 30;
-- -----------------------------------------------------
--task 3 - Find all menu items for which more than 2 orders have been placed
SELECT DISTINCT MenuItems.Name
FROM Menus
JOIN MenuItems ON MenuItems.ItemID = Menus.ItemID
WHERE Menus.MenuID = ANY (SELECT Orders.MenuIDFROM Orders GROUP BY Orders.MenuID
HAVING COUNT(*) > 2 );
-- -----------------------------------------------------
