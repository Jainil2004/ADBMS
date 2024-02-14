-- ADBMS lab 5 (13/2/24)

-- question 1
-- list the deptno where there are no employees

insert into dept(DEPTNO, DNAME, LOC) values
(50, "HR", "Mumbai");

select 
d.DEPTNO,
count(e.EMPNO) as TOTALEMPS
from emp e
RIGHT JOIN dept d
on e.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO
HAVING TOTALEMPS = 0;

-- question 2
-- list the no. of emps and avergae salary withing each department for each job

-- select 
-- DEPTNO,
-- JOB,
-- count(*) as TOTALEMPS
-- from emp
-- GROUP BY DEPTNO, JOB;

select 
DEPTNO,
JOB,
count(JOB) as TOTALEMPS,
AVG(SAL) as AVGSAL
from emp
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

-- question 3
-- find the maximum avergae salary drawn for each job except for 'president'
select 
JOB, 
count(JOB) as TOTALEMPS, 
AVG(SAL) as AVGSAL 
from emp
where JOB != 'PRESIDENT' 
GROUP BY JOB;

-- question 4
-- list the department details where at least two emps are working
select
d.DEPTNO,
d.DNAME,
d.LOC,
count(e.DEPTNO) as EMPWORKING
from dept d
join emp e
on d.DEPTNO = e.DEPTNO
GROUP BY d.DEPTNO;
HAVING EMPWORKING > 2;

-- question 5
-- list the no. of emps in each department where the no. is more than 3
select
d.DEPTNO,
count(e.DEPTNO) as EMPWORKING
from dept d
join emp e
on d.DEPTNO = e.DEPTNO
GROUP BY d.DEPTNO
having EMPWORKING > 3;

-- question 6
-- list the nmes of the emps who are getting the highest sal dept wise
select
d.DNAME,
e.*
from emp e
join dept d
on e.DEPTNO = d.DEPTNO
where SAL in (select MAX(SAL) from emp GROUP BY DEPTNO);

sub-query
SAL in (select MAX(SAL) from emp GROUP BY DEPTNO)

-- question 7
-- list the deptno and their average salaries for dept 
-- with the average salary less than the averages for deparments
-- SELECT 
-- e.DEPTNO, 
-- AVG(e.SAL) as AVERAGESALARY
-- FROM emp e
-- GROUP BY e.DEPTNO
-- HAVING AVERAGESALARY < (SELECT AVG(SAL) FROM emp);

-- correct
SELECT deptno, AVG(SAL) AS dept_avg_salary
FROM emp
GROUP BY DEPTNO
HAVING AVG(SAL) < (
    SELECT AVG(dept_avg_salary)
    FROM (
        SELECT DEPTNO, AVG(SAL) AS dept_avg_salary
        FROM emp
        GROUP BY DEPTNO
    ) AS dept_avg_salaries
);

-- further modifications : LEARN A LESSON
SELECT deptno, AVG(SAL) AS dept_avg_salary
FROM emp
GROUP BY DEPTNO
HAVING AVG(SAL) < ( 
    AVG(SELECT AVG(SAL) AS dept_avg_salary FROM emp GROUP BY DEPTNO)
);

-- YOU CANNOT APPLY THE AVG FUNCTION TO A SUBQUERY DIRECTLY IDIOT AND HENCE THE ABOVE COMMAND IS WRONG

