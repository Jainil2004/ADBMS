-- ADBMS lab 3 (23/1/24)

-- question 1
create table supplier(scode varchar(5), sname varchar(255), scity varchar(255) , turnover INT);
create table part(pscode varchar(5), weigh int ,color varchar(20), cost int, sellingprice int);
create table supplier_part(scode varchar(5), pcode varchar(5), qty int);

-- question 2
INSERT INTO supplier VALUES
('S0001', 'Supplier1', 'Bombay', 50),
('S0002', 'Supplier2', 'London', 20),
('S0003', 'Supplier3', 'Sydney', 30),
('S0004', 'Supplier4', 'Toronto', 40),
('S0005', 'Supplier5', 'Paris', 60),
('S0006', 'Supplier6', 'Berlin', 70),
('S0007', 'Supplier7', 'Tokyo', 80),
('S0008', 'Supplier8', 'Beijing', 90),
('S0009', 'Supplier9', 'Bombay', 50),
('S0010', 'Supplier10', 'Cairo', 100);

INSERT INTO part VALUES('P0001', 10, 'Red', 100, 150),
('P0002', 20, 'Blue', 200, 250), --
('P0003', 30, 'Green', 150, 200),
('P0004', 40, 'Yellow', 180, 230),
('P0005', 50, 'Black', 210, 260), --
('P0006', 15, 'White', 170, 220),
('P0007', 25, 'Purple', 220, 270), --
('P0008', 35, 'Orange', 160, 210),
('P0009', 45, 'Pink', 190, 240),
('P0010', 50, 'Brown', 200, 250);

INSERT INTO supplier_part VALUES('S0001', 'P0001', 10),
('S0002', 'P0002', 20),
('S0003', 'P0003', 15),
('S0004', 'P0004', 18),
('S0005', 'P0005', 21),
('S0006', 'P0006', 17),
('S0007', 'P0007', 22),
('S0008', 'P0008', 16),
('S0009', 'P0009', 19),
('S0010', 'P0010', 20);

-- question 3 
-- c1
-- get the name of the supplier who operate from Bombay with turnover 50
select scode, pcode from supplier_part
order by scode;

-- c2
-- get the details of the supplier who operate from Bombay with turnover 50
insert into supplier value('S0011', 'Bombay', 50);
update supplier set turnover = 50 where scode = "S0009";
update supplier set scity = 'Bombay' where scode = "S0009";
select * from supplier where scity = 'Bombay' AND turnover = 50;
delete from supplier where scode in ('S0011', 'S0009');
select * from supplier;
insert into supplier value('S0011', 'Bombay', 50),
('S0009', 'Bombay', 50);

-- c3
-- get the total number of suppliers 
select COUNT(*) from supplier;

-- c4
-- get the part number weighing between 25 and 35
select * from part where weigh > 25 AND weigh < 35;

-- c5
-- get the supplier number whose turnover is null
insert into supplier value('S0011', 'Supplier11','Surat', null);
select * from supplier where turnover is NULL;

-- c6
-- get the part number that costs 20, 30 or 40 
update part set cost = 20 where pscode = 'P0002';
update part set cost = 30 where pscode = 'P0005';
update part set cost = 40 where pscode = 'P0007';
select * from part WHERE cost in (20, 30, 40);

-- c7
-- get the total quantity of part 2 that is supplied
select qty from supplier_part where pcode = 'P0002';

-- c8
-- get the name of the supplier who supply part 2
select sp.scode,
s.sname,
sp.pcode,
sp.qty
from supplier_part sp
INNER JOIN supplier s
on sp.scode = s.scode
where sp.pcode = 'P0002';

-- c9
-- get the part number whose cost is greater than the average cost
select * from part;
SELECT * FROM part
WHERE cost > (SELECT AVG(cost) FROM part);

-- c10
-- get the supplier number and turnover in descending order of turnover
select s.scode, turnover from supplier s 
ORDER BY s.turnover DESC;


-- TESTING
drop TABLE supplier;
drop TABLE part;
drop table supplier_part;
