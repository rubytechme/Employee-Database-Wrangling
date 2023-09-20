--EXPLORATORY DATA ANALYSIS 

--Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT
   empno, 
   ename, 
   job, 
   hiredate 
   FROM  emp
WHERE empno IN(SELECT mgr FROM emp)

--Extract the only month and year
SELECT 
   empno, 
   ename , 
   job, 
   hiredate,
EXTRACT(MONTH FROM hiredate) AS month_hired,
EXTRACT(YEAR FROM hiredate) AS year_hired
FROM emp 
WHERE empno IN (SELECT mgr FROM emp);


--Display all the details of the emps whose Comm. Is more than their Sal.
SELECT 
   * 
   FROM emp
WHERE comm > sal;

--List the emps who are joined in the month of Dec 1980.
SELECT 
   TO_CHAR(hiredate, 'MON'), 
   ename 
   FROM emp
WHERE date_part ('month', hiredate) = '12'
AND date_part('year', hiredate) = 1980

--Print the sal of employees if there is an increase of 15%
SELECT 
    SUM (sal) AS sal_expense, 
    SUM (cost_increase) AS Increase
FROM (Select ename, sal, (1.15*sal) AS cost_increase 
FROM emp) AS game;
	  
-- Produce the output of EMP table ‘EMP_AND_JOB’ for Ename and Job.
SELECT 
   ename|| job as "EMP_AND_JOB" 
   FROM emp ;

--Print a list of the employees based on salary 
SELECT
    empno,
	ename,
	sal|| 'JUST SALARY' AS sal 
    FROM emp WHERE sal > 1500 UNION
SELECT
    empno,
	ename, 
	sal|| 'ON TARGET' AS sal 
	FROM emp WHERE sal = 1500 UNION
SELECT 
    empno,
	ename, 
	sal|| 'BELOW 1500' AS sal 
	FROM emp where sal < 1500;

--print a list of the employees categorized with salary
SELECT 
   empno,
   ename,
   sal,
   job,
CASE
WHEN sal = 1500 THEN 'ON TARGET'
WHEN sal < 1500 THEN 'BELOW 1500'
WHEN sal > 1500 THEN 'JUST SALARY'
ELSE 'nothing'
END "REVISED SALARY"
FROM emp;     
 
--Find out all the emps who earn highest salary in each job type. Sort in descending salary order
SELECT 
   sal, 
   ename,
   Job 
FROM emp WHERE sal IN
   (SELECT max(sal) 
   FROM emp 
GROUP BY job)
ORDER BY sal desc;

--Find the maximum average salary drawn for each job except for President’
SELECT 
   game, 
   MAX(avg_salary) AS max_avg_salary
   FROM (SELECT ename, AVG(sal) AS avg_salary
   FROM emp
WHERE ename != 'President'
GROUP BY ename) AS game
GROUP BY game
ORDER BY max_avg_salary DESC;


--List the empno,ename,annsal,dailysal of all the salesmen in the asc annsal
SELECT
   e.empno ,
   e.ename,
   12*sal "ANN SAL", 
   (12*sal)/365 "DAILY SAL"
FROM emp AS e

--List the emps who joined in January.
SELECT 
   * 
   FROM emp
WHERE date_part('month', hiredate) = 1

--List the Ename and Sal if increased by 15% and expressed as no.of Dollars. 
SELECT 
    ename, 
	(sal), 
	('$'||1.15*sal) AS cost_increase 
FROM emp;

-- to show it as actual month name 
SELECT 
   TO_CHAR(hiredate, 'MON') 
   FROM emp
WHERE date_part('month', hiredate) = 1


--List all the emps who joined before or after 1981.
SELECT 
   ename, 
   empno, 
   hiredate
FROM emp
WHERE date_part ('month', hiredate) <> 1981


--List the emps whose Empno not starting with digit78.
SELECT 
   * 
   FROM emp
WHERE CAST (empno AS VARCHAR) NOT like '78%'


--List the emps who are working under ‘MGR’.
SELECT 
    e.ename || 'works for' || m.ename 
FROM emp AS e ,emp AS m 
WHERE e.mgr = m.empno ;


--Display the location of SMITH.
SELECT 
    e.deptno, 
	loc, 
	ename
FROM emp AS e INNER JOIN deptno AS d
ON e.deptno = d.deptno
WHERE ename = 'SMITH'


--List the emps of Deptno 30 or 10 joined in the year 1981.
SELECT 
   * 
   FROM emp
WHERE date_part ('Year', hiredate) = 1981 
AND deptno IN (30, 10)


--List the emps whose annual sal ranging from 23000 to 40000.
SELECT 
   * 
   FROM emp 
WHERE (12* sal) between 23000 AND 40000

--List the emps who have joined on the following dates 1 may 81,17 nov 81,30 dec 81
SELECT 
   * 
   FROM emp 
WHERE to_char(hiredate,'DD-MON-YY') IN
('01-MAY-81','17-NOV-81','30-DEC-81');

--List the details of most recently hired emp of dept 30.
SELECT 
   * 
   FROM emp
WHERE hiredate IN
   (SELECT MAX(hiredate) 
FROM emp 
WHERE deptno = 30);

--List the Enames those are starting with ‘S’ and with five characters.
SELECT
   ename 
FROM emp 
WHERE ename LIKE 'S%' AND LENGTH (ename) = 5

--List the emps whose Sal is four digit number ending with Zero.
SELECT 
   empno, 
   sal
FROM emp
WHERE CAST(sal AS VARCHAR) LIKE '%0'


--Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT
   empno,
   ename, 
   job, 
   hiredate 
FROM emp
WHERE empno IN(SELECT mgr FROM emp)


--Extract the only month and year
SELECT 
   empno, 
   ename , 
   job, 
   hiredate,
EXTRACT(MONTH FROM hiredate) AS month_hired,
EXTRACT(YEAR FROM hiredate) AS year_hired
FROM emp 
WHERE empno IN (SELECT mgr FROM emp);

--List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
SELECT
   empno,
   ename,
   sal,
   sal/30 daily, 
   12*sal annsal 
FROM emp
ORDER BY annsal ASC


