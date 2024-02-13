-- ADBMS lab 4 (6/2/24)

-- question 1
CREATE TABLE dept(
  DEPTNO INT primary key,
  DNAME varchar(40),
  LOC varchar(100)
);

CREATE TABLE emp(
  EMPNO INT, 
  ENAME varchar(20), 
  JOB varchar(20), 
  MGR int, 
  HIREDATE date, 
  SAL int, 
  COMM int, 
  DEPTNO int, 
  PRIMARY KEY(EMPNO), 
  FOREIGN KEY (DEPTNO) REFERENCES dept(DEPTNO) 
);

'1990-01-01'

-- question 2
insert into dept(DEPTNO, DNAME, LOC) values 
(10, "ACCOUNTING", "NEW YORK"), 
(20, "RESEARCH", "DALLAS"), 
(30, "SALES", "CHICAGO"), 
(40, "OPERATIONS", "BOSTON");

INSERT INTO emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES 
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, 500, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);

-- question 3
-- c1
-- List the details of the emps whose Salaries more than the employee BLAKE.
select * from emp
where SAL > (select SAL from emp where ENAME = "BLAKE"); 

-- c2
-- List the emps whose Jobs are same as ALLEN.
select * from emp
where JOB = (select JOB from emp where ENAME = "ALLEN");

-- c3
-- List the Emps whose Sal is same as FORD or SMITH in desc order of Names.
select * from EMP
where SAL in (select SAL from emp where ENAME in ("FORD", "SMITH"))
ORDER BY ENAME DESC;

-- c4
-- List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
select * from emp
where JOB = (select JOB from emp where ENAME = "MILLER")
or SAL = (select SAL from emp where ENAME = "ALLEN"); 

-- c5
-- Find the highest paid employee of sales department.
select * from emp 
where DEPTNO = 30 
ORDER BY SAL DESC 
LIMIT 1; 

-- c6
-- List the employees who are senior to most recently hired employee working under king.
SELECT e1.* 
FROM emp e1
WHERE e1.HIREDATE < (
  SELECT MAX(e2.HIREDATE) 
  FROM emp e2 
  WHERE e2.MGR = (
    SELECT e3.EMPNO 
    FROM emp e3 
    WHERE e3.ENAME = 'KING' 
  ) 
); 

-- c7
-- List the names of the emps who are getting the highest sal dept wise.
SELECT e1.ENAME, e1.DEPTNO, e1.SAL
FROM emp e1
WHERE e1.SAL IN (
  SELECT MAX(e2.SAL)
  FROM emp e2
  WHERE e1.DEPTNO = e2.DEPTNO
  GROUP BY e2.DEPTNO
);

-- sub query
SELECT MAX(e2.SAL), e2.DEPTNO
  FROM emp e2
  -- WHERE e1.DEPTNO = e2.DEPTNO
  GROUP BY e2.DEPTNO;

--c8
-- list the emps whose sal is equal to the average of max and minimum
select *
from emp e1
where e1.sal = (
  select AVG(e2.SAL)
  from emp e2
);

-- correct 
SELECT *
FROM emp
WHERE SAL = (
  SELECT (MAX(SAL) + MIN(SAL)) / 2
  FROM emp
);

--c9
-- list the emps who joined in the company on the same date
select e1.ENAME, e1.HIREDATE, e2.ENAME, e2.HIREDATE 
from emp e1
join emp e2
ON e1.HIREDATE = e2.HIREDATE 
where e1.EMPNO != e2.EMPNO;

SELECT HIREDATE, GROUP_CONCAT(ENAME) as Employees
FROM emp
GROUP BY HIREDATE
HAVING COUNT(*) > 1;

--c10
-- find out the emps who joined in the company before their managers
SELECT e1.ENAME as Employee, e1.HIREDATE as EmployeeHireDate, e2.ENAME as Manager, e2.HIREDATE as ManagerHireDate
FROM emp e1
JOIN emp e2
ON e1.MGR = e2.EMPNO
WHERE e1.HIREDATE < e2.HIREDATE;



-- testing
show databases;
use adbms;
show tables;
drop table dept;
