--Problem statement 
--List the emps in the asc order of Designations of those joined after the second half of 1981. done
SELECT empno,
       ename, 
	   job, 
	   hiredate
FROM emp
WHERE hiredate > '1981-06-30' 
AND date_part('year', hiredate) = 1981
ORDER BY job ASC;

--What is the average tenure of employees in the company? done
SELECT
    AVG(EXTRACT(YEAR FROM AGE(exitdate, hiredate))) 
	AS avg_tenure, Job
FROM emp
GROUP by job

--Salary trend for employees identifying as clerk. done
SELECT job, 
       sal, 
       hiredate
FROM  emp
WHERE job = 'CLERK'
ORDER BY hiredate asc


--4.What is the worth in dollars will the company incur for each job if there is 15% sal increase. done	  
SELECT 
    job, 
	sum(sal) AS sal_expense,
CAST
   (SUBSTRING(('$' || SUM(cost_increase)), 2) AS float) AS Increase
FROM (Select ename, job, sal, (1.15*sal) AS cost_increase
    FROM emp) AS game
GROUP BY job;

--List the emps along with their Exp and Daily Sal is more than #50. done
SELECT 
   empno,
   sal,
   sal/30 daily
FROM emp
WHERE (sal/30) > 50;




