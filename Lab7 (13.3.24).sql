-- ADBMS Lab 7 (12.3.24)

-- question 1
-- create an index of name employees_idx on Employees with column last_name, department_id.

create index employees_idx
on employee_6 (last_name, department_id);

-- question 2
-- find the ROWID for the above table and create a unique index on employee_id column of the employees
select employee_id
from employee_6;

create unique index emp_id_index
on employee_6 (employee_id);

-- question 3
-- create a reverse index on employee_id column of the employee 
create index emp_id_rev
on employee_6 (employee_id DESC);

-- question 4
-- create a unique and composite index on emp_id and check whether there is duplicity of tuples or not 
create unique index emp_id_comp
on employee_6 (employee_id);

drop index emp_id_comp;

select employee_id, count(*)
from employee_6
GROUP BY employee_id
having count(*) > 1;

-- question 5
-- create function-based indexes defined on the SQL function UPPER(column_name) or LOWER(column_name) to facilitate 
-- case insensitive searches on column 'last_name'
-- a function based index is a index based on the result of a expression kinda like sub-queries 
-- it is not supported directly in the MySQL

create table employee_7 as select * from employee_6;

alter table employee_7
add column lower_last_name VARCHAR(255) as (lower(last_name));

create index emp_func_lower
on employee_7 (lower_last_name);

-- question 6
-- drop the function based index on column last_name
drop index emp_func_lower on employee_7;



-- test
show indexes from table_name