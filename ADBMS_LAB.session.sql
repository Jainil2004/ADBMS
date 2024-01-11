-- this is a comment bois 
-- ADBMS LAB 1 9/1/2024

-- question 1
create table CLIENT_MASTER(CLIENTNO varchar(6), NAME varchar(20), ADDRESS1 varchar(30), ADDRESS2 varchar(30), CITY varchar(15), PINCODE int, STATE varchar(15), BALDUE decimal(10,2));
create table PRODUCT_MASTER(PRODUCTNO varchar(6), DESCRIPTION varchar(15), PROFITPERCENT decimal(4,2), UNITMEASURE varchar(10), QTYONHAND integer, REORDERL_VL integer, SELLPRICE decimal(8,2), COSTPRICE decimal(8,2));
create table SALESMAN_MASTER(SALESMANNO varchar(6), SALESMANNAME varchar(20), ADDRESS1 varchar(30), ADDRESS2 varchar(30), CITY varchar(20), PINCODE integer, STATE varchar(20), SALAMT real, TGTTOGET decimal, YTDSALES double(6,2), REMARKS varchar(60));
-- question 1 ends

-- question 2


insert into product_master VALUES("P00001", "T-shirt", 5, "Piece", 200, 50, 350, 250),
("P0345", "Shirts", 6, "Piece", 150, 50, 500, 350),
("P06734", "Cotton jeans", 5, "Piece", 100, 20, 600, 450),
("P07865", "Jeans", 5, "Piece", 100, 20, 750, 500),
("P07868", "Trousers",2 , "piece",150 ,50 ,850 ,550),
("P07885", "Pull Overs",2.5 , "piece",80 ,30 ,700 ,450),
("P07965", "Denim jeans",4 , "piece",100 ,40 ,350 ,250),
("P07975", "Lycra tops",5 , "piece",70 ,30 ,300 ,175),
("P08865", "Skirts",5 , "piece",75 ,30 ,450 ,300);

INSERT into SALESMAN_MASTER VALUES
("S00001", "Aman", "A/14","Worli", "Mumbai",400002 , "Maharashtra", null,null,null,null),
("S00002", "Omkar", "65","Nariman", "Mumbai",400001 , "Maharashtra",null,null,null,null),
("S00003", "Raj", "P-7","Bandra", "Mumbai",400032 , "Maharashtra",null,null,null,null),
("S00004", "Ashish", "A/5","Juhu", "Mumbai",400044 , "Maharashtra",null,null,null,null);
-- question 2 ends 

-- question 3 
-- Exercise on retrieving records from a table
-- a. Find out the names of all the clients. 
SELECT NAME FROM CLIENT_MASTER;
-- b. Retrieve the entire contents of the Client_Master table. 
SELECT * FROM client_master;
-- c. Retrieve the list of names, city and the state of all the clients. 
SELECT NAME, CITY, STATE FROM client_master;
-- d. List the various products available from the Product_Master table. 
SELECT DESCRIPTION FROM product_master;
-- e. List all the clients who are located in Rajasthan. 
SELECT * FROM client_master WHERE STATE = "Rajasthan";
-- f. Find the names of salesman who have a salary equal to Rs.3000.
SELECT SALESMANNAME FORM FROM salesman_master WHERE SALAMT = 3000;
-- question 3 ends 

-- question 4
-- Exercise on updating records in table 
-- a. Change the city of ClientNo ‘C00005’ to ‘Bangalore’.
UPDATE CLIENT_MASTER SET CITY = "Bangalore" WHERE CLIENTNO = "C00005";
SELECT * FROM client_master WHERE CLIENTNO = "C00005"; 
-- b. Change the BalDue of ClientNo ‘C00001’ to Rs.1000.
UPDATE CLIENT_MASTER SET BALDUE = 1000 WHERE CLIENTNO = "C00001";
SELECT * FROM client_master WHERE CLIENTNO = "C00001";
-- c. Change the cost price of ‘Trousers’ to rs.950.00.
UPDATE PRODUCT_MASTER SET COSTPRICE = 950 WHERE DESCRIPTION = "Trousers";
SELECT * FROM product_master WHERE DESCRIPTION = "Trousers";
-- d. Change the city of the salesman to Pune.
UPDATE SALESMAN_MASTER SET CITY = "Pune";
SELECT * FROM salesman_master;
-- question 4 ends

-- question 5
-- Exercise on deleting records in a table 
-- a. Delete all salesman from the Salesman_Master whose salaries are equal to Rs.3500.
insert into SALESMAN_MASTER VALUES("S00005", "bunti", "a/5", "officer's Colony", "Mumbai", 400001, "Maharashtra", 3500, null, null, null);
SELECT * from salesman_master WHERE SALAMT = 3500;
Delete from Salesman_Master where SALAMT = 3500;
SELECT * from salesman_master WHERE SALAMT = 3500;
-- b. Delete all products from Product_Master where the quantity on hand is equal to 100.
SELECT * from product_master where QTYONHAND = 100;
delete from product_master where QTYONHAND = 100;
SELECT * from product_master where QTYONHAND = 100;
-- c. Delete from Client_Master where the column state holds the value ‘Tamil Nadu’.
insert into client_master VALUES("C00007", "Anna", null, null, "Chennai", 313001, "Tamil Nadu", 2000);
SELECT * FROM client_master where STATE = "Tamil Nadu";
delete from client_master where state = "Tamil Nadu";
SELECT * FROM client_master where STATE = "Tamil Nadu";
-- question 5 ends

-- question 6
-- a. Add a column called ‘Telephone’ of data type integer to the Client_Master table.
DESCRIBE client_master;
ALTER table client_master Add column Telephone int;
DESCRIBE client_master;
-- b. Change the size off SellPrice column in Product_Master to 10, 2.
DESCRIBE product_master;
alter table product_master MODIFY column SELLPRICE decimal(10, 2);
DESCRIBE product_master
-- question 6 ends

-- question 7 
-- exercise on deleting the table structure along with the data
-- a. destroy the table client_master along with its data.
show tables;
drop table client_master;
show tables;
-- question 7 ends

-- question 8
-- exercise on renaming the table
-- a. change the name of the table salesman_master to sman_mast
show tables;
RENAME table SALESMAN_MASTER to sman_mast;
show tables;
-- question 8 ends

-- COMPLETION OF ADBMS LAB 1 (9/1/2024) 




-- Database test commands (FOR TESTING PURPOSES ONLY)
-- DO NOT PERFORM DATA MANIPULATION IN THIS SESSION
-- FOR DATA MANIPULATION PLEASE USE POWERSHELL 
Select * FROM client_master;
DESCRIBE client_master;
DESCRIBE product_master;

Delete from product_master where PRODUCTNO = "P00001" OR PRODUCTNO = "P0345";
SELECT * FROM product_master;
DESCRIBE SALESMAN_MASTER;
SELECT * FROM SALESMAN_MASTER;