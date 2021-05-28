-- create and select the database
DROP DATABASE IF EXISTS PRSdb ;
CREATE DATABASE PRSdb;
USE PRSdb;


Create table User (
ID 						integer 			primary key auto_increment,
Username 				varchar(20) 		not null unique,
Password 				varchar(20)			not null,
Firstname 				varchar(20) 		not null,
Lastname				varchar(20) 		not null,
Phone					varchar(12)			not null,
Email	 				varchar(75) 		not null,
Reviewer				bit					not null,
Admin					bit					not null);

Create table Vendor (
ID 						integer 			primary key auto_increment,
Code 					varchar(10) 		not null unique,
Name					varchar(255)		not null,
Address 				varchar(255) 		not null,
City					varchar(255) 		not null,
State	 				varchar(2) 			not null,
Zip						varchar(5)			not null,
Phone					varchar(12)			not null,
email 					varchar(100)		not null);

Create table Request (
ID 						integer 			primary key auto_increment,
UserId 					Integer 			not null,
Description 			varchar(255)		not null,
Justification 			varchar(255) 		not null,
Dateneeded				date		 		not null,
Deliverymode	 		varchar(25) 		not null,
Status					Varchar(20)			not null,
Total					Decimal (10,2)		not null,
Submitdate				Datetime			not null,
ReasonforRejection 		varchar(100)				,

foreign key (UserID) references User(id));



Create table Product (
ID 						integer 			primary key auto_increment,
VendorID 				integer 			not null unique,
PartNumber				varchar(50)			not null,
ProductName 			varchar(150) 		not null,
Price					Decimal(10,2) 		not null,
Unit	 				varchar(255) 				,
Photopath				varchar(255)				,

CONSTRAINT vendor_part unique (VendorID, Partnumber),
foreign key (VendorID) references Vendor(id));

Create table LineItem (
ID 						integer 			primary key auto_increment,
RequestID 				integer 			not null,
ProductID 				integer 					,
Quantity 				integer  					,

CONSTRAINT req_pdt unique (RequestID, ProductID),
foreign key (ProductId) references Product(Id),
foreign key (RequestId) references Request(Id));



