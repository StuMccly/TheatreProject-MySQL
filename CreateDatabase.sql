/*
*/

-- Create Database
DROP DATABASE IF EXISTS FinalProjectTheatre;
CREATE DATABASE FinalProjectTheatre;
USE FinalProjectTheatre;

/* -- Create EventInfo Table
	Table for Details of Events Held at the Theatre
*/
DROP TABLE IF EXISTS EventInfo;
CREATE TABLE EventInfo(
	EventID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(50) NOT NULL, -- Name of Show
	EventType VARCHAR(50) NOT NULL, -- Type of Show (Theatre show, Musical, Opera, Concert)
    Descrip VARCHAR(500) NOT NULL, -- Description of Show, including Language, Principle performers
    EventDurationMM INT NOT NULL, -- Length of Event in Minutes
    PricePence INT NOT NULL -- Could use DECIMAL(6,2) to list as £, using INT for easier conversion to Java for now
);

/* -- Create Performaces Table

*/
DROP TABLE IF EXISTS Performances;
CREATE TABLE Performances(
PerformanceID INT PRIMARY KEY AUTO_INCREMENT,
EventID INT NOT NULL,
PerformanceStart DATETIME NOT NULL, -- Format 'YYYY-MM-DD HH:MM:SS' AS STRING
AvailabilityOfTickets INT NOT NULL,
FOREIGN KEY(EventID) REFERENCES EventInfo(EventID)
);

/* -- Create Table Purchasers

*/
DROP TABLE IF EXISTS Purchasers;
CREATE TABLE Purchasers(
PurchaserID INT PRIMARY KEY AUTO_INCREMENT,
PurchaserName VARCHAR(100),
DoB DATE, -- Format 'YYYY-MM-DD HH:MM:SS' AS STRING
AddressHouseNumber VARCHAR(50), -- VARCHAR(50) to cover instances where house has name, flat B, 21A etc
AddressStreet VARCHAR(60), -- 
AddressCity VARCHAR (60), -- To cover exceedingly long place names like Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch (58 Char)
AddressCounty VARCHAR(60), --
AddressPostcode VARCHAR(7), -- Postcodes between 5 and 7 AlphaNumeric, remove spaces before putting into column
CreditCard VARCHAR(19) -- Credit card numbers between 16-19 digits long, remove spaces before putting into column
);

/* -- Create Bookings Table

*/
DROP TABLE IF EXISTS Bookings;
CREATE TABLE Bookings(
BookingID INT PRIMARY KEY AUTO_INCREMENT,
PerformanceID INT NOT NULL,
PurchaserID INT NOT NULL,
Concessionary BOOLEAN NOT NULL,
BookingTime DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Automatically add current date time to booking for easier lookups and legal
FOREIGN KEY(PerformanceID) REFERENCES Performances(PerformanceID),
FOREIGN KEY(PurchaserID) REFERENCES Purchasers(PurchaserID)
);