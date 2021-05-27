-- create and select the database
DROP DATABASE IF EXISTS schoolDb;
CREATE DATABASE schoolDb;
USE schoolDb;

-- create Movie table
-- DROP TABLE IF EXISTS Movie;
Create table Student (
ID 			integer 		primary key auto_increment,
Firstname 		varchar(255) 	not null unique,
Lastname 		varchar(255)		not null,
Email 		varchar(255) 		not null,
Dob 	varchar(255) 	not null,
Ssn 		integer 		not null,
Ph 		integer 		not null
-- CONSTRAINT utitle unique (Title)
);

-- create Actor table
-- DROP TABLE IF EXISTS Actor;
Create table Studentenrollment (
ID 			integer 		primary key auto_increment,
Studentid 	integer 	not null,
Courseid 	integer 	not null,
Foreign Key (Studentid) references Student(ID),
Foreign Key (Courseid) references Course(ID));


-- create Credits table
-- business rule - combo of actor+movie must be unique
Create table Course (
ID 				integer 			primary key auto_increment,
Subject 		varchar(255)			not null,
CourseName		 varchar(255)			not null

);

-- Add some movies
 insert into Student VALUES
 	(1, 'Bob', 'Ross', 'bob@gmail.com', '1987-8-2', 444332222, 5132221111),
    (2, 'Jim', 'Carter', 'Jim@gmail.com', '1989-9-1', 555332222, 5132220000),
    (1, 'Bob', 'Ross', 'bob@gmail.com', '1987-8-2', 444332222, 5132221111)
 	(;
    
    
-- Add some actors
 insert into Actor VALUES
 	(1, 'Robert', 'Downey Jr.', 'M', '1965-4-4'),
 	(2, 'Chris', 'Hemsworth', 'M', '1983-09-11'),
    (3, 'Scarlett', 'Johansson', 'F', '1984-11-22'),
 	(4, 'Robert', 'Carradine', 'M', '1954-3-24'),
 	(5, 'Anthony', 'Edwards', 'M', '1962-7-19'),
    (6, 'Russell', 'Crowe', 'M', '1964-4-7'),
    (7, 'Arnold', 'Schwarzenegger', 'M', '1947-7-30'),
    (8, 'Michael', 'Biehn', 'M', '1956-7-30'),
    (9, 'Connie', 'Nelson', 'F', '1965-7-3'),
    (10, 'Gerard', 'Butler', 'M', '1969-11-13'),
    (11, 'David', 'Wenham', 'M', '1965-9-21');
    
    
    -- Add movie credits for actors
 insert into Credit (ActorID, MovieID, Role) VALUES
 
 	(1, 2, 'Iron Man'),
    (2, 2, 'Thor'),
    (3, 2, 'Natasha Romanoff - Black Widow'),
    (4, 1, 'Lewis'),
    (5, 1, 'Gilbert'),
    (7, 4, 'Terminator'),
    (6, 3, 'Maximus'),
    (8, 4, 'Kyle Reese'),
    (9, 3, 'Lucilla'),
    (10, 5, 'King Leonidas'),
    (11, 5, 'Dilios');
    
    
    
    
    
    
    

    
    
    
    


-- create a user and grant privileges to that user
DROP USER IF EXISTS bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;
