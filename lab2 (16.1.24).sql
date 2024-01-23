-- ADBMS Lab 2 (16/1/2024)

-- question 1
create table CLIENT_MASTER_1(CLIENTNO varchar(6) PRIMARY KEY CHECK (CLIENTNO LIKE 'C%'),
 NAME varchar(20) not NULL, 
 ADDRESS1 varchar(30), 
 ADDRESS2 varchar(30), 
 CITY varchar(15), 
 PINCODE int(8), 
 STATE varchar(15), 
 BALDUE decimal(10,2));

create table PRODUCT_MASTER_1(PRODUCTNO varchar(6) PRIMARY KEY CHECK (PRODUCTNO LIKE 'P%'), 
DESCRIPTION varchar(15) not NULL, 
PROFITPERCENT decimal(4,2) not NULL, 
UNITMEASURE varchar(10) not NULL, 
QTYONHAND integer not NULL, 
REORDERL_VL integer not NULL, 
SELLPRICE decimal(8,2) not NULL, 
COSTPRICE decimal(8,2) not NULL);

create table SALESMAN_MASTER_1(SALESMANNO varchar(6) PRIMARY KEY CHECK (SALESMANNO LIKE 'S%'), 
SALESMANNAME varchar(20) not NULL, 
ADDRESS1 varchar(30) not NULL, 
ADDRESS2 varchar(30), 
CITY varchar(20), 
PINCODE integer, 
STATE varchar(20), 
SALAMT real not NULL CHECK (SALAMT > 0), 
TGTTOGET decimal not NULL CHECK (TGTTOGET > 0),
YTDSALES double(6,2) not NULL, 
REMARKS varchar(60));

drop table CLIENT_MASTER_1;
drop table PRODUCT_MASTER_1;
drop table SALESMAN_MASTER_1;
show tables;
drop table salesman_master;
DESCRIBE CLIENT_MASTER_1;

-- question 1 ends

-- question 2
insert into product_master_1 VALUES("P00001", "T-shirt", 5, "Piece", 200, 50, 350, 250),
("P0345", "Shirts", 6, "Piece", 150, 50, 500, 350),
("P06734", "Cotton jeans", 5, "Piece", 100, 20, 600, 450),
("P07865", "Jeans", 5, "Piece", 100, 20, 750, 500),
("P07868", "Trousers",2 , "piece",150 ,50 ,850 ,550),
("P07885", "Pull Overs",2.5 , "piece",80 ,30 ,700 ,450),
("P07965", "Denim jeans",4 , "piece",100 ,40 ,350 ,250),
("P07975", "Lycra tops",5 , "piece",70 ,30 ,300 ,175),
("P08865", "Skirts",5 , "piece",75 ,30 ,450 ,300);

INSERT into SALESMAN_MASTER_1 VALUES
("S00001", "Aman", "A/14","Worli", "Mumbai",400002 , "Maharashtra", 500,1000,0,null),
("S00002", "Omkar", "65","Nariman", "Mumbai",400001 , "Maharashtra",600,1000,0,null),
("S00003", "Raj", "P-7","Bandra", "Mumbai",400032 , "Maharashtra",700,1000,0,null),

-- question 2 ends

-- question 3
-- display the contents of each table
select * from CLIENT_MASTER_1;
select * from product_master_1;
select * from SALESMAN_MASTER_1;

-- question 3 ends

-- question 4
-- create table author
create table author(author_id varchar(5) primary key,
lastname varchar(15) not NULL,
firstname varchar(15) not NULL,
email varchar(40),
city varchar(15),
country varchar(15));

-- question 4 ends

-- question 5 
-- create table book 
create table book(book_id VARCHAR(5) primary key CHECK (book_id like 'B%'),
book_title varchar(255) not NULL,
copies integer CHECK (copies > 2));

-- question 5 ends

-- question 6
-- create table author_list
CREATE TABLE AUTHOR_LIST (
Author_ID varchar(5),
Book_ID varchar(5),
Role varchar(15),
PRIMARY KEY (Author_ID, Book_ID),
FOREIGN KEY (Author_ID) REFERENCES AUTHOR(author_id));

-- question 6 ends

-- question 7
-- insert any 4 entries in the newly made tables
INSERT INTO author VALUES('A0001', 'Smith', 'John', 'johnsmith@email.com', 'New York', 'USA'),
('A0002', 'Johnson', 'Emily', 'emilyjohnson@email.com', 'London', 'UK'),
('A0003', 'Williams', 'David', 'davidwilliams@email.com', 'Sydney', 'Australia'),
('A0004', 'Brown', 'Sarah', 'sarahbrown@email.com', 'Toronto', 'Canada');

INSERT INTO book VALUES('B0001', 'The Great Gatsby', 5),
('B0002', 'To Kill a Mockingbird', 10),
('B0003', '1984', 7),
('B0004', 'The Catcher in the Rye', 3);

INSERT INTO AUTHOR_LIST VALUES('A0001', 'B0001', 'Author'),
('A0002', 'B0002', 'Co-Author'),
('A0003', 'B0003', 'Author'),
('A0004', 'B0004', 'Co-Author');

-- question 7 ends

-- questin 8
-- alter structure of table author_list. add the field publisher data type of 30 characters
ALTER TABLE AUTHOR_LIST
ADD Publisher varchar(30);

-- question 8 ends 

-- completion of ADBMS lab 2 (16/1/24)
