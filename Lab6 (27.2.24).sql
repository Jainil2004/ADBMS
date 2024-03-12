-- ADBMS lab 6 (27.2.24)

-- question 1
-- create table of table name: Employees and add 6 rows

create table employee_6(employee_id char(10), first_name CHAR(30) not NULL, last_name CHAR(30) not NULL, DOB date, salary int(25) not NULL, department_id char(10));

-- data
INSERT INTO employee_6 (employee_id, first_name, last_name, DOB, salary, department_id) VALUES
('E001', 'Jainil', 'Jain', '2004-08-27', 50000, 'D01'),
('E002', 'Ayush', 'Jain', '1996-10-20', 6000000, 'D02'),
('E003', 'Bob', 'Johnson', '1990-03-03', 70000, 'D03'),
('E004', 'Alice', 'Williams', '1995-04-04', 80000, 'D04'),
('E005', 'Charlie', 'Brown', '2000-05-05', 90000, 'D05'),
('E006', 'Emily', 'Davis', '2005-06-06', 100000, 'D06');

-- question 2.1
-- create view of name emp_view and the column would be employee_id, last_name, salary, and department_id only

create view emp_view as (
    select 
    employee_id,
    last_name,
    salary,
    department_id
    from employee_6
);

-- question 2.2
-- insert values into view(remove the NOT NULL constrait and then insert values)
-- first removing the not null contraint from the last_name (Lab neelu mam)
alter table employee_6
add primary key (employee_id);

ALTER table employee_6
MODIFY last_name CHAR(30) null;

insert into employee_6 (employee_id, first_name, last_name, DOB, salary, department_id) VALUES
('E007', 'ballu', 'singh', '2004-06-16', 125132, 'D01');

-- question 2.3
-- modify, delete, drop operations are performed on view

alter table employee_6
modify last_name CHAR(30) NOT NULL;

alter table employee_6
drop COLUMN last_name;

delete from employee_6
where employee_id = 'E007';

-- question 2.4
-- create a view named salary_view. the view shows the employees in department 'D02' and their annual salary

create view salary_view AS (
    select employee_id,
    first_name,
    salary
    from employee_6
    where department_id = 'D02'
)