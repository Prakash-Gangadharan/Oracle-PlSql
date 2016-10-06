SELECT MONTHS_BETWEEN('01-JAN-98','11-MAR-99'), ADD_MONTHS ('11-JAN-98',6) from dual;
SELECT NEXT_DAY ('01-SEP-98','FRIDAY'), LAST_DAY ('01-FEB-98') from dual;
SELECT ROUND(SYSDATE,'MONTH'), ROUND(SYSDATE ,'YEAR') from dual;
SELECT TRUNC(SYSDATE ,'MONTH'), TRUNC(SYSDATE ,'YEAR') from dual;


SELECT ROUND(tO_DATE('16-MAY-13','DD-MON-YY'),'MONTH'), ROUND(tO_DATE('16-JUL-13','DD-MON-YY') ,'YEAR') from dual;


SELECT ename,  TO_CHAR(doj, 'DD Month YYYY') AS doj FROM emp;

SELECT ename,  TO_CHAR(doj, 'DD Month YYYY') AS doj, TO_CHAR(doj, 'DD') AS doj1, TO_CHAR(doj, 'Month') AS doj2, TO_CHAR(doj, 'YYYY') AS doj3, TO_CHAR(doj, 'YEAR') AS doj4 FROM emp;



SELECT ename, TO_CHAR(doj, '" hired on the day of "Ddspth MON YY') AS doj FROM emp;

SELECT TO_CHAR(sal, '$99,999.00') SALARY FROM  emp WHERE  ename = 'Raj';

UPDATE emp SET sal = sal + TO_NUMBER('100.00','9G999D99') WHERE ename = 'Raj';
					   
SELECT TO_DATE('January 15, 1989, 11:00 A.M.', 'Month dd, YYYY, HH:MI A.M.') FROM DUAL;

SELECT to_char(TO_DATE('January 15, 1989, 11:00 A.M.', 'Month dd, YYYY, HH:MI A.M.'),'Month dd, YYYY') FROM DUAL;

SELECT TO_TIMESTAMP ('10-Sep-02 14:10:10.123000', 'DD-Mon-RR HH24:MI:SS.FF') FROM DUAL;


SELECT TO_TIMESTAMP_TZ('1999-12-01 11:00:00 -8:00', 'YYYY-MM-DD HH:MI:SS TZH:TZM') FROM DUAL;

SELECT ename, UPPER(CONCAT('Mr ',SUBSTR(ename,1, 8))) FROM emp WHERE  deptno = 20;

SELECT ename, SUBSTR(ename,1, 5) SUBSTR1, CONCAT('Mr ',SUBSTR(ename,1, 5))CONCAT1, UPPER(CONCAT('Mr ',SUBSTR(ename,1, 5))) UPPER1 FROM emp WHERE  deptno = 20;

SELECT ename, sal, comm, NVL(comm, 0), (sal*12) + (12*comm) ANNUAL_SAL FROM emp;

SELECT ename, sal, comm, NVL(comm, 0), (sal*12) + (12*NVL(comm, 0)) ANNUAL_SAL FROM emp;

SELECT ename, sal, comm, NVL2(comm, sal+comm, sal) income
FROM   emp WHERE empno IN (111,114);

SELECT ename, LENGTH(ename) "expr1", job,  LENGTH(job)  "expr2",
NULLIF(LENGTH(ename), LENGTH(job)) result FROM   emp;

SELECT ename, LENGTH(ename) "expr1", job,  LENGTH(job)  "expr2",
NULLIF(LENGTH(job)) result FROM   emp;

SELECT nullif('ABCDEF', 'ABCDEF') EQUAL, nullif('ABCDEFGHIJKL', 'PQRSTUVWXYZ') DIFFERENT from dual;

SELECT ename, mgrid,comm, sal, COALESCE(mgrid, comm,sal,-1) comm1 FROM emp ORDER BY comm;

SELECT ename, sal,	job, CASE job WHEN 'MD' THEN 1.50*sal		
				WHEN 'Manager' THEN 1.40*sal		
				WHEN 'Clerk' THEN 1.30*sal					
				ELSE sal END "Revised Salary" FROM emp;
				
SELECT ename, sal,job, 	DECODE(job, 'MD', 1.50*sal, 'Manager',1.40*sal,                                           
'Clerk',1.30*sal, sal) "Revised Salary" FROM emp;

SELECT AVG(sal), MAX(sal), MIN(sal), SUM(sal) FROM   emp;

SELECT MIN(doj), MAX(doj) FROM emp;

SELECT COUNT(*) FROM emp;

SELECT COUNT(*) FROM emp WHERE deptno = 20;

SELECT COUNT(comm) FROM emp;

SELECT COUNT(DISTINCT deptno) FROM   emp;

SELECT AVG(comm) FROM   emp;

SELECT AVG(NVL(comm, 0)) FROM   emp;

SELECT NVL(comm, 0) FROM   emp;


SELECT SUM(sal), SUM(comm), SUM(sal+comm) FROM emp;

SELECT SUM(sal), SUM(comm), SUM(sal)+sum(nvl(comm,0)) FROM emp;

SELECT deptno, AVG(sal) FROM emp GROUP BY deptno ;

SELECT  AVG(sal) FROM emp GROUP BY deptno;

SELECT deptno, job, SUM(sal) FROM emp GROUP BY deptno, job;


insert into emp values(116,'Janani',to_date('10/05/2009','DD/mm/yyyy'),'Clerk',27000,null,111,10);

insert into emp values(117,'Karthi',to_date('10/05/2009','DD/mm/yyyy'),'Manager',37000,null,111,20);

SELECT deptno, COUNT(ename) FROM   emp;

SELECT COUNT(ename) FROM   emp;

SELECT deptno, COUNT(ename) FROM  emp GROUP BY deptno;

SELECT  deptno, AVG(sal) FROM  emp  WHERE AVG(sal) > 3000 GROUP BY deptno;

SELECT   deptno, MAX(sal) FROM emp GROUP BY deptno HAVING  MAX(sal)>26000;

SELECT   job, SUM(sal) FROM emp 
WHERE job LIKE '%Man'
GROUP BY job
HAVING   SUM(sal) > 10000 ORDER BY SUM(sal);

SELECT   job, SUM(sal) FROM emp 
WHERE job LIKE '%Man%'
GROUP BY job
HAVING   SUM(sal) > 10000 ORDER BY SUM(sal);

SELECT   MAX(AVG(sal)) FROM emp GROUP BY deptno;
SELECT   AVG(sal) FROM emp GROUP BY deptno;

SELECT deptno, job, SUM(sal) FROM emp WHERE deptno < 30 GROUP BY ROLLUP(deptno, job);

SELECT deptno, job, SUM(sal) FROM emp WHERE deptno < 30 GROUP BY CUBE (deptno, job) ;

SELECT   deptno DEPTNUMBER, job JOB, SUM(sal),
         GROUPING(deptno) GRP_DEPT,GROUPING(job) GRP_JOB
FROM emp WHERE deptno < 30 GROUP BY ROLLUP(deptno, job);

SELECT deptno, job, mgrid, avg(sal) FROM emp
GROUP BY GROUPING SETS ((deptno, job), (job, mgrid));

SELECT deptno, job, mgrid, SUM(sal) FROM emp GROUP BY ROLLUP( deptno,(job, mgrid));

SELECT deptno, job, mgrid, SUM(sal)
FROM  emp GROUP BY deptno, ROLLUP(job), CUBE(mgrid);


SELECT deptno FROM  emp GROUP BY deptno; new


SELECT deptno, job SUM(sal)
FROM  emp GROUP BY deptno, ROLLUP(job);






SELECT empno, ename, dname, deptno FROM emp NATURAL JOIN dept;

SELECT empno, ename, dname, dept.deptno FROM emp, dept WHERE emp.deptno=dept.deptno;


SELECT emp.empno, emp.ename, dept.dname, deptno FROM   emp JOIN dept USING (deptno);

SELECT e.empno, e.ename, d.dname, deptno FROM emp e JOIN dept d USING (deptno);

SELECT e.ename emp, m.ename mgr FROM emp e JOIN emp m ON (e.mgrid = m.empno);

SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname
FROM emp e JOIN dept d ON  (e.deptno=d.deptno);

SELECT e.ename emp, m.ename mgrid
FROM   emp e JOIN emp m ON (e.mgrid = m.empno);

SELECT e.ename||' is working for '|| m.ename 
FROM emp e, emp m  WHERE e.empno=m.mgrid;

SELECT e.ename||' is working for '|| m.ename 
FROM emp e, emp m  WHERE m.empno=e.mgrid;

SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname 
FROM emp e JOIN dept d ON  (e.deptno = d.deptno) AND e.mgrid =112 ;

SELECT empno, ename, dname, d.deptno, loc 
FROM emp e JOIN dept d ON d.deptno = e.deptno 
JOIN location l ON d.locid = l.locid;


10,00,000
1,000,000


SELECT e.empno, e.ename, d.deptno, d.dname FROM emp e, dept d WHERE e.deptno = d.deptno;

SELECT e.empno, e.ename, d.deptno, d.dname FROM emp e, dept d WHERE e.deptno(+) =  d.deptno;

SELECT e.ename, d.deptno, d.dname FROM emp e LEFT OUTER JOIN dept d ON(e.deptno = d.deptno);

SELECT e.ename, d.deptno, d.dname FROM emp e RIGHT OUTER JOIN dept d ON(e.deptno=d.deptno);

SELECT e.ename, d.deptno, d.dname FROM emp e RIGHT OUTER JOIN dept d ON(d.deptno=e.deptno);

SELECT e.ename, d.deptno, d.dname FROM emp e FULL OUTER JOIN dept d ON(e.deptno=d.deptno);

SELECT e.loc, d.deptno, d.dname FROM location e FULL OUTER JOIN dept d ON(e.locid=d.locid);

SELECT e.loc, d.deptno, d.dname FROM location e LEFT OUTER JOIN dept d ON(e.locid=d.locid);

SELECT e.loc, d.deptno, d.dname FROM location e RIGHT OUTER JOIN dept d ON(e.locid=d.locid);

SELECT ename, sal FROM   emp CROSS JOIN dept; 

SELECT ename, sal FROM emp 
UNION 
SELECT ename, sal FROM emp1;

SELECT ename, sal FROM emp 
UNION ALL 
SELECT ename, sal FROM emp1 
ORDER BY ename;

SELECT ename, sal FROM emp 
INTERSECT 
SELECT ename, sal FROM emp1;

SELECT ename, sal FROM emp 
MINUS 
SELECT ename, sal FROM emp1;

SELECT ename  FROM emp 
UNION 
SELECT ename FROM emp1 
MINUS 
SELECT ename FROM emp;

SELECT ename FROM emp 
UNION 
(SELECT ename FROM emp1
 MINUS 
SELECT ename FROM emp);

SELECT ename, sal FROM emp WHERE  sal >(SELECT sal FROM emp WHERE  ename = 'Arun');

SELECT ename, job, sal FROM emp WHERE job= (SELECT job FROM emp WHERE  empno = 115) 
AND sal >(SELECT sal  FROM  emp WHERE  empno = 113);

SELECT ename, job, sal FROM emp WHERE sal = (SELECT MIN(sal) FROM emp);

SELECT   deptno, min(sal) FROM emp GROUP BY deptno HAVING   MIN(sal) >
(SELECT MIN(sal) FROM   emp  WHERE  deptno = 20);

SELECT   deptno, min(sal) FROM emp GROUP BY deptno HAVING   MIN(sal) > 6000;


SELECT   deptno, min(sal) FROM emp GROUP BY deptno HAVING   MIN(sal) >
(SELECT MIN(sal) FROM   emp  WHERE  deptno = 30);

SELECT empno, ename FROM emp WHERE  sal = (SELECT MIN(sal) FROM emp GROUP BY deptno);

SELECT empno, ename, job, sal FROM emp WHERE sal<ANY (SELECT sal FROM emp WHERE job ='Sales Man');

SELECT empno, ename, job, sal FROM emp WHERE sal>ANY (SELECT sal FROM emp WHERE job ='Sales Man');

SELECT empno, ename, job, sal FROM emp WHERE sal>ALL (SELECT sal FROM emp WHERE job ='Sales Man');

SELECT empno, ename FROM emp WHERE empno NOT IN (SELECT mgrid FROM emp);

SELECT empno, ename FROM emp WHERE empno NOT IN (111,112);

SELECT empno, ename FROM emp WHERE empno NOT IN (111,112,null);

SELECT empno, ename, mgrid, deptno FROM emp WHERE  (mgrid, deptno) 
IN (SELECT mgrid, deptno FROM emp1 WHERE ename = 'Arun');

SELECT  empno, mgrid, deptno FROM emp WHERE   mgrid IN
(SELECT mgrid FROM emp WHERE ename = 'Arun')
AND deptno IN (SELECT deptno FROM emp WHERE ename = 'Arun');

SELECT empno, ename, (CASE  WHEN deptno = (SELECT deptno FROM dept WHERE locid = 1)
THEN 'Chennai' ELSE 'Mumbai' END) location FROM emp;

SELECT empno, ename, deptno, dname FROM emp e ORDER BY (SELECT dname FROM dept d WHERE e.deptno = d.deptno);

INSERT INTO dept(deptno, dname, locid) VALUES (40, 'Finance', 1);

INSERT INTO dept VALUES (50, 'Purchase', NULL);

INSERT INTO dept (deptno, dname) VALUES (60, 'Marketing');

INSERT INTO 
        (SELECT empno, ename, doj, job, sal, deptno
         FROM   emp WHERE  deptno = 10) 
VALUES (120, 'JOHNSON',TO_DATE('17-JAN-11','DD-MON-RR'),'CLERK', 5000, 10);

INSERT INTO emp (empno, ename, doj, job, sal, comm, mgrid, deptno)
VALUES (117, 'Devika', SYSDATE, 'Manager', 30000, NULL, 111, 20);

INSERT INTO emp 
VALUES  (118, 'Anu',  TO_DATE('NOV 21, 2010','MON DD, YYYY'),
'Clerk', 23000, NULL, 111,10);

INSERT INTO dept (deptno, dname, locid) VALUES (&deptno, '&dname', &locid);

create table employee(employee_number number(3) primary key,employee_name varchar2(7),salary number(7,2),deptno number(2));

INSERT INTO employee(employee_number, employee_name, salary)
SELECT empno, ename, sal FROM emp WHERE  job LIKE 'Sal%';

UPDATE dept SET deptno = 80 WHERE  dname = 'Support';

UPDATE dept SET locid = 1;

UPDATE emp SET job = (SELECT job FROM emp WHERE empno = 112), 
             sal = (SELECT sal FROM emp WHERE empno = 112) 
WHERE empno = 118;

]

DELETE FROM employee 
WHERE deptno =
(SELECT deptno FROM dept WHERE dname LIKE 'Sa%');

MERGE INTO employee e
	USING emp e1
	ON (e.employee_number = e1.empno)
WHEN MATCHED THEN
	UPDATE SET
		e.employee_name = e1.ename		
WHEN NOT MATCHED THEN
	INSERT VALUES(e1.empno, e1.ename, e1.sal, e1.deptno);

	
INSERT INTO dept1 VALUES(40,'Production',3);
SAVEPOINT S1;
INSERT INTO dept1 VALUES(50,'Marketing',3);
SAVEPOINT S2;
INSERT INTO dept1 values(60,'Finance',2);
ROLLBACK TO S2;

INSERT INTO dept1 values(60,'Finance',2);
COMMIT;



alter table employee add(deptno number(2));

INSERT INTO employee(employee_number, employee_name, salary)
SELECT empno, ename, sal FROM emp WHERE  job LIKE 'Sal%';

UPDATE dept SET deptno = 80 WHERE  dname = 'Support';

UPDATE dept SET locid = 1;

UPDATE emp SET job = (SELECT job FROM emp WHERE empno = 112), 
               sal = (SELECT sal FROM emp WHERE empno = 112) 
WHERE empno = 118;

UPDATE  employee SET   salary = (SELECT sal FROM emp WHERE empno = 115)
WHERE employee_name =
            (SELECT employee_name FROM employee WHERE employee_number = 113);

DELETE FROM dept WHERE  dname = 'Purchase';

DELETE FROM dept;

DELETE FROM employee WHERE deptno =
(SELECT deptno FROM dept WHERE dname LIKE 'Sa%');

MERGE INTO employee e
USING emp e1
ON (e.employee_number = e1.empno)
WHEN MATCHED THEN
UPDATE SET
e.employee_name = e1.ename		
WHEN NOT MATCHED THEN
INSERT VALUES(e1.empno, e1.ename, e1.sal, e1.deptno);

INSERT INTO dept1 VALUES(40,'Production',3,null);
SAVEPOINT S1;
INSERT INTO dept1 VALUES(50,'Marketing',3,null);
SAVEPOINT S2;
INSERT INTO dept1 values(60,'Finance',2,null);
ROLLBACK TO S2;

CREATE TABLE joineddates (id NUMBER(5), doj DATE DEFAULT SYSDATE);

INSERT INTO JOINEDDATES (ID) VALUES(2);

CREATE TABLE dept1 (deptno NUMBER(2), dname VARCHAR2(14),
                   locid VARCHAR2(13), create_date DATE DEFAULT SYSDATE);
				   
INSERT INTO dept1 (deptno, dname, locid) VALUES(40,'Production',2);
INSERT INTO dept1  VALUES(50,'Marketing',3);	

CREATE TABLE PRODUCT (product_id number CONSTRAINT product_id_nn NOT NULL, product_name varchar2(10));

INSERT INTO PRODUCT  (product_name) VALUES('Software');
INSERT INTO PRODUCT VALUES(123,'Software');
   
CREATE TABLE PRODUCT1(product_id number,product_name varchar2(10), CONSTRAINT product1_product_id_pk PRIMARY KEY(product_id));

INSERT INTO PRODUCT1 VALUES(1,'Software');
INSERT INTO PRODUCT1 VALUES(1,'Disk');

CREATE TABLE PRODUCT3 (product_id number UNIQUE, product_name varchar2(10));

INSERT INTO PRODUCT3 VALUES(1,'Software');
INSERT INTO PRODUCT3 (product_name) VALUES('Disk');

CREATE TABLE EMP3(EMPNO number, ename varchar2(10), sal number check(sal>5000));

INSERT INTO EMP3 values(1,'Raj',6000);
INSERT INTO EMP3 values(1,'Raj',4000);

CREATE TABLE PRODUCT4 (product_id number PRIMARY KEY,product_name varchar2(10));

INSERT INTO PRODUCT4 values(1,'Soap');
INSERT INTO PRODUCT4 values(1,'Watch');

CREATE TABLE EMP4(EMPNO number PRIMARY KEY, ename varchar2(10), mgrid number, 
CONSTRAINT EMP4_mgrid_fk FOREIGN KEY(mgrid) REFERENCES EMP4(EMPNO));

INSERT INTO EMP4 values(123,'Vinoth',null);

INSERT INTO EMP4 values(124,'Ashok',111);

INSERT INTO EMP4 values(124,'Ashok',123);

delete from emp4 where empno=123;

delete from emp4 where mgrid=123;

CREATE TABLE supplier(Supplier_id number(5) PRIMARY KEY, Supplier_name varchar2(20) not null);

CREATE TABLE products(product_id number(2) PRIMARY KEY, Supplier_id number(5), CONSTRAINT products_Supplier_id_fk
FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id));

CREATE TABLE products(product_id number(2) PRIMARY KEY, Supplier_id number(5), CONSTRAINT products_Supplier_id_fk
FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id) ON DELETE CASCADE);


insert into supplier values(11111,'aaa');

insert into products values(11,11111);
delete from supplier where supplier_id=11111;

CREATE TABLE supplier1(Supplier_id number(5) PRIMARY KEY, Supplier_name varchar2(20) not null);

CREATE TABLE products1(product_id number(2) PRIMARY KEY, Supplier_id number(5), CONSTRAINT products_Supplier1_id_fk1
FOREIGN KEY(supplier_id) REFERENCES supplier1(supplier_id) ON DELETE SET NULL);

CREATE TABLE products1(product_id number(2) PRIMARY KEY, Supplier_id number(5), CONSTRAINT products_Supplier1_id_fk1
FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id) ON DELETE SET NULL);

insert into supplier1 values(11111,'aaa');

insert into products1 values(11,11111);
 delete from supplier1 where supplier_id=11111;

CREATE TABLE emp5 AS     
SELECT  empno, ename, sal*12 ANNSAL FROM  emp  WHERE   deptno = 10;

TRUNCATE TABLE emp5;

DROP TABLE emp5;

ALTER TABLE emp5
ADD (job VARCHAR2(10));

ALTER TABLE emp5
MODIFY (ename VARCHAR2(5));

ALTER TABLE emp5
MODIFY (ename VARCHAR2(8));

ALTER TABLE emp5
MODIFY (ename VARCHAR2(6));

ALTER TABLE  emp5 DROP COLUMN  ANNSAL,ENAME; 
ALTER TABLE  emp5 DROP(job,ENAME);

ALTER TABLE  emp5 DROP COLUMN  job; 

ALTER TABLE  emp5 DROP(ANNSAL,ENAME);

ALTER TABLE EMP5 ADD CONSTRAINT emp5_empno_nc NOT NULL(empno); /* please check */

ALTER TABLE EMP5 MODIFY EMPNO PRIMARY KEY;

ALTER TABLE EMP3 MODIFY EMPNO PRIMARY KEY;

ALTER TABLE EMP5 DROP PRIMARY KEY;

DROP TABLE EMP4 PURGE;

DROP TABLE EMP4;

/* flashback-recycle bin */

FLASHBACK TABLE EMP4 TO BEFORE DROP;

SELECT original_name, operation, droptime FROM recyclebin;
SELECT original_name, operation, droptime FROM recyclebin where original_name='EMP5';

select * from emp;

CREATE VIEW empview20 AS SELECT  empno, ename, sal FROM emp WHERE   deptno = 20;

DESCRIBE empview20;

SELECT object_name, object_type from USER_OBJECTS;

CREATE VIEW salaryview20
 AS SELECT  empno EMPLOYEENUMBER, ename NAME, sal*12 ANNUAL_SALARY
    FROM    emp WHERE   deptno = 20;

SELECT * FROM   salaryview20;

SELECT view_name, text from USER_VIEWS;

CREATE OR REPLACE VIEW empview20
  (employeeno, employeename, salary, departmentno)
AS SELECT  empno, ename, sal, deptno FROM emp
   WHERE deptno = 20;

CREATE OR REPLACE VIEW dept_sum_vu (name, minsal, maxsal, avgsal)
AS SELECT d.dname, MIN(e.sal), MAX(e.sal),AVG(e.sal)
   FROM emp e JOIN dept d ON (e.deptno = d.deptno) GROUP BY d.dname;
   
CREATE OR REPLACE VIEW empview10
AS SELECT * FROM emp WHERE deptno = 10
   WITH CHECK OPTION CONSTRAINT empview10_ck ;  
   
insert into empview10(empno,deptno) values(130,20);
insert into empview10(empno,deptno) values(130,10);
   
CREATE OR REPLACE VIEW empview1 (employee_number, employee_name, job_title)
AS SELECT empno, ename, job FROM emp
   WHERE deptno = 10 WITH READ ONLY;
 
insert into empview1(employee_number) values(131);

CREATE SEQUENCE dept1_deptno_seq
                INCREMENT BY 10
                START WITH 50
                MAXVALUE 100
                NOCACHE
                NOCYCLE;

INSERT INTO dept1(deptno, dname, locid) VALUES  (dept1_deptno_seq.NEXTVAL, 'Support', 1);				
				
select dept1_deptno_seq.CURRVAL  from dual;
select dept1_deptno_seq.NEXTVAL  from dual;

ALTER SEQUENCE dept1_deptno_seq
               INCREMENT BY 20
               MAXVALUE 1000
               NOCACHE
               NOCYCLE;
			   
DROP SEQUENCE dept1_deptno_seq;

CREATE INDEX  emp_ename_idx ON emp(ename);
SELECT index_name, table_name  FROM   USER_INDEXES WHERE  table_name = 'EMP';

CREATE TABLE empnew (empno NUMBER(6) PRIMARY KEY USING INDEX
            (CREATE INDEX empno_idx ON empnew(empno)), ename VARCHAR2(25));
			
SELECT index_name, table_name  FROM   USER_INDEXES WHERE  table_name = 'EMPNEW';

CREATE INDEX upper_dept_name_idx  ON dept (UPPER(dname));
SELECT index_name, table_name  FROM   USER_INDEXES WHERE  table_name = 'DEPT';

SELECT * FROM   dept WHERE  UPPER(dname) = 'SALES';

DROP INDEX upper_dept_name_idx;

CREATE SYNONYM  loc  FOR  location;

SELECT * FROM LOC;

DROP SYNONYM LOC;

FLASHBACK TABLE location TO BEFORE DROP;

RENAME emp3 TO emp9;

select * from emp3;
 
select * from emp9;

COMMENT ON TABLE emp is 'EMPLOYEE TABLE';
COMMENT ON COLUMN emp.job IS 'abbreviated job title';

COMMENT ON TABLE emp is ' '; 
COMMENT ON COLUMN emp.job IS ' ';

select * from USER_TAB_COMMENTS;
select * from USER_COLUMN_COMMENTS;

select * from USER_TAB_COMMENTS where table_name='EMP';
select * from USER_COLUMN_COMMENTS WHERE COLUMN_NAME='JOB';

CREATE USER  JOSEPH1 IDENTIFIED BY GUEST
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp;

SELECT * FROM DBA_USERS;

GRANT create session, create table, create sequence, create view
TO  JOSEPH1;
GRANT create session 
TO public;

GRANT create session 
TO JOSEPH;

GRANT create session 
TO JOSEPH 
WITH  ADMIN OPTION;

CREATE TABLE NIVEDHA(ID NUMBER);

SELECT *
FROM dictionary
WHERE table_name = 'USER_OBJECTS';

SELECT object_name, object_type, created, status	
FROM user_objects 
ORDER BY object_type;

SELECT table_name	FROM   user_tables;

SELECT column_name, data_type, data_length, data_precision, data_scale, nullable
FROM   user_tab_columns WHERE  table_name = 'EMP';

SELECT constraint_name, constraint_type, search_condition, r_constraint_name, delete_rule, status FROM   user_constraints WHERE  table_name = 'EMP';

SELECT constraint_name, column_name FROM user_cons_columns WHERE  table_name = 'EMP';

SELECT a.ename, a.sal, a.deptno, b.maxsal
FROM emp a, (SELECT deptno, max(sal) maxsal FROM emp GROUP BY deptno) b
WHERE a.deptno = b.deptno AND a.sal < b.maxsal;

SELECT ROWNUM as RANK, ename, sal
FROM (SELECT ename,sal FROM emp ORDER BY sal DESC)
WHERE ROWNUM <= 2;

SELECT ROWNUM as RANK, ename, sal
FROM (SELECT ename,sal FROM emp ORDER BY sal DESC)
WHERE ROWNUM <= 3;

SELECT ename, sal, deptno FROM emp outer
WHERE  sal > (SELECT MIN(sal) FROM emp WHERE  deptno = outer.deptno);

SELECT empno, ename, job, deptno FROM   emp outer
WHERE  EXISTS ( SELECT 'X' FROM emp WHERE mgrid = outer.empno);


SQL> SELECT empno, ename, job, deptno FROM   emp outer
  2  WHERE  EXISTS ( SELECT 'X' FROM dept WHERE deptno = outer.deptno);

SQL> SELECT empno, ename, job, deptno FROM   emp outer
    WHERE NOT EXISTS ( SELECT 'X' FROM dept WHERE deptno = outer.deptno);

SELECT deptno, dname FROM dept d 
WHERE NOT EXISTS (SELECT 'X' FROM   emp  WHERE  deptno = d.deptno);

UPDATE dept1 e SET     dname = 
              (SELECT dname FROM dept d WHERE  e.deptno = d.deptno);

DELETE FROM dept1 d 
WHERE deptno = (SELECT deptno FROM dept WHERE deptno = d.deptno);

WITH 
dept_cost  AS (
   SELECT d.dname, SUM(e.sal) AS dept_total
   FROM   emp e JOIN dept d
   ON     e.deptno = d.deptno
   GROUP BY d.dname),
avg_cost    AS (
   SELECT SUM(dept_total)/COUNT(*) AS dept_avg
   FROM   dept_cost)
SELECT * FROM   dept_cost 
WHERE  dept_total >
        (SELECT dept_avg FROM avg_cost)
ORDER BY dname;








ALTER TABLE EMP4 ADD CONSTRAINT EMP4_EMPNO_pk PRIMARY KEY (empno)
DEFERRABLE INITIALLY DEFERRED;

