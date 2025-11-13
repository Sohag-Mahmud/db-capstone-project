USE `LittleLemonDB`;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `LittleLemonDB`.`OrderDeliveryStatus`;
TRUNCATE TABLE `LittleLemonDB`.`Orders`;
TRUNCATE TABLE `LittleLemonDB`.`Bookings`;
TRUNCATE TABLE `LittleLemonDB`.`Menus`;
TRUNCATE TABLE `LittleLemonDB`.`MenuItems`;
TRUNCATE TABLE `LittleLemonDB`.`Staff`;
TRUNCATE TABLE `LittleLemonDB`.`Customers`;
TRUNCATE TABLE `LittleLemonDB`.`Address`;

ALTER TABLE `LittleLemonDB`.`Address` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Customers` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Staff` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`MenuItems` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Menus` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Bookings` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Orders` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`OrderDeliveryStatus` AUTO_INCREMENT = 1;
SET FOREIGN_KEY_CHECKS = 1;

START TRANSACTION;
-- 1) Address
INSERT INTO Address (Street, City, State, PostalCode, Country) VALUES
('123 Olive St', 'New York', 'NY', '10001', 'USA'),     
('45 Maple Ave', 'Chicago', 'IL', '60601', 'USA'),       
('678 Pine Rd', 'Los Angeles', 'CA', '90001', 'USA'),    
('22 Ocean Dr', 'Miami', 'FL', '33101', 'USA'),          
('9 Garden Ln', 'Boston', 'MA', '02108', 'USA'),         
('101 Sunset Blvd', 'Los Angeles', 'CA', '90002', 'USA'),
('500 River St', 'San Francisco', 'CA', '94102', 'USA'), 
('77 Cherry Hill', 'Austin', 'TX', '73301', 'USA'),      
('34 Greenway', 'Seattle', 'WA', '98101', 'USA'),        
('12 Bay St', 'Toronto', 'ON', 'M5J2R8', 'Canada'),            
('90 Park Ave', 'Newark', 'NJ', '07102', 'USA'),               
('87 Rosewood', 'Dallas', 'TX', '75201', 'USA'),               
('14 King St', 'London', 'LDN', 'SW1A1AA', 'UK'),              
('66 Baker St', 'London', 'LDN', 'NW16XE', 'UK'),              
('32 Park Rd', 'Atlanta', 'GA', '30301', 'USA'),               
('5 Elm St', 'Denver', 'CO', '80201', 'USA'),                  
('76 Main St', 'Nashville', 'TN', '37201', 'USA'),             
('8 Hilltop Rd', 'Phoenix', 'AZ', '85001', 'USA'),             
('15 Cedar St', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),        
('89 Forest Ave', 'Orlando', 'FL', '32801', 'USA'),            
('220 Beachside Dr', 'San Diego', 'CA', '92101', 'USA'),       
('74 Oak Terrace', 'Portland', 'OR', '97201', 'USA'),          
('5 Queen St', 'Auckland', 'AUK', '1010', 'New Zealand'),      
('12 River Walk', 'Dublin', 'D', 'D02', 'Ireland'),            
('88 Harbor Way', 'Sydney', 'NSW', '2000', 'Australia'),       
('410 Pearl St', 'Boulder', 'CO', '80302', 'USA'),             
('99 Regent Rd', 'Manchester', 'MAN', 'M11AE', 'UK'),          
('302 Lakeshore', 'Chicago', 'IL', '60611', 'USA'),            
('58 Sunrise Cir', 'Tampa', 'FL', '33602', 'USA'),             
('17 Cedar Grove', 'Minneapolis', 'MN', '55401', 'USA'),       
('739 Blossom St', 'San Jose', 'CA', '95112', 'USA'),          
('3 Aurora Blvd', 'Quezon City', 'NCR', '1100', 'Philippines'),
('1200 Mission St', 'San Francisco', 'CA', '94103', 'USA'),    
('7 Kingsley Ave', 'Melbourne', 'VIC', '3000', 'Australia'),   
('420 Maplewood', 'Raleigh', 'NC', '27601', 'USA'),            
('890 Birch Rd', 'Edmonton', 'AB', 'T5J0N3', 'Canada'),        
('64 Park Place', 'Jersey City', 'NJ', '07302', 'USA'),        
('250 Meadow Ln', 'Columbus', 'OH', '43215', 'USA'),           
('19 Brookside', 'Madison', 'WI', '53703', 'USA'),             
('81 High St', 'Oxford', 'OXF', 'OX14AS', 'UK');               

-- 2) Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, AddressID) VALUES
('John', 'Smith', 'john.smith@email.com', '5551110001', 5),
('Emma', 'Johnson', 'emma.j@email.com', '5551110002', 1),
('Michael', 'Brown', 'mike.brown@email.com', '5551110003', 12),
('Olivia', 'Davis', 'olivia.d@email.com', '5551110004', 3),
('William', 'Jones', 'will.j@email.com', '5551110005', 9),
('Sophia', 'Garcia', 'sophia.g@email.com', '5551110006', 14),
('James', 'Martinez', 'james.m@email.com', '5551110007', 2),
('Ava', 'Rodriguez', 'ava.r@email.com', '5551110008', 10),
('Benjamin', 'Hernandez', 'ben.h@email.com', '5551110009', 7),
('Mia', 'Lopez', 'mia.l@email.com', '5551110010', 15),
('Lucas', 'Gonzalez', 'lucas.g@email.com', '5551110011', 20),
('Charlotte', 'Wilson', 'charlotte.w@email.com', '5551110012', 6),
('Henry', 'Anderson', 'henry.a@email.com', '5551110013', 18),
('Amelia', 'Thomas', 'amelia.t@email.com', '5551110014', 4),
('Ethan', 'Taylor', 'ethan.t@email.com', '5551110015', 13),
('Harper', 'Moore', 'harper.m@email.com', '5551110016', 11),
('Jack', 'Jackson', 'jack.j@email.com', '5551110017', 8),
('Evelyn', 'White', 'evelyn.w@email.com', '5551110018', 16),
('Alexander', 'Harris', 'alex.h@email.com', '5551110019', 19),
('Ella', 'Martin', 'ella.m@email.com', '5551110020', 17);

-- 3) Staff
INSERT INTO Staff (FirstName, LastName, Role, Email, Phone, Salary, AddressID) VALUES
('Liam', 'Walker', 'Manager', 'liam.w@email.com', '5552000001', 55000, 35),
('Noah', 'Hall', 'Chef', 'noah.h@email.com', '5552000002', 48000, 28),
('Emma', 'Young', 'Waiter', 'emma.y@email.com', '5552000003', 30000, 40),
('Olivia', 'Allen', 'Host', 'olivia.a@email.com', '5552000004', 29000, 21),
('Ava', 'King', 'Chef', 'ava.k@email.com', '5552000005', 47000, 34),
('Sophia', 'Wright', 'Manager', 'sophia.w@email.com', '5552000006', 55000, 27),
('Isabella', 'Scott', 'Waiter', 'isabella.s@email.com', '5552000007', 31000, 39),
('Mason', 'Adams', 'Host', 'mason.a@email.com', '5552000008', 28500, 31),
('Lucas', 'Baker', 'Chef', 'lucas.b@email.com', '5552000009', 46000, 24),
('Charlotte', 'Nelson', 'Waiter', 'charlotte.n@email.com', '5552000010', 29500, 38),
('Amelia', 'Carter', 'Waiter', 'amelia.c@email.com', '5552000011', 30500, 22),
('Ethan', 'Mitchell', 'Chef', 'ethan.m@email.com', '5552000012', 46500, 30),
('Harper', 'Perez', 'Host', 'harper.p@email.com', '5552000013', 29000, 33),
('Jack', 'Roberts', 'Chef', 'jack.r@email.com', '5552000014', 48000, 26),
('Evelyn', 'Turner', 'Waiter', 'evelyn.t@email.com', '5552000015', 30000, 37),
('Alexander', 'Phillips', 'Manager', 'alex.p@email.com', '5552000016', 56000, 29),
('Ella', 'Campbell', 'Waiter', 'ella.c@email.com', '5552000017', 29000, 36),
('William', 'Parker', 'Host', 'william.p@email.com', '5552000018', 28500, 25),
('Henry', 'Evans', 'Chef', 'henry.e@email.com', '5552000019', 47000, 23),
('Mia', 'Edwards', 'Waiter', 'mia.e@email.com', '5552000020', 29500, 32);

-- 4) MenuItems
INSERT INTO MenuItems (Name, Type, Price) VALUES
('Bruschetta', 'Appetizer', 6.50),
('Caesar Salad', 'Appetizer', 7.50),
('Margherita Pizza', 'Main Course', 12.00),
('Spaghetti Carbonara', 'Main Course', 13.50),
('Grilled Salmon', 'Main Course', 18.00),
('Tiramisu', 'Dessert', 6.00),
('Panna Cotta', 'Dessert', 5.50),
('Minestrone Soup', 'Appetizer', 7.00),
('Lasagna', 'Main Course', 14.00),
('Risotto', 'Main Course', 15.50),
('Garlic Bread', 'Appetizer', 5.00),
('Caprese Salad', 'Appetizer', 8.00),
('Chicken Parmigiana', 'Main Course', 16.00),
('Pesto Pasta', 'Main Course', 13.00),
('Seafood Linguine', 'Main Course', 17.50),
('Chocolate Cake', 'Dessert', 6.50),
('Gelato', 'Dessert', 5.00),
('Espresso', 'Beverage', 3.00),
('Cappuccino', 'Beverage', 4.00),
('Red Wine', 'Beverage', 8.00);

-- 5) Menus
INSERT INTO Menus (ItemID, Cuisine) VALUES
(1, 'Italian'),
(2, 'Italian'),
(3, 'Italian'),
(4, 'Italian'),
(5, 'Seafood'),
(6, 'Italian'),
(7, 'Italian'),
(8, 'Italian'),
(9, 'Italian'),
(10, 'Italian'),
(11, 'Italian'),
(12, 'Italian'),
(13, 'Italian'),
(14, 'Italian'),
(15, 'Seafood'),
(16, 'Dessert'),
(17, 'Dessert'),
(18, 'Beverage'),
(19, 'Beverage'),
(20, 'Beverage');

-- 6) Bookings
INSERT INTO Bookings (TableNo, CustomerID, BookingTime, BookingDate, StaffID) VALUES
(5, 1,  '18:30:00', '2025-10-01', 3),
(3, 2,  '19:00:00', '2025-10-01', 4),
(7, 3,  '20:00:00', '2025-10-02', 2),
(1, 4,  '18:00:00', '2025-10-02', 6),
(9, 5,  '19:30:00', '2025-10-03', 5),
(4, 6,  '18:15:00', '2025-10-03', 3),
(2, 7,  '19:45:00', '2025-10-04', 7),
(6, 8,  '20:15:00', '2025-10-04', 8),
(8, 9,  '21:00:00', '2025-10-05', 9),
(10,10, '19:00:00', '2025-10-05', 10),
(5, 11, '18:30:00', '2025-10-06', 11),
(3, 12, '19:15:00', '2025-10-06', 12),
(7, 13, '20:45:00', '2025-10-07', 13),
(1, 14, '18:00:00', '2025-10-07', 14),
(9, 15, '19:45:00', '2025-10-08', 15),
(4, 16, '18:15:00', '2025-10-08', 16),
(2, 17, '19:30:00', '2025-10-09', 17),
(6, 18, '20:30:00', '2025-10-09', 18),
(8, 19, '21:00:00', '2025-10-10', 19),
(10,20, '19:00:00', '2025-10-10', 20);

-- 7) Orders
INSERT INTO Orders (BookingID, MenuID, Quantity, BillAmount) VALUES
(1,  3, 2, 24.00),
(2,  4, 1, 13.50),
(3,  9, 2, 28.00),
(4,  5, 1, 18.00),
(5,  13,2, 32.00),
(6,  14,1, 13.00),
(7,  10,1, 15.50),
(8,  11,3, 15.00),
(9,  15,2, 35.00),
(10, 6, 2, 12.00),
(11, 7, 1, 5.50),
(12, 12,2, 16.00),
(13, 17,3, 15.00),
(14, 18,2, 6.00),
(15, 19,1, 4.00),
(16, 20,1, 8.00),
(17, 1, 2, 13.00),
(18, 2, 1, 7.50),
(19, 8, 1, 7.00),
(20, 16,2, 13.00)
(1, 17, 1, 5.00),
(2, 17, 2, 10.00),
(3, 17, 1, 5.00),
(4, 3,  1, 12.00),
(5, 6,  1, 6.00);

-- 8) OrderDeliveryStatus
INSERT INTO OrderDeliveryStatus (OrderID, StatusName, DeliveryDescription) VALUES
(1, 'Delivered', 'Served to table'),
(2, 'Delivered', 'Served to table'),
(3, 'Pending', 'In kitchen'),
(4, 'Active', 'Being prepared'),
(5, 'Delivered', 'Completed and billed'),
(6, 'Cancelled', 'Customer cancelled'),
(7, 'Delivered', 'Served'),
(8, 'Active', 'Preparing order'),
(9, 'Delivered', 'Served hot'),
(10, 'Pending', 'Dessert pending'),
(11, 'Delivered', 'Served to customer'),
(12, 'Delivered', 'Served'),
(13, 'Delivered', 'Completed'),
(14, 'Cancelled', 'Customer left early'),
(15, 'Active', 'Being made'),
(16, 'Pending', 'Beverage cooling'),
(17, 'Delivered', 'Appetizer done'),
(18, 'Delivered', 'Served quickly'),
(19, 'Delivered', 'Final order served'),
(20, 'Pending', 'Waiting for dessert');

COMMIT;

SELECT * FROM Address;
SELECT * FROM Customers;
SELECT * FROM Staff;
SELECT * FROM MenuItems;
SELECT * FROM Menus;
SELECT * FROM Bookings;
SELECT * FROM Orders;
SELECT * FROM OrderDeliveryStatus;
