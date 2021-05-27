-- create and select the database
DROP DATABASE IF EXISTS foodDb;
CREATE DATABASE foodDb;
USE foodDb;


Create table Customer (
ID 				integer 			primary key auto_increment,
Customerno 		varchar(255) 		not null unique,
lastName 		varchar(255)		not null,
firstName 		varchar(255) 		not null,
Email		 	varchar(255) 				,
Phone	 		varchar(255) 		not null,

CONSTRAINT c_no unique (Customerno))
;

Create table Category (
ID 				integer 			primary key auto_increment,
Name	 		varchar(255)		not null unique,

CONSTRAINT No_n unique (name)


);



Create table Menu (
ID 			integer 			primary key auto_increment,
Name	 	varchar(255) 		not null,
Categoryid 	varchar(255) 		not null,
price		decimal				not null,
calories	integer				not null,

CONSTRAINT uMenuItem unique (categoryid, name)
);



Create table ticket (
ID 				 integer 				primary key auto_increment,
Customerid 		 varchar(255)			not null,
date			 date					not null,
Timestamp		 varchar(255)			not null,
status			 varchar(1)				not null,
Total			 decimal				not null,

CONSTRAINT cust_dt unique (customerid, date)



);

create table lineItem (
ID 				 integer 			primary key auto_increment,
Ticketid 		 integer			not null,
Menuid			 integer			not null,
Quantity		 varchar(255)		not null,
Total			 decimal			not null,

    
    Foreign Key (TicketID) references Category(ID),
Foreign Key (MenuID) references Category(ID),
CONSTRAINT tkt_mid unique (ticketID, MenuID)

);

