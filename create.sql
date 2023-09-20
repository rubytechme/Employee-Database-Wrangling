Create table Deptno (
  Deptno Int Primary key,
  Dname Varchar (50) NOT NULL,
  Loc Varchar (50) NOT NULL
);


Insert into Deptno (Deptno,Dname,Loc)
VALUES
('10','ACCOUNTING','NEWYORK'),
('20','RESEARCH','DALLAS'),
('30','SALES','CHICAGO'),
('40','OPERATIONS','BOSTON');


Create table Emp ( 
 Empno INT primary key,
 Ename varchar (50) NOT NULL,
 Job Varchar (50) NOT NULL,
 Hiredate DATE,
 Mgr INT NOT NULL,
 time_stamp date DEFAULT CURRENT_DATE,
 Sal FLOAT (50) NOT NULL,
 Comm FLOAT (50) NOT NULL,
 Exitdate DATE,
 Deptno int references Deptno (Deptno)
);
  
  
INSERT into Emp (Empno,Ename,Job,Mgr,Hiredate,Sal,Comm,Exitdate,DeptNo)
VALUES
 ('7369', 'SMITH','CLERK','7902', '17-Dec-80','800', '30', '12-Dec-84','20'),
 ('7499','ALLEN','SALESMAN','7698', '20-Feb-81','1600','300','10-Dec-88','30'),
 ('7521','WARD','SALESMAN','7698', '22-Feb-81','1250','500','12-Jan-86','30'),
 ('7566','JONES','MANAGER','7839', '02-Apr-81','2975','459.4','7-Feb-88','20'),
 ('7654','MARTIN','SALESMAN','7698', '28-Sep-81','1250','1400','12-Dec-84','30'),
 ('7698','BLAKE','MANAGER','7839', '01-May-81','2850','459','1-May-86','30'),
 ('7782','CLARK','MANAGER','7839', '09-JUN-81','2450','67','22-Aug-85','10'),
 ('7788','SCOTT','ANALYST','7566', '09-Dec-82','3000','67','23-Sep-88','20'),
 ('7839','KING','PRESIDENT','5686','17-Nov-81','5000','76','25-Oct-86','10'),
 ('7844','TURNER','SALESMAN','7698', '08-Sep-81','1500','0','28-Oct-89','30'),
 ('7876','ADAMS','CLERK','7788', '12-Jan-83','1100','67','12-Dec-90','20'),
 ('7900','JAMES','CLERK','7698', '03-Dec-81','950','65','17-Mar-85','30'),
 ('7902','FORD','ANALYST','7566', '03-Dec-81','3000','54','31-Dec-84','20'),
 ('7934','MILLAR','CLERK','7782', '23-Jan-82','1300','67','29-Jul-83','10');
		








   

