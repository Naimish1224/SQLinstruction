-- create and select the database
use master;
go
drop database if exists EdDbsqlser;
go
create database EdDbsqlser;
go
use EdDbsqlser;
go
set NOCOUNT on;
go



CREATE TABLE Login (
Id INT								NOT NULL PRIMARY KEY identity(1,1),
username                VARCHAR(50) NOT NULL UNIQUE,
password                VARCHAR(255) NOT NULL,
created_at              DATETIME);

Create table [User] (
ID 						int 			primary key identity(1,1),
Username 				varchar(20) 		not null unique,
Password 				varchar(20)			not null,
Firstname 				varchar(20) 		not null,
Lastname				varchar(20) 		not null,
Phone					varchar(12)			not null,
Email	 				varchar(75) 		not null,
Reviewer				bit					not null,
Admin					bit					not null);

Create table Vendor (
ID 						int			primary key identity(1,1),
Code 					varchar(10) 		not null unique,
Name					varchar(255)		not null,
Address 				varchar(255) 		not null,
City					varchar(255) 		not null,
State	 				varchar(2) 			not null,
Zip						varchar(5)			not null,
Phone					varchar(12)			not null,
email 					varchar(100)		not null);

Create table Request (
ID 						int			primary key identity(1,1),
UserId 					Int			not null,
Description 			varchar(255)		not null,
Justification 			varchar(255) 		not null,
Dateneeded				datetime		 	not null,
Deliverymode	 		varchar(25) 		not null,
Status					Varchar(20)			not null,
Total					Decimal (10,2)		not null,
Submitdate				Datetime			not null,
ReasonforRejection 		varchar(100)				,

foreign key (UserID) references [User](id));




Create table Product (
ID 						int			primary key identity(1,1),
VendorID 				int 				not null,
PartNumber				varchar(50)			not null,
ProductName 			varchar(150) 		not null,
Price					Decimal(10,2) 		not null,
Unit	 				varchar(255) 				,
Photopath				varchar(255)				,

CONSTRAINT vendor_part unique (VendorID, Partnumber),
foreign key (VendorID) references Vendor(id));

Create table LineItem (
ID 						int			primary key identity(1,1),
RequestID 				int 			not null,
ProductID 				int					,
Quantity 				int 					,

CONSTRAINT req_pdt unique (RequestID, ProductID),
foreign key (ProductId) references Product(Id),
foreign key (RequestId) references Request(Id));

SET IDENTITY_INSERT [user] ON
insert into [User] Values (Username, password, firstname, lastname, phone, email, reviewer, admin)
('NP101', 11111, 'Nick', 'Patel', '513-405-8070', 'NP@Gmail.com', 0, 1),
('MP101', 22222, 'Mansi', 'Patel', '513-448-9588', 'MP@Gmail.com', 0, 1),
('GP101', 33333, 'Gunvant', 'Patel', '937-763-1421', 'GP@Gmail.com', 1, 0),
('AP101', 44444, 'Anjana', 'Patel', '513-445-9588', 'AP@Gmail.com', 1, 0),
('MP201', 55555, 'Mukti', 'Patel', '513-503-2311', 'MP1@Gmail.com', 1, 0),
('YP101', 66666, 'Yajendra', 'Zala', '513-707-9588', 'YZ@Gmail.com', 1, 0),
('AS101', 77777, 'Anjali', 'Shah', '513-201-0088', 'AS@Gmail.com', 1, 0),
('HS101', 88888, 'Hiten', 'Shah', '513-405-9181', 'HS@Gmail.com', 0, 1),
('JP101', 99999, 'Jay', 'Patel', '513-555-6018', 'JP@Gmail.com', 1, 0),
('MP301', 12121, 'Maulik', 'Patel', '513-885-2016', 'MP2@Gmail.com', 1, 0)
SET IDENTITY_INSERT [user] off
;



SET IDENTITY_INSERT vendor ON
insert into Vendor Values (code, name, address, city, state, zip, phone, email)
('BB-1001', 'Best Buy', '100 Best Buy Street', 'Louisville', 'KY', '40207', '502-111-9099', 'geeksquad@bestbuy.com'),
('AP-1001', 'Apple Inc', '1 Infinite Loop', 'Cupertino', 'CA', '95014', '800-123-4567', 'genius@apple.com'),
('AM-1001', 'Amazon', '410 Terry Ave. North', 'Seattle', 'WA', '98109','206-266-1000', 'amazon@amazon.com'),
('ST-1001', 'Staples', '9550 Mason Montgomery Rd', 'Mason', 'OH', '45040', '513-754-0235', 'support@orders.staples.com'),
('MC-1001', 'Micro Center', '11755 Mosteller Rd', 'Sharonville', 'OH', '45241', '513-782-8500', 'support@microcenter.com'),
SET IDENTITY_INSERT vendor Off;

SET IDENTITY_INSERT vendor ON
insert into Product Values (vendorId, partnumber, productname, price, unit, photopath)
(1, 'ME280LL', 'Ipad Mini 2', 296.99, Null, Null),
(3, '105810', 'Hammermill Paper Premium Multi-Purpose Paper Poly Wrap', 8.99, '1 Ream / 500 Sheets', Null),
(4, '122374', 'HammerMill® Copy Plus Copy Paper 8 1/2\" x 11\" Case', 29.99, '1 Case, 10 Reams, 500 Sheets per ream', NULL),
(4, '784551', 'Logitech M325 Wireless Optical Mouse, Ambidextrous Black', 14.99, NULL, NULL),
(4, '382955', 'Staples Mouse Pad, Black', 2.99, NULL, NULL),
(4, '2122178','AOC 24-Inch Class LED Monitor', 99.99, NULL, NULL),
(4, '2460649', 'Laptop HP Notebook 15-AY163NR', 529.99, NULL, NULL),
(4, '2256788', 'Laptop Dell i3552-3240BLK 15.6\"', 239.99, NULL, NULL),
(4, 'IM12M9520', 'Laptop Acer Acer™ Aspire One Cloudbook 14\"', 224.99, NULL, NULL),
(4, '940600', 'Canon imageCLASS Copier (D530)', 99.99, NULL, NULL),
(5, '228148', 'Acer Aspire ATC-780A-UR12 Desktop Computer', 399.99, NULL, NULL),
(5, '289771', 'IPhone 11', 699.99, NULL, NULL),
(2, '291173', 'Macbook Pro', 1050.99, NULL, NULL),
(2, '322765', 'Apple Wireless Mouse', 129.99, NULL, NULL),
(1, '279364', 'Anker Powerline+ II Lightning Cable ', 11.99, NULL, NULL),
(1, '876776', 'Anker Docking Station, PowerExpand 13-in-1 USB-C Dock', 129.59, NULL, NULL),
(1, '876676', 'Anker 4-in-1 Wireless Charging Station', 74.99, NULL, NULL),
(5, '200123', 'Fitbit Charge 4 Fitness and Activity Tracker with Built-in GPS', 99.95, NULL, NULL),
(4, '267622', 'Fire TV Stick Lite with Alexa Voice Remote Lite', 24.99, NULL, NULL),
(3, '567M23', 'iBayam Journal Planner Pens Colored Pens Fine Point Markers', 6.78, NULL, NULL),
(5, '6544S1', 'NexiGo Upgraded PS5 Controller Charger with Thumb Grip Kit', 25.49, '2 pack', NULL),
(3, '434421', 'Iphone X 164GB', 1099.00, null, NULL)

SET IDENTITY_INSERT vendor ON




	--DROP USER IF EXISTS prs_user@localhost;
   -- Create User prs_user@localhost identified by 'sesame';
    --grant select, insert, delete, update on Prsdb.* to prs_user@localhost;



