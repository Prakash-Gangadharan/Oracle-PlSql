			--+-------+-----------+----------+------------+--------+-
			--		PL/SQL
			--+-------+-----------+----------+------------+--------+-
			
/*
 *  To clear screen
 *  cl scr
 */

-- To increase sqlplus column output length:
SET linesize 200

--+-------+-----------+----------+------------+--------+-
-- DISPLAYS

SET SERVEROUTPUT ON
SET AUTOPRINT ON

exec DBMS_OUTPUT.PUT_LINE('HELLO');
--+-------+-----------+----------+------------+--------+-

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO');
END;
/
--+-------+-----------+----------+------------+--------+-

DECLARE
    name VARCHAR2(10):='HI';
BEGIN
    DBMS_OUTPUT.PUT_LINE(name);
END;
/
--+-------+-----------+----------+------------+--------+-
DECLARE
    N1 NUMBER:=5;
    N2 NUMBER:=0;
BEGIN
    DBMS_OUTPUT.PUT_LINE(N1/N2);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Division by zero not allowed');
END;
/

--+-------+-----------+----------+------------+--------+-

DECLARE
    Myname VARCHAR2(20);
BEGIN
    DBMS_OUTPUT.PUT_LINE('MY NAME IS :'||Myname);
    Myname:='prakash';
    DBMS_OUTPUT.PUT_LINE('My name is :'||Myname);
END;
/

--+-------+-----------+----------+------------+--------+-

DECLARE
    Myname VARCHAR2(20):='Prakash';
BEGIN
    Myname:='johnson';
    DBMS_OUTPUT.PUT_LINE('My Name is :'||Myname);
    
    Myname:=q'[Independence's day]';
    DBMS_OUTPUT.PUT_LINE('Indias function is:'||Myname);

    Myname:=q'!Republic's day!';
    DBMS_OUTPUT.PUT_LINE('Indias function is:'||Myname);
END;
/
--+-------+-----------+----------+------------+--------+-

DECLARE
    eno NUMBER(6);
BEGIN
    DBMS_OUTPUT.PUT_LINE('My empno is: '||eno);
    SELECT empno INTO eno FROM emp WHERE ename = 'Raj';
    DBMS_OUTPUT.PUT_LINE('My empno is: '||eno);
END;
/

--+-------+-----------+----------+------------+--------+-
/* bind variables 
 * refrenced with a preceding colon
 * */ 

-- print bind variables:

VARIABLE emp_salary NUMBER
    
SET AUTOPRINT ON

DECLARE
    employno NUMBER(6):=114;
BEGIN
    SELECT sal INTO :emp_salary FROM emp WHERE empno = employno;
END; 
/

PRINT emp_salARY

----++--
SELECT ENAME, DOJ, JOB FROM emp WHERE sal =: emp_salary;
----++--
--1
DECLARE
    employno NUMBER(6):=&empno;
BEGIN
    SELECT sal INTO :emp_salary FROM emp WHERE empno = employno;
END;
/
--2
ACCEPT empno PROMPT 'Please enter a valid employee number: ' 
--3

DECLARE 
    empnum NUMBER(6) := &empno; 
BEGIN
    SELECT sal INTO :emp_salary FROM emp 
    WHERE empno = empnum;
END;
/

-- %TYPE Attribute
-- SELECT INTO  
-- Printing variables

DECLARE 
    annualsalary NUMBER(9, 2); 
    totalsalary  NUMBER(10, 2); 
    name         VARCHAR2(25); 
    emp_doj      emp.doj%TYPE; 
    emp_salary   emp.sal%TYPE; 
    basic        emp.sal%TYPE := 2000; 
BEGIN
    emp_salary := 1000; 
    annualsalary := emp_salary * 12; 
    
    DBMS_OUTPUT.PUT_LINE('Annual Salary :'||annualsalary);
    DBMS_OUTPUT.PUT_LINE('Basic Pay :'||basic);
    
    SELECT ename INTO name  FROM emp WHERE empno=114;
    DBMS_OUTPUT.PUT_LINE(' Employee Name is : '||name);
    
    SELECT doj, sal INTO emp_doj, emp_salary FROM emp WHERE empno = 115;
    DBMS_OUTPUT.PUT_LINE('DOJ : '||emp_doj||', SALARY : '||emp_salary);
    
    SELECT SUM(sal) INTO totalsalary FROM emp WHERE DEPTNO = 20;
    DBMS_OUTPUT.PUT_LINE('TOTAL SALRY IS : '||totalsalary);
     
END;
/

-- local and global , functions
-- outer.global variable (qualify an identifier)
-- 
DECLARE 
    out_variable       VARCHAR2(20) := 'GLOBAL'; 
    uppname            VARCHAR2(20); 
    date_of_joining    DATE := '02-Feb-2000'; 
    date_of_joining_v2 DATE := To_date('February 02, 2000', 'Month DD, YYYY'); 
BEGIN 
    DECLARE 
        in_variable     VARCHAR2(20) := 'local'; 
        date_of_joining DATE := '05-Mar-1990'; 
    BEGIN 
        DBMS_OUTPUT.PUT_LINE(in_variable); 
        DBMS_OUTPUT.PUT_LINE(out_variable); 

        DBMS_OUTPUT.PUT_LINE('date_of_joining in inner block :'||date_of_joining); 

        uppname := Upper(in_variable); 
        DBMS_OUTPUT.PUT_LINE(uppname); 
    END; 

    DBMS_OUTPUT.PUT_LINE('date_of_joining_v2 :'||date_of_joining_v2);
END; 
/ 



-- Manipulating data using PL/SQL:-
-- INSERT, UPDATE AND DELETE inside  PL/SQL

DECLARE
    commission emp.sal%TYPE := 1500;
BEGIN
    INSERT INTO emp (empno, ename, doj, job, sal, deptno) values(121, 'Anil', sysdate, 'Clerk', 4000, 10);
    
    INSERT INTO emp (empno, ename, doj, job, sal, deptno) values(121, 'Ricky', sysdate, 'Clerk', 4000, 10);
    
    UPDATE emp SET COMM = commission + 200 where empno=113;
    
    DELETE FROM emp WHERE ename = 'Anil';    
    -- 1-Simple IF BLOCK
    
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' row(s) were deleted');
    END IF;
    
    -- 2-IF THEN ELSE BLOCK
    
    DELETE FROM emp WHERE ename = 'Anil';
    
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('The row to be deleted was not found');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The row was deleted');
    END IF;
    
END;
/

-- Control Structures 
--- 3-IF ELSIF BLOCK, CASE 

DECLARE
    numb NUMBER:=31
BEGIN
    IF numb < 11
        THEN DBMS_OUTPUT.PUT_LINE('number is Less than 11');
    ELSEIF numb < 20 
        THEN  DBMS_OUTPUT.PUT_LINE('number is greater than 11');
    ELSEIF numb < 30
        THEN  DBMS_OUTPUT.PUT_LINE('number is greater than 11');
    ELSE
        DBMS_OUTPUT.PUT_LINE('not applicable');
    END IF;
END;
/

-- CASE

DECLARE
    code CHAR(1) := upper('&code');
    status VARCHAR2(20);
BEGIN
    -- CASE variant one
    status := 
        CASE code 
            WHEN 'R' THEN 'Running'
            WHEN 'S' THEN 'Sheduled'
            WHEN 'C' THEN 'Completed'
            ELSE 'No status'
        END;
    DBMS_OUTPUT.PUT_LINE('code : '|| code ||' ,  Status : '|| status);
    
    -- CASE variant two (searched case expression)
    status := 
        CASE  
            WHEN code = 'R' THEN 'Running'
            WHEN code IN ('S','X','H') THEN 'Sheduled'
            WHEN code like '%C' THEN 'Completed'
            ELSE 'No status'
        END;
    DBMS_OUTPUT.PUT_LINE('code : '|| code ||' ,  Status : '|| status);    
    
END;
/

-- Case Statement

DECLARE
    deptnum NUMBER;
    deptname VARCHAR2(20);
    inempno NUMBER := &inempno;
BEGIN
    CASE inempno 
        WHEN 112 THEN 
        SELECT deptno INTO deptnum FROM emp where empno = inempno;
        SELECT dname INTO deptname FROM dept WHERE deptno = deptnum;
        
        WHEN 114 THEN 
        SELECT deptno INTO deptnum FROM emp where empno = inempno;
        SELECT dname INTO deptname FROM dept WHERE deptno = deptnum;
        
        END CASE;
        DBMS_OUTPUT.PUT_LINE('deptnum :'||deptnum || ',  dept name : '||deptname);
    
END;
/


-- Handling nulls 


DECLARE
    a     INTEGER;
    n     INTEGER;     -- be our null value.
    b     BOOLEAN;
BEGIN
    -- Assign a value to the variable A, but leave N null.
    a := 2;
    --n := 1;
    DBMS_OUTPUT.PUT_LINE(a <> n);
    b := (a <> n);
    DBMS_OUTPUT.PUT_LINE(a <> n);
    IF b THEN
        DBMS_OUTPUT.PUT_LINE('a <> n is TRUE');
    ELSIF NOT b THEN
        DBMS_OUTPUT.PUT_LINE('a <> n is FALSE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('a <> n is NULL');
    END IF;
END;
/ 
---

DECLARE
    a     INTEGER;
    n     INTEGER;     -- be our null value.
    b     BOOLEAN;
BEGIN
    -- Assign a value to the variable A, but leave N null.
    a := 2;
    --n := 1;
    b := (a <> n);
    IF b THEN
        DBMS_OUTPUT.PUT_LINE('a <> n is TRUE');
    ELSIF NOT b THEN
        DBMS_OUTPUT.PUT_LINE('a <> n is FALSE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('a <> n is NULL');
    END IF;
END;
/ 

-- Basic Loop:


DECLARE
    counter NUMBER(2);
    divisor NUMBER(2) := 10;
BEGIN
    counter := 50;
    LOOP
           divisor := divisor - 1;
           DBMS_OUTPUT.PUT_LINE(50/divisor); 
    END LOOP;
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Divisible by zero not allowed');
END;
/


--  While Loop

DECLARE
    v_Counter NUMBER(2) := 1;
BEGIN
    WHILE v_Counter <= 10 LOOP
    DBMS_OUTPUT.PUT_LINE('hELLO : '||v_Counter);
    v_Counter := v_Counter + 1;
    END LOOP;
END;
/

-- FOR LOOP 

DECLARE
    numbr NUMBER;
BEGIN
    FOR numb IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE(numb);
    END LOOP;
    
    -- For loop in reverse
    DBMS_OUTPUT.PUT_LINE(' For loop in reverse ');
    
    FOR numb IN REVERSE 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE(numb);
    END LOOP;
END;
/

 -- Nested loop with out lable

DECLARE

BEGIN
     FOR i IN 1.. 5 LOOP
         
             FOR j IN 1.. 3 LOOP
                 DBMS_OUTPUT.PUT_LINE(i||' iteration '||j);
                 EXIT when j=2;
             END LOOP;
             DBMS_OUTPUT.NEW_LINE;
     END LOOP;
 END;
 /

 -- Nested loop with lables
 
 DECLARE
 
 BEGIN
     <<i_loop>> FOR i in 1.. 5 LOOP
         
         <<j_loop>>FOR J IN 1.. 3 LOOP
                     DBMS_OUTPUT.PUT_LINE(i||' iteration '||j);
                     EXIT j_loop WHEN j=2;
             END LOOP;
         
         END LOOP;
 END; 
 /

-- Composite data types
-- Declaring Record 
 DECLARE
     TYPE location_record_type IS RECORD(
         street_address VARCHAR2(40),
         city VARCHAR2(30),
         country CHAR(5) NOT NULL := 'India'
     );
     my_loc location_record_type;
 BEGIN
     my_loc.street_address := 'new street';
     my_loc.city := 'chennai';
     DBMS_OUTPUT.PUT_LINE(' Address is : '||my_loc.street_address);
     DBMS_OUTPUT.PUT_LINE('city is '||my_loc.city||', Country is : '||my_loc.country);
 END;
 /

 
 
-- %ROWTYPE Attribute
 
 create table retiredemp(empno number(3) primary key,ename varchar2(7),doj date,retiredate date, job varchar2(9),sal number(7,2),comm number(7,2),mgrid number(3),deptno number(2));
 
 
 DEFINE emp_number = 111
 -- 
 DECLARE
    emp_rec emp%ROWTYPE;
BEGIN
    SELECT * INTO emp_rec FROM emp 
    WHERE empno = &emp_number;
    
    DBMS_OUTPUT.PUT_LINE('The empno is : '||emp_rec.empno);
    DBMS_OUTPUT.PUT_LINE('The ename is : '||emp_rec.ename);
    DBMS_OUTPUT.PUT_LINE('The doj is : '||emp_rec.doj);
    DBMS_OUTPUT.PUT_LINE('The job is : '||emp_rec.job);
    DBMS_OUTPUT.PUT_LINE('The sal is : '||emp_rec.sal);
    DBMS_OUTPUT.PUT_LINE('The comm is : '||emp_rec.deptno);
END;
/
-- Inserting a record by using %ROWTYPE Attribute.

DECLARE
    -- emp type
    emp_rec emp%ROWTYPE; 
BEGIN
    SELECT * INTO emp_rec FROM emp
    WHERE empno = &emp_number;
    
    INSERT INTO retiredemp (empno, ename, doj, retiredate, job, sal, comm, mgrid, deptno) 
    values (emp_rec.empno, emp_rec.ename, emp_rec.doj, sysdate, emp_rec.job, emp_rec.sal, 
    emp_rec.comm, emp_rec.mgrid, emp_rec.deptno);
    
END;
/

-- Inserting a record by using %ROWTYPE Attribute.

DEFINE emp_number = 112

DECLARE
    -- retiredemp type
    emp_rec retiredemp%ROWTYPE;
BEGIN
    SELECT empno, ename, doj, sysdate, job, sal, 
    comm, mgrid, deptno INTO emp_rec FROM emp 
    WHERE empno = &emp_number;
    INSERT INTO retiredemp values emp_rec;
END;
/
--

SELECT * FROM retiredemp;

-- Update row in table by using record

SET VERIFY OFF
--
DECLARE
    dept_info dept%ROWTYPE;
BEGIN
    dept_info.deptno := 70; 
    dept_info.dname := 'EDP';
    dept_info.locid := 1;
    DBMS_OUTPUT.PUT_LINE('DEPT : '||dept_info.dname);
    UPDATE dept SET deptno = dept_info.deptno WHERE deptno = 30;
    UPDATE dept SET ROW = dept_info WHERE deptno = 70;
END;
/

---- Explicit Cursors
-- open, fetch and close

/*
 *  Fetching data from the Cursor without Attribute
 */

DECLARE
 CURSOR emp_cursor IS 
     SELECT empno, ename FROM emp WHERE deptno = 20;
     eno emp.empno%TYPE;
     lname emp.ename%TYPE;
BEGIN
    OPEN emp_cursor;
    
    FETCH emp_cursor INTO eno, lname;
    DBMS_OUTPUT.PUT_LINE(eno||' '||lname);
    
    CLOSE emp_cursor;
END;
/

---

/*
 *  Fetching data from the cursor with Attribute
 */

DECLARE
    CURSOR emp_cursor IS 
    SELECT empno, ename, job FROM emp WHERE deptno = 20;
    lno emp.empno%TYPE;
    lname emp.ename%TYPE;
    ljob emp.job%TYPE;
BEGIN
    OPEN emp_cursor;
    DBMS_OUTPUT.PUT_LINE('eno  -  ename - job');
    LOOP
    
	    FETCH emp_cursor INTO lno, lname, ljob;
	    EXIT WHEN emp_cursor%NOTFOUND;
	    DBMS_OUTPUT.PUT_LINE(lno||' -  '||lname||' - '||ljob);
    
	END LOOP;
    CLOSE emp_cursor;
END;
/

---
/**
 *  Cursor and records
 *  Fetching data from the cursor with %ROWTYPE Attribute
 */

DECLARE
	CURSOR emp_cursor IS 
	SELECT * FROM emp;
	emp_rec emp%ROWTYPE;
BEGIN
	OPEN emp_cursor;
		LOOP
			FETCH emp_cursor INTO emp_rec;
			EXIT WHEN emp_cursor%NOTFOUND; 
			DBMS_OUTPUT.PUT_LINE('>> '||emp_rec.ename);
		END LOOP;
	CLOSE emp_cursor;
END;
/

--

	/**
	 *  Cursor FOR Loops
	 *  Implicit open, fetch, exit and close cursor
	 */

DECLARE
	CURSOR emp_cursor IS
	SELECT * FROM emp WHERE deptno = 20;
	emp_record emp_cursor%ROWTYPE;
BEGIN
   	FOR emp_record IN emp_cursor 
    	LOOP
     	      DBMS_OUTPUT.PUT_LINE( emp_record.empno ||' - '||emp_record.ename||' - '||emp_record.sal);   
   	 END LOOP; 
END;
/ 

--

/**
 *  Explicit cursor attributes
 *  %ISOPEN
 *  %ROWCOUNT
 */

DECLARE
	CURSOR emp_cursor IS 
		SELECT empno, ename FROM emp WHERE deptno =20;
	emp_record emp_cursor%ROWTYPE;
BEGIN
	OPEN emp_cursor;
		FETCH emp_cursor INTO emp_record;
		IF emp_cursor%ISOPEN THEN
			DBMS_OUTPUT.PUT_LINE( emp_record.empno ||' ' ||emp_record.ename);
		END IF;
	CLOSE emp_cursor;
END;
/

--

DECLARE
	empno	emp.empno%TYPE;
	ename	emp.ename%TYPE;
	CURSOR emp_cursor IS SELECT empno, ename FROM emp;
BEGIN 
	OPEN emp_cursor;
	LOOP
		FETCH emp_cursor INTO empno, ename;
		EXIT WHEN emp_cursor%ROWCOUNT > 4 OR emp_cursor%NOTFOUND;        
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(empno) ||' '|| ename);
	END LOOP;
	CLOSE emp_cursor;
END ;
/

--
/**
 *  Cursor For Loops Using Subqueries :-
 *  no need to declare cursor
 */

BEGIN
	FOR emp_record IN (SELECT empno, ename FROM emp WHERE deptno =20)
	LOOP
		DBMS_OUTPUT.PUT_LINE( emp_record.empno ||'  '||emp_record.ename);   
	END LOOP; 
END;
/

/**
 * Cursor with parameters
 */

DECLARE
	CURSOR emp_cursor (deptnumber NUMBER) IS 
	SELECT empno, ename FROM emp WHERE deptno = deptnumber;
	empnum NUMBER;
	lname VARCHAR2(15);	
BEGIN
	OPEN emp_cursor(20);
	LOOP
		FETCH emp_cursor INTO empnum, lname;
		EXIT WHEN emp_cursor%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE( empnum ||' '||lname);	
	END LOOP;
	CLOSE emp_cursor;
END;
/

----

/**
 *  FOR UPDATE Clause
 *  WHERE CURRENT OF Clause
 *  Postgresql - SELECT FOR UPDATE example 
 *  http://walterslog.blogspot.in/2010/10/postgresql-select-for-update-example.html
 */

DECLARE
	CURSOR myCursor IS 
		SELECT * FROM emp FOR UPDATE OF ename;
		v_ename VARCHAR2(20);
BEGIN
	FOR idx IN myCursor LOOP
--		v_ename :=UPPER(idx.ename);
		v_ename :=LOWER(idx.ename);
		UPDATE emp SET ename=v_ename 
		WHERE CURRENT OF myCursor;
	END LOOP;
END;
/

--
/**
 *  Cursor with Subqueries
 */
DECLARE
	lname VARCHAR2(15);
BEGIN
	SELECT ename INTO lname FROM emp WHERE job = 'Sales Man' AND empno = 115;
	DBMS_OUTPUT.PUT_LINE ('Sales Man''s name is : '  || lname);
	
	FOR job_record IN
		(SELECT * FROM emp WHERE deptno = ( SELECT deptno FROM dept WHERE dname = 'Account'))
		LOOP
		DBMS_OUTPUT.PUT_LINE(job_record.job);
	END LOOP;
	
END;
/
--

-- Triggers

--  trigger on delete


CREATE OR REPLACE TRIGGER emp_after_delete
    AFTER DELETE ON emp FOR EACH ROW
BEGIN    
	INSERT INTO employee (EMPLOYEE_NUMBER, EMPLOYEE_NAME, SALARY, DEPTNO) 
	VALUES (:old.empno, :old.ename, :old.sal, :old.deptno);
END;
/


-- To test triggers 

DROP TRIGGER emp_after_delete; 

DELETE FROM emp WHERE empno=115;


--  Trigger on INSERT 


CREATE OR REPLACE TRIGGER emp_after_insert
      	AFTER INSERT 
         ON emp
         FOR EACH ROW
DECLARE
          v_username varchar2(10);
BEGIN          
          SELECT user INTO v_username FROM dual;
          dbms_output.put_line('By: '||v_username);
          dbms_output.put_line(':new.empno: '||:new.empno);
          dbms_output.put_line(':new.ename: '||:new.ename);          
          dbms_output.put_line(':old.empno: '||:old.empno);
          dbms_output.put_line(':old.ename: '||:old.ename);          
END;
/

--  Trigger on UPDATE

DROP TRIGGER emp_after_update; 

CREATE OR REPLACE TRIGGER emp_after_update
      	AFTER UPDATE 
         ON emp
         FOR EACH ROW
DECLARE
          v_username varchar2(10);
BEGIN          
          SELECT user INTO v_username FROM dual;
          dbms_output.put_line('By: '||v_username);
          dbms_output.put_line(':new.empno: '||:new.empno);
          dbms_output.put_line(':new.ename: '||:new.ename);          
          dbms_output.put_line(':old.empno: '||:old.empno);
          dbms_output.put_line(':old.ename: '||:old.ename);          
END;
/

---------------------------------------------------------------------------------------------------
-- 								Procedures and Functions 
---------------------------------------------------------------------------------------------------

/**
 *  Call a stored procedure in a pl/sql
 */
-- Stored procedure
 DROP PROCEDURE my_proc;
 
CREATE OR REPLACE PROCEDURE my_proc AS 
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO PROCEDURE');	
    END my_proc;
/

BEGIN
    my_proc;	
END;
/

-- 
/**
 *  Passing parameters to procedures
 */

CREATE OR REPLACE PROCEDURE HiTo(i varchar2)
IS
    v_string varchar2(15) := 'Hi, '||i||'!';
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_string);	
END HiTo;
/

BEGIN
	HiTo('PRAKASH');
	HiTo('JOHNSON');
END ;
/
--
/**
 *   Procedural Parameter Modes
 * 
 */
 -- IN Parameter - default mode
CREATE OR REPLACE PROCEDURE salary_inc (P_Id emp.EMPNO%TYPE)
AS
BEGIN
	DBMS_OUTPUT.PUT_LINE('employee id is '||P_Id);
	UPDATE emp SET SAL = 1000 WHERE EMPNO = P_Id;
END salary_inc;
/


EXECUTE salary_inc(117);


-- OUT mode
---------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sal_inc(p_empno IN emp.EMPNO%TYPE, 
	p_name OUT emp.ENAME%TYPE, p_sal OUT emp.sal%TYPE)
AS
BEGIN
SELECT ENAME, sal+1000 INTO p_name, p_sal FROM emp WHERE EMPNO = p_empno;
END sal_inc;
/

VARIABLE g_name VARCHAR2(10)
VARIABLE g_sal NUMBER

EXECUTE sal_inc(117,  :g_name, :g_sal);

PRINT g_name
PRINT g_sal


---------------------------------------------------------------------------------------------------

-- IN OUT parameter

CREATE OR REPLACE PROCEDURE NAME_FORMAT(p_name IN OUT VARCHAR2)
AS
BEGIN
	p_name := 'MR. '||p_name;
END NAME_FORMAT;
/

VARIABLE g_name VARCHAR2(20)

BEGIN
	:g_name := 'Prakash';
END;
/

EXECUTE NAME_FORMAT(:g_name);

PRINT g_name

---------------------------------------------------------------------------------------------------
-- 							Procedure 
---------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE addnewemp (P_EMPNO emp.EMPNO%TYPE, P_ENAME emp.ENAME%TYPE, P_DOJ emp.DOJ%TYPE, P_JOB emp.JOB%TYPE, P_SAL emp.SAL%TYPE, P_COMM emp.COMM%TYPE, P_MGRID emp.MGRID%TYPE, P_DEPTNO emp.DEPTNO%TYPE) as
BEGIN
	INSERT INTO emp (EMPNO, ENAME, DOJ, JOB, SAL, COMM, MGRID, DEPTNO) 
		values (P_EMPNO, P_ENAME, P_DOJ, P_JOB, P_SAL, P_COMM, P_MGRID, P_DEPTNO);
END addnewemp;
/

-- Invoking the procedure
BEGIN
	addnewemp(114,'Raj',to_date('14/03/2006','DD/mm/yyyy'),'Clerk',20000,null,111,10);
	addnewemp(115,'Sathish',to_date('05/05/2008','DD/mm/yyyy'),'Sales Man',8000,2000,112,20);
	addnewemp(116,'Ravi',to_date('10/05/2009','DD/mm/yyyy'),'Sales Man',7000,1000,112,20);
END;
/

---------------------------------------------------------------------------------------------------
-- 							Function 
---------------------------------------------------------------------------------------------------

-- Function Example: 1
CREATE OR REPLACE FUNCTION check_sal RETURN Boolean IS
	v_sal emp.sal%TYPE;

BEGIN
	SELECT sal INTO v_sal FROM emp WHERE empno = 113;
	DBMS_OUTPUT.PUT_LINE('sal - '||v_sal);
	IF V_SAL > 2000 THEN
	RETURN TRUE;
	ELSE
	RETURN FALSE;
	END IF;
END;
/

-- Invoking the funcion
BEGIN
	IF (check_sal IS NULL) THEN 
		DBMS_OUTPUT.PUT_LINE('hello');
	ELSIF (check_sal) THEN 
		DBMS_OUTPUT.PUT_LINE('two');
	ELSE
		DBMS_OUTPUT.PUT_LINE('three');
	END IF;
END;
/

-- Passing a parameter to a function 

CREATE OR REPLACE FUNCTION employee_name(p_empno emp.empno%TYPE) RETURN VARCHAR2 IS 
	myresult VARCHAR2(100);
BEGIN
	SELECT ENAME INTO myresult FROM emp WHERE empno = p_empno;
	RETURN myresult;
END employee_name;
/

CREATE TABLE MyTable(char_col varchar2(20));

-- Invoking function with parameter. 
SELECT employee_name(115) FROM dual;

INSERT INTO MyTable (char_col) VALUES (employee_name(115));

BEGIN
	-- employee_name(115) is a function.
DBMS_OUTPUT.PUT_LINE('name '||employee_name(115));
END ;
/

-- function example 2

CREATE OR REPLACE FUNCTION convert_it (degree NUMBER,  p_expression boolean)  RETURN NUMBER IS
    buffer NUMBER;
BEGIN
	IF p_expression THEN 
	DBMS_OUTPUT.PUT_LINE('celsius_to_fahrenheit ');
		buffer := (degree * 9/5) + 32;
	ELSE 
	DBMS_OUTPUT.PUT_LINE('fahrenheit_to_celsius ');
		buffer := (5/9) * (degree - 32);
	END IF;
	RETURN buffer;
END convert_it;
/

-- Invoking function with parameter. 

BEGIN
	DBMS_OUTPUT.PUT_LINE('convert to  '||convert_it(36.89, 1=1));
END;
/


-- function example 3

CREATE OR REPLACE FUNCTION celsius_to_fahrenheit (degree NUMBER) RETURN NUMBER IS
    buffer NUMBER;
BEGIN
	buffer := (degree * 9/5) + 32;
	RETURN buffer;
END celsius_to_fahrenheit;
/

SELECT celsius_to_fahrenheit(36) FROM dual;

-- function example 4

CREATE OR REPLACE FUNCTION square(num NUMBER)
RETURN NUMBER IS 
BEGIN
	RETURN num * num;
END square;
/

-- Invoking function with parameter. 

BEGIN
	DBMS_OUTPUT.PUT_LINE('2 square is  '||square(2));
END;
/

-- local function

DECLARE
    CURSOR My_Emp_Name IS
		SELECT ename FROM emp;
    v_FormattedName VARCHAR2(50);
    FUNCTION FormatName(p_ename IN VARCHAR2)
		RETURN VARCHAR2 
	IS
	BEGIN
		RETURN 'Mr. '||p_ename;
    END FormatName;
BEGIN
		FOR v_StudentRecord IN My_Emp_Name LOOP
			v_FormattedName := FormatName(v_StudentRecord.ename);
			DBMS_OUTPUT.PUT_LINE(v_FormattedName);
		END LOOP;
END;
/

--  With clause

 WITH example AS (SELECT * FROM emp WHERE rownum < 3 ) SELECT * FROM example;

-- using select query
SELECT e.ename AS employee_name, 
		e.deptno AS department_no, 
		dc.dept_count AS emp_dept_count
FROM   emp e,
       (SELECT deptno, COUNT(*) AS dept_count
        FROM   emp 
        GROUP BY deptno) dc  
WHERE  e.deptno = dc.deptno;

-- Using a WITH clause

WITH dc AS (
	SELECT deptno, count(*) AS dept_count 
	FROM emp 
	GROUP BY deptno)
		SELECT e.ename, e.deptno, dc.dept_count 
		FROM emp e, dc
		WHERE e.deptno = dc.deptno;

-- CASE 

SELECT ename
         , case
             when sal < 8000
                  THEN 'Grade III'
             when (sal >=10000 AND sal < 20000)
                  THEN 'Grade II'
             when (sal >= 25000 AND sal < 50000)
                  THEN 'Grade I'
             else 'Grade IV'
          END sal_grade
   FROM emp
   WHERE rownum < 4;
   
---------------------------------------------------------------------------------------------------
-- 							Packages
---------------------------------------------------------------------------------------------------

-- Creating package

CREATE OR REPLACE PACKAGE display_package AS 
	FUNCTION square(num number) RETURN NUMBER;
	PROCEDURE my_proc;
END display_package;
/

-- Creating a package body

CREATE OR REPLACE PACKAGE BODY display_package AS
	FUNCTION square(num number) RETURN NUMBER IS
	BEGIN
		RETURN num * num;
	END square;
    PROCEDURE my_proc AS
    BEGIN
		DBMS_OUTPUT.PUT_LINE('9 squared is ' || square(9));
	END my_proc;
END display_package;
/

-- execute

EXECUTE display_package.my_proc;
SELECT display_package.square(9) FROM DUAL;
   
-- Drop package   

SELECT object_name,  procedure_name   FROM user_procedures WHERE object_name = 'DISPLAY_PACKAGE';

DROP PACKAGE display_package;


---
-- to test hibernate.

CREATE OR REPLACE PROCEDURE remove_emp AS 
BEGIN
	DELETE FROM employee WHERE ename = 'testname';
END remove_emp;
/



CREATE OR REPLACE PROCEDURE salary_inc (p_id number, p_newSal number)
IS
BEGIN
	UPDATE employee SET SAL = p_newSal WHERE EMPNO = p_id;
END salary_inc;
/


BEGIN
	salary_inc(30, 8000);
END;
/