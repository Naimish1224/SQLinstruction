-- create and select the database
DROP DATABASE IF EXISTS foodDb;
CREATE DATABASE foodDb;
USE foodDb;


Create table Customer (
ID 				integer 			primary key auto_increment,
Customerno 		varchar(5) 			not null unique,
lastName 		varchar(255)		not null,
firstName 		varchar(255) 		not null,
Email		 	varchar(75) 		not null,
Phone	 		varchar(12) 		not null
)
;

Create table Category (
ID 				integer 			primary key auto_increment,
Name	 		varchar(100)		not null unique



);



Create table Menu (
ID 			integer 			primary key auto_increment,
Name	 	varchar(75) 		not null,
Categoryid 	integer			 	not null,
price		decimal(10,2)		not null,
calories	integer				not null,

foreign key (categoryid) references category(id),
CONSTRAINT uMenuItem unique (categoryid, name)
);



Create table ticket (
ID 				 integer 				primary key auto_increment,
Customerid 		 integer				not null,
orderdate		 timestamp				not null,
status			 varchar(1)				not null,
Total			 decimal(10,2)			not null,

foreign key (customerid) references customer(id),
CONSTRAINT cust_dt unique (customerid, orderdate)



);

create table lineItem (
ID 				 integer 			primary key auto_increment,
Ticketid 		 integer			not null,
Menuid			 integer			not null,
Quantity		 varchar(255)		not null,
Total			 decimal			not null,

    
    Foreign Key (TicketID) references ticket(ID),
Foreign Key (MenuID) references menu(ID),
CONSTRAINT tkt_mid unique (ticketID, MenuID)

);

insert into Category (Name) Values
	('Appetizers'),
	('Salad'),
	('Entrees'),
	('Sides'),
	('Drinks'),
	('Desserts');
    
    DROP USER IF EXISTS fooddb_user@localhost;
    Create User fooddb_user@localhost identified by 'sesame';
    grant select, insert, delete, update on fooddb.* to fooddb_user@localhost;
    



