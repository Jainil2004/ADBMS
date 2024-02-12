CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'HR'),
(4, 'IT');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Doe', 2),
(3, 'Jim', 'Brown', 3),
(4, 'Jill', 'Smith', 4);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Product A', 50.00),
(2, 'Product B', 75.00),
(3, 'Product C', 100.00),
(4, 'Product D', 125.00);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    OrderDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Orders (OrderID, EmployeeID, OrderDate) VALUES
(1, 1, '2020-01-01'),
(2, 2, '2020-02-01'),
(3, 3, '2020-03-01'),
(4, 4, '2020-04-01');

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 10),
(2, 2, 2, 20),
(3, 3, 3, 30),
(4, 4, 4, 40);


-- solutions
-- write the query here

-- Q1
select * 
from employees;

-- Q2
SELECT *
from departments;

-- Q3
select * 
from orders;

-- Q4
select 
e.EmployeeID as EMPID,
e.FirstName as EMPNAME,
d.DepartmentName as DEPTNAME
from employees e 
join departments d 
on e.DepartmentID = d.DepartmentID;

-- Q5
select 
e.EmployeeID as EMPID, 
e.FirstName as ENAME, 
o.OrderID as ORDERID, 
o.OrderDate as DATEOFORDER 
from orders o 
join employees e 
ON o.EmployeeID = e.EmployeeID;

-- Q6
select 
e.FirstName as CUSTNAME,
o.OrderID as ORDERID
from orders o 
join employees e 
on o.EmployeeID = e.EmployeeID;

-- Q7
select *
from products
where Price > 50;

-- Q8
select * 
from employees
where DepartmentID = (select DepartmentID from departments where DepartmentName = 'Sales');

-- Q9
select 
e.EmployeeID as EMPID,
d.DepartmentName AS DEPT,
o.OrderID as ORDERID,
o.OrderDate as ORDERDATE
from Orders o
JOIN employees e
on o.EmployeeID = e.EmployeeID
JOIN Departments d
on e.DepartmentID = d.DepartmentID
where e.EmployeeID = 1;

-- Q10
-- original solution
select *
from Orders
where EmployeeID NOT IN (select EmployeeID from employees);

-- correct solution
select *
from Employees
where EmployeeID NOT IN (select EmployeeID from Orders);

-- Q11
insert into employees(EmployeeID, FirstName, DepartmentID)
VALUES (5, "emp1", 2), (6, "emp2", 2), (7, "emp3", 1),
(8, "emp4", 3), (9, "emp5", 3), (10, "emp6", 2);

select 
DepartmentID,
count(*) as EMPS
from employees
GROUP BY DepartmentID
ORDER BY EMPS DESC
limit 1;

-- better approach
SELECT DepartmentID, COUNT(*) as NumOfEmployees
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) = (
    SELECT MAX(NumOfEmployees)
    FROM (
        SELECT COUNT(*) as NumOfEmployees
        FROM Employees
        GROUP BY DepartmentID
    ) as subquery
);

-- Q12
insert into Orders(OrderID, EmployeeID, OrderDate) 
VALUES (5, 1, "2019-05-01");

select 
EmployeeID,
count(*) as ORDERSPLACED
from Orders
GROUP BY EmployeeID
ORDER BY ORDERSPLACED DESC
limit 1;

-- Q13
select *
from orders
where OrderDate >= '2020-01-01' AND OrderDate < '2021-01-01';

-- experimentation
select count(*) as ordersin2020
from orders
where OrderDate >= '2020-01-01' AND OrderDate < '2021-01-01';

-- Q14
insert into products(ProductID, ProductName, Price)
VALUES(5, "product E", 65);

select products.ProductID,
products.ProductName,
products.Price,
'FALSE' as ORDERED
from products
where ProductID not in (select ProductID from OrderDetails);

-- Q15
select 
o.EmployeeID,
count(*) as 'ORDERSPLACED'
from Orders o
GROUP BY EmployeeID
HAVING count(*) > 10; -- change value to 1 if you want to see the result

-- Q16
select 
d.DepartmentID,
d.DepartmentName,
count(*) as TOTALORDERSPLACED
from Orders o
JOIN employees e
ON o.EmployeeID = e.EmployeeID
JOIN departments d
on e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID
ORDER BY TOTALORDERSPLACED DESC
limit 1;
-- you did it all by yourself be PROUD

-- Q17
SELECT OrderID
FROM OrderDetails
GROUP BY OrderID
HAVING COUNT(DISTINCT ProductID) > 3;

-- Q18
select 
o.OrderID,
e.EmployeeID,
e.FirstName,
od.ProductID,
od.Quantity,
p.Price,
(od.Quantity * p.price) as TotalOrderValue
from OrderDetails od
join orders o
on od.OrderID = o.OrderID
join Products p
on od.ProductID = p.ProductID
join employees e
on o.EmployeeID = e.EmployeeID
HAVING TotalOrderValue > 1000;

-- correct
SELECT e.EmployeeID, e.FirstName, SUM(p.Price * od.Quantity) as TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY e.EmployeeID, e.FirstName
HAVING SUM(p.Price * od.Quantity) > 1000;

-- Q19
select 
p.ProductID,
p.ProductName,
Quantity as units_sold
from OrderDetails od
join products p 
on od.ProductID = p.ProductID
ORDER BY Quantity DESC
limit 1;

-- correct
SELECT p.ProductID, p.ProductName, COUNT(DISTINCT o.OrderID) as NumberOfOrders
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductID, p.ProductName
ORDER BY NumberOfOrders DESC
LIMIT 1;

-- Q20
select 
e.EmployeeID,
e.FirstName,
p.ProductID,
p.ProductName,
Quantity as units_sold
from OrderDetails od
join products p 
on od.ProductID = p.ProductID
join orders o
on o.OrderID = od.OrderID
join employees e
ON e.EmployeeID = o.EmployeeID
ORDER BY Quantity DESC
limit 1;

-- correct
SELECT e.EmployeeID, e.FirstName
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE od.ProductID = (
    SELECT p.ProductID
    FROM Products p
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    GROUP BY p.ProductID
    ORDER BY COUNT(DISTINCT o.OrderID) DESC
    LIMIT 1
);

-- testing 
show tables;
select *
from Orders;
