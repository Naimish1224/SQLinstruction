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
Categoryid 	integer		 		not null,
name 		varchar(255)		not null,
price		decimal(10,2)		not null,
calories	integer				not null,

foreign key (categoryid) references category(id),
CONSTRAINT uMenuItem unique (categoryid, name)
);



Create table ticket (
ID 				 integer 				primary key auto_increment,
Customerid 		 integer				not null,
orderdate		 timestamp				not null default current_timestamp,
status			 varchar(1)				not null default 'O',
Total			 decimal(10,2)			not null default '0',

foreign key (customerid) references customer(id),
CONSTRAINT cust_dt unique (customerid, orderdate)



);

create table lineItem (
ID 				 integer 			primary key auto_increment,
Ticketid 		 integer			not null,
Menuid			 integer			not null,
Quantity		 varchar(255)		not null,
Total			 decimal			not null default '0',

    
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
    
    insert into Menu Values
	(1, 1, 'Cheese Sticks', 8.99, 800),
	(2, 1, 'Fried Pickles', 5.99, 600),
    (3, 1, 'Bread Sticks', 7.99, 850),
    (4, 1, 'Patato Skins', 11.99, 1200),
    (5, 1, 'Nachos', 11.99, 1200),
    (6, 2, 'House Salad', 4.99, 400),
    (7, 2, 'Ceasar Salad', 6.99, 600),
    (8, 3, 'Filet Mignon', 28.99, 1100),
    (9, 1, 'Pizza', 13.99, 1400);
    
    insert into Customer Values   
    (1, 'NP101', 'Nick', 'Patel', 'np@gmail.com', '513-405-8070');
    
    
    insert into Ticket (id, customerid) values 
    (1, 1);
    
    insert into lineitem (ticketid, menuid, quantity) values
    (1, 9, 2),
    (1, 4, 2),
    (1, 7, 1);
    

    
    
    
    
    
    
    
    
    DROP USER IF EXISTS fooddb_user@localhost;
    Create User fooddb_user@localhost identified by 'sesame';
    grant select, insert, delete, update on fooddb.* to fooddb_user@localhost;
    



