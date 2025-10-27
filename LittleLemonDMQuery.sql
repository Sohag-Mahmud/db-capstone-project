-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Address` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `Street` VARCHAR(100) NULL,
  `City` VARCHAR(50) NULL,
  `State` VARCHAR(50) NULL,
  `PostalCode` VARCHAR(10) NULL,
  `Country` VARCHAR(50) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(100) NOT NULL,
  `LastName` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NULL,
  `Phone` VARCHAR(50) NULL,
  `AddressID` INT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE,
  INDEX `FK_Address_ID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `FK_Customer_Address_ID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `LittleLemonDB`.`Address` (`AddressID`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(100) NOT NULL,
  `LastName` VARCHAR(100) NOT NULL,
  `Role` VARCHAR(100) NULL,
  `Email` VARCHAR(100) NULL,
  `Phone` VARCHAR(45) NULL,
  `Salary` INT NULL,
  `AddressID` INT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE,
  INDEX `FK_Address_ID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `FK_Staff_Address_ID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `LittleLemonDB`.`Address` (`AddressID`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNo` INT NULL,
  `CustomerID` INT NULL,
  `BookingTime` TIME NOT NULL,
  `BookingDate` DATE NOT NULL,
  `StaffID` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `FK_Customer_ID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `FK_Booking_Staff_ID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `FK_Customer_ID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Booking_Staff_ID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL,
  `Type` VARCHAR(200) NULL,
  `Price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `ItemID` INT NULL,
  `Cuisine` VARCHAR(100) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `FK_Item_ID_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `FK_Item_ID`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`ItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `BookingID` INT NULL,
  `MenuID` INT NULL,
  `Quantity` INT NULL,
  `BillAmount` DECIMAL(10,2) NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `FK_Booking_ID_idx` (`BookingID` ASC) VISIBLE,
  INDEX `FK_Menu_ID_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `FK_Booking_ID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Menu_ID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
  `OrderStatusID` INT NOT NULL AUTO_INCREMENT,
  `OrderID` INT NULL,
  `StatusName` ENUM('Active', 'Pending', 'Delivered', 'Cancelled') NULL,
  `StatusDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `DeliveryDescription` VARCHAR(255) NULL,
  PRIMARY KEY (`OrderStatusID`),
  INDEX `FK_Order_ID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `FK_Order_ID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
