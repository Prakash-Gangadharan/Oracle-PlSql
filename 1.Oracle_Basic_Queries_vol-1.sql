-- connect SYSTEM/gangaindra

-- Create table

CREATE TABLE emp (
  empno number(3) PRIMARY KEY,
  ename varchar2(7),
  doj date,
  job varchar2(9),
  sal number(7, 2),
  comm number(7, 2),
  mgrid number(3),
  deptno number(2),
  CONSTRAINT fk_mgrid FOREIGN KEY (mgrid) REFERENCES emp (empno)
);

CREATE TABLE emp (
  empno number(3),
  ename varchar2(7),
  doj date,
  job varchar2(9),
  sal number(7, 2),
  comm number(7, 2),
  mgrid number(3),
  deptno number(2)
);

-- Insert 

INSERT INTO emp VALUES (111, 'Robert', to_date('2005/19/11', 'yyyy/DD/mm'), 'MD', 50000, NULL, NULL, 10);
INSERT INTO emp VALUES (112, 'Arun', to_date('15/10/2006', 'DD/mm/yyyy'), 'Manager', 25000, NULL, 111, 20);
INSERT INTO emp VALUES (113, 'kumar', to_date('10/05/2007', 'DD/mm/yyyy'), 'Sales Man', 6000, 1000, 112, 20);
INSERT INTO emp VALUES (114, 'Raj', to_date('14/03/2006', 'DD/mm/yyyy'), 'Clerk', 20000, NULL, 111, 10);
INSERT INTO emp VALUES (115, 'Sathish', to_date('05/05/2008', 'DD/mm/yyyy'), 'Sales Man', 8000, 2000, 112, 20);
INSERT INTO emp VALUES (116, 'Ravi', to_date('10/05/2009', 'DD/mm/yyyy'), 'Sales Man', 7000, 1000, 112, 20);
INSERT INTO emp VALUES (117, 'Rakesh', to_date('10/05/2009', 'DD/mm/yyyy'), 'Sales Man', NULL, NULL, NULL, 20);


INSERT INTO emp VALUES (111, 'Robert', to_date('19/11/2005', 'DD/mm/yyyy'), 'MD', 50000, NULL, NULL, 10);
INSERT INTO emp VALUES (112, 'Arun', to_date('15/10/2006', 'DD/mm/yyyy'), 'Manager', 25000, NULL, 111, 20);
INSERT INTO emp VALUES (113, 'kumar', to_date('10/05/2007', 'DD/mm/yyyy'), 'Sales Man', 6000, 1000, 112, 20);
INSERT INTO emp VALUES (114, 'Raj', to_date('14/03/2006', 'DD/mm/yyyy'), 'Clerk', 20000, NULL, 111, 10);
INSERT INTO emp VALUES (115, 'Sathish', to_date('05/05/2008', 'DD/mm/yyyy'), 'Sales Man', 8000, 2000, 112, 20);

-- Create table

CREATE TABLE emp2 (
  empno number(3) PRIMARY KEY,
  ename varchar2(7),
  doj date,
  job varchar2(9),
  sal number(7, 2),
  comm number(7, 2),
  mgrid number(3),
  deptno number(2),
  CONSTRAINT fk_emp2_mgrid FOREIGN KEY (mgrid) REFERENCES emp2 (empno)
);

-- Insert 

INSERT INTO emp2 VALUES (111, 'Robert', to_date('19/11/2005', 'DD/mm/yyyy'), 'MD', 50000, NULL, NULL, 10);
INSERT INTO emp2 VALUES (112, 'Arun', to_date('15/10/2006', 'DD/mm/yyyy'), 'Manager', 25000, NULL, 111, 20);
INSERT INTO emp2 VALUES (113, 'kumar', to_date('10/05/2007', 'DD/mm/yyyy'), 'Sales Man', 6000, 1000, 112, 20);
INSERT INTO emp2 VALUES (115, 'Ravi', to_date('10/05/2009', 'DD/mm/yyyy'), 'Sales Man', 7000, 1000, 112, 20);

INSERT INTO emp VALUES (111, 'Robert', to_date('19/11/2005', 'DD/mm/yyyy'), 'MD', 50000, NULL, NULL, 10);
INSERT INTO emp VALUES (112, 'Arun', to_date('15/10/2006', 'DD/mm/yyyy'), 'Manager', 25000, NULL, 111, 20);
INSERT INTO emp VALUES (113, 'kumar', to_date('10/05/2007', 'DD/mm/yyyy'), 'Sales Man', 6000, 1000, 112, 20);
INSERT INTO emp VALUES (114, 'Raj', to_date('14/03/2006', 'DD/mm/yyyy'), 'Clerk', 20000, NULL, 111, 10);
INSERT INTO emp VALUES (115, 'Sathish', to_date('05/05/2008', 'DD/mm/yyyy'), 'Sales Man', 8000, 2000, 112, 20);

INSERT INTO emp VALUES (116, 'Rajesh', to_date('14/03/2008', 'DD/mm/yyyy'), 'Clerk', 22000, NULL, 111, 10);

-- dept table

CREATE TABLE dept (
  deptno number(2) PRIMARY KEY,
  dname varchar2(9),
  locid number(2)
);

INSERT INTO dept VALUES (10, 'Account', 1);
INSERT INTO dept VALUES (20, 'Sales', 2);
INSERT INTO dept VALUES (30, 'Purchase', 3);

-- location table 

CREATE TABLE location (
  locid number(2) PRIMARY KEY,
  loc varchar2(9)
);


INSERT INTO location VALUES (1, 'Chennai');
INSERT INTO location VALUES (2, 'Mumbai');
INSERT INTO location VALUES (3, 'Delhi');

-- dept1 table

CREATE TABLE dept1 (
  deptno number(2) PRIMARY KEY,
  dname varchar2(9),
  locid number(2)
);

INSERT INTO dept1 VALUES (10, 'Account', 1);
INSERT INTO dept1 VALUES (20, 'Sales', 3);
INSERT INTO dept1 VALUES (30, 'Purchase', 2);

-- table dept

CREATE TABLE dept (
  deptno number(2) PRIMARY KEY,
  dname varchar2(9),
  locid number(2),
  FOREIGN KEY (deptno) REFERENCES emp (deptno)
);

INSERT INTO dept VALUES (10, 'Account');
INSERT INTO dept VALUES (20, 'Sales');

-- 

/*
alter table emp modify(ename varchar2(7), job varchar2(9));
alter table emp modify(sal number(7,2), comm number(7,2));
alter table dept modify(locid number(2));
*/
-- insert 

INSERT INTO emp VALUES (111, 'Robert', to_date('19/11/2005', 'DD/mm/yyyy'), 'MD', 50000, NULL, NULL, 10);
INSERT INTO emp VALUES (112, 'Arun', to_date('15/10/2006', 'DD/mm/yyyy'), 'Manager', 25000, NULL, 111, 20);
INSERT INTO emp VALUES (113, 'kumar', to_date('10/05/2007', 'DD/mm/yyyy'), 'Sales Man', 6000, 1000, 112, 20);
INSERT INTO emp VALUES (114, 'Raj', to_date('14/03/2006', 'DD/mm/yyyy'), 'Clerk', 20000, NULL, 111, 10);
INSERT INTO emp VALUES (115, 'Sathish', to_date('05/05/2008', 'DD/mm/yyyy'), 'Sales Man', 8000, 2000, 112, 20);

-- update
/*
UPDATE emp SET sal = 20000 WHERE empno = 114;
UPDATE dept SET locid = 1 WHERE deptno = 10;
UPDATE dept SET locid = 2 WHERE deptno = 20;

*/
-- Address Table
CREATE sequence addr_seq start WITH 10;

CREATE TABLE address (
  address_id number(5) primary key,
  address_line1 varchar2(25) not null,
  address_line2 varchar2(20),
  city varchar2(15) not null,
  state varchar2(15) not null,
  pincode number(6) not null
);

-- Customer Table

CREATE sequence cust_seq start WITH 1000;

CREATE TABLE customer(
  customer_id number(11),
  name varchar2(50),
  address_id number(11),
  PRIMARY KEY(customer_id),
  FOREIGN KEY(address_id) REFERENCES address(address_id)
);

-- Order Table

CREATE sequence order_seq start WITH 100;

CREATE TABLE order_tbl (
  order_id number(5), 
  order_date date, 
  customer_id number(5), 
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);





-- select query

SELECT * FROM emp;

SELECT empno, ename, sal FROM emp;

SELECT deptno FROM emp;

SELECT DISTINCT deptno FROM emp;

SELECT ename, sal, 12*sal+100 FROM   emp;

SELECT ename, sal, 12*(sal+100) FROM   emp;

SELECT ename, job, sal, comm FROM   emp;

SELECT ename, 12*sal+comm FROM   emp;

SELECT ename AS name FROM emp;

SELECT comm commission FROM emp;

SELECT ename "Name" , sal*12 "Annual Salary" FROM emp;

SELECT ename||' - '||job AS "Employees" FROM 	emp;

SELECT  ename||' is '||job Employees  FROM emp;



SELECT ename|| q'['s Manager Id: ]'|| mgrid AS "Name and Manager Id" FROM emp;
'

SELECT empno, ename, job, deptno FROM emp WHERE deptno = 10 ;

SELECT ename, job, deptno FROM emp WHERE ename = 'Raj' ;

SELECT ename, sal FROM emp WHERE sal <= 10000 ;

SELECT ename, sal FROM emp WHERE sal BETWEEN 6000 AND 25000 ;

SELECT empno, ename, sal, mgrid FROM emp WHERE empno IN (111,113,114);

SELECT empno, ename, sal, mgrid FROM emp WHERE empno IN (111,113,114,131);

SELECT	ename, job FROM emp WHERE job LIKE 'S%' ;
 
SELECT ename, job FROM emp WHERE job LIKE '_a%' ;

SELECT ename, mgrid FROM emp WHERE mgrid IS NULL ;

SELECT empno, ename, job, sal FROM emp WHERE sal >=7000 AND job LIKE '%Man%' ;

SELECT empno, ename, job, sal FROM emp WHERE sal > 25000 OR job LIKE '%Man%' ;

SELECT ename, job FROM emp WHERE job NOT IN ('Manager','Clerk') ;

SELECT ename, job, sal FROM emp WHERE job = 'Manager' OR job = 'MD' AND sal > 25000;

SELECT ename, job, sal FROM emp WHERE (job = 'Manager' OR job = 'MD') AND sal> 25000;

SELECT ename, job, deptno, doj FROM emp ORDER BY doj;

SELECT ename, job, sal FROM emp ORDER BY sal ;

SELECT ename, job, sal FROM emp ORDER BY sal desc;

SELECT empno, ename, sal*12 ANNUALSALARY FROM emp ORDER BY ANNUALSALARY;

SELECT ename, deptno, sal FROM emp ORDER BY deptno, sal DESC;

SELECT empno, ename, sal FROM emp ORDER BY empno, sal DESC;

SELECT empno, ename, sal, deptno FROM emp WHERE empno = &employee_num;

SELECT empno, ename, sal, deptno FROM emp WHERE ename = '&employee_name';
--

SELECT empno, ename, job, &column_name FROM   emp WHERE  &condition ORDER BY &order_column ;

SELECT   empno, ename, job, &&column_name  FROM     emp ORDER BY &column_name ;

SELECT   empno, ename, job, &column_name  FROM     emp ORDER BY &order_column ; newone

SELECT &column_name  FROM  emp ; newone

DEFINE emp_num = 112
SELECT empno, ename, sal, deptno FROM emp WHERE  empno = &emp_num ;
UNDEFINE emp_num

SELECT empno, ename, deptno FROM emp WHERE  ename = 'Kumar';

SELECT empno, ename, deptno FROM emp WHERE LOWER(ename) = LOWER('Kumar');


SELECT RPAD(sal,10,'*')	FROM  emp;

SELECT empno, CONCAT(ename, job) NAME, LENGTH (ename), 
INSTR(ename, 'a') "Contains 'a'?" FROM  emp WHERE SUBSTR(job, 7) = 'Man';

SELECT INSTR('saravanan', 'a') Position FROM  dual;

SELECT ROUND(2000.923,2), ROUND(2000.923,0), ROUND(2000.923,-1) FROM   DUAL;

SELECT TRUNC(2000.923,2), TRUNC(2000.923,0), TRUNC(2000.923,-1) FROM   DUAL;

SELECT ename, sal, MOD(sal, 6000) FROM   emp WHERE  job = 'MD';

SELECT ename, doj FROM emp WHERE doj < '01-FEB-07';
/*
-- 
*/

