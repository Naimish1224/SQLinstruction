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
    (9, 1, 'Pizza', 13.99, 1400),
    (10, 4, 'Garlic Bread', 5.99, 500),
    (11, 6, 'Cheese Cake', 9.99, 1200),
    (12, 6, 'Smores', 8.99, 1400),
    (13, 6, 'Ice Cream', 6.99, 800),
    (14, 5, 'Margarita', 7.00, 200),
    (15, 5, 'Beer', 5.99, 150),
    (16, 5, 'Sangria', 10.99, 200),
    (17, 5, 'Wine', 7.99, 100),
    (18, 3, 'Pasta', 10.50, 550),
    (19, 3, 'Enchiladas', 11.99, 900),
    (20, 5, 'Water', 0.00, 0),
    (21, 4, 'Mac and cheese', 4.00, 150);
    
    insert into Customer Values   
    (1, 'NP101', 'Nick', 'Patel', 'np@gmail.com', '513-405-8070'),
    (2, 'MP101', 'Mansi', 'Patel', 'mp@gmail.com', '513-448-9588'),
    (3, 'GP101', 'Gunvant', 'Patel', 'gp@gmail.com', '937-763-1421'),
    (4, 'AP101', 'Anjana', 'Patel', 'ap@gmail.com', '513-554-0195'),
    (5, 'HP101', 'Maahi', 'Patel', 'mp2@gmail.com', '513-405-8071');
    
    
    insert into Ticket (id, customerid) values 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
    
    insert into lineitem (ticketid, menuid, quantity) values
    (1, 9, 2),
    (1, 4, 2),
    (1, 5, 1),
    (2, 3, 1),
    (2, 1, 4),
    (2, 6, 3),
    (3, 8, 1),
    (4, 2, 4),
    (4, 5, 1),
    (5, 8, 1),
    (5, 2, 3),
    (5, 5, 5);
    
    -- upate the total with update query

update lineitem
set total = 27.98 where id = 1;

update lineitem
set total = 23.92 where id = 2;

update lineitem
set total = 11.99 where id = 3;

update lineitem
set total = 7.99 where id = 4;

update lineitem
set total = 35.96 where id = 5;

update lineitem
set total = 14.97 where id = 6;

update lineitem
set total = 28.99 where id = 7;

update lineitem
set total = 23.96 where id = 8;

update lineitem
set total = 11.99 where id = 9;

update lineitem
set total = 28.99 where id = 10;

update lineitem
set total = 23.96 where id = 11;

update lineitem
set total = 59.95 where id = 12;

    

    
    
    
    
    
    
    
    
    DROP USER IF EXISTS fooddb_user@localhost;
    Create User fooddb_user@localhost identified by 'sesame';
    grant select, insert, delete, update on fooddb.* to fooddb_user@localhost;
    



