CREATE TABLE employees (
    employee_id   NUMBER(5) PRIMARY KEY,
    first_name    VARCHAR2(30),
    last_name     VARCHAR2(30),
    job_id        VARCHAR2(20),
    department_id NUMBER(5),
    salary        NUMBER(10,2),
    hire_date     DATE
);
INSERT INTO employees VALUES
(101, 'Saloni', 'Patel', 'IT_PROG', 10, 40000,
 TO_DATE('15-JUN-2010','DD-MON-YYYY'));

INSERT INTO employees VALUES
(102, 'Pratham', 'Shah', 'IT_PROG', 20, 50000,
 TO_DATE('20-MAR-2012','DD-MON-YYYY'));

INSERT INTO employees VALUES
(103, 'Janvi', 'Desai', 'SA_REP', 30, 70000,
 TO_DATE('10-JAN-2008','DD-MON-YYYY'));

INSERT INTO employees VALUES
(104, 'Zeel', 'Patel', 'HR_REP', 40, 40000,
 TO_DATE('25-AUG-2015','DD-MON-YYYY'));

INSERT INTO employees VALUES
(105, 'Prachi', 'Mehta', 'IT_PROG', 10, 50000,
 TO_DATE('12-APR-2011','DD-MON-YYYY'));

INSERT INTO employees VALUES
(106, 'Mishwa', 'Joshi', 'FI_ACCOUNT', 50, 60000,
 TO_DATE('18-JUL-2009','DD-MON-YYYY'));

INSERT INTO employees VALUES
(107, 'Harvi', 'Shah', 'ST_CLERK', 60, 65000,
 TO_DATE('05-SEP-2013','DD-MON-YYYY'));

INSERT INTO employees VALUES
(108, 'Mahi', 'Desai', 'IT_PROG', 20, 53000,
 TO_DATE('22-FEB-2014','DD-MON-YYYY'));

INSERT INTO employees VALUES
(109, 'Sonal', 'Patel', 'HR_REP', 40, 40000,
 TO_DATE('30-NOV-2005','DD-MON-YYYY'));

INSERT INTO employees VALUES
(111, 'Hiren', 'Shah', 'SA_REP', 30, 30000,
 TO_DATE('14-MAY-2018','DD-MON-YYYY'));

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31; 

    v_id NUMBER;

    v_emp employees%ROWTYPE;

    v_da  NUMBER;
    v_hra NUMBER;
    v_pf  NUMBER;
    v_net NUMBER;

BEGIN
    v_id := 100 + MOD(v_roll_no, 20);

    SELECT *
    INTO v_emp
    FROM employees
    WHERE employee_id = v_id;

    v_da  := v_emp.salary * 0.40;
    v_hra := v_emp.salary * 0.20;
    v_pf  := v_emp.salary * 0.12;

    v_net := v_emp.salary + v_da + v_hra - v_pf;

    DBMS_OUTPUT.PUT_LINE(
        '================================================'
    );

    DBMS_OUTPUT.PUT_LINE(
        LPAD('LJ BANK - SALARY SLIP', 38)
    );

    DBMS_OUTPUT.PUT_LINE(
        LPAD(TO_CHAR(SYSDATE, 'Month YYYY'), 38)
    );

    DBMS_OUTPUT.PUT_LINE(
        '================================================'
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Employee ID', 20) || ': ' || v_emp.employee_id
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Employee Name', 20) || ': ' || v_emp.first_name
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Job', 20) || ': ' || v_emp.job_id
    );

    DBMS_OUTPUT.PUT_LINE(
        '------------------------------------------------'
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Basic Salary', 30) ||
        LPAD(TO_CHAR(v_emp.salary, '99,99,999.99'), 15)
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('DA (40%)', 30) ||
        LPAD(TO_CHAR(v_da, '99,99,999.99'), 15)
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('HRA (20%)', 30) ||
        LPAD(TO_CHAR(v_hra, '99,99,999.99'), 15)
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('PF Deduction (12%)', 30) ||
        LPAD(TO_CHAR(v_pf, '99,99,999.99'), 15)
    );

    DBMS_OUTPUT.PUT_LINE(
        '------------------------------------------------'
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('NET PAY', 30) ||
        LPAD(TO_CHAR(v_net, '99,99,999.99'), 15)
    );

    DBMS_OUTPUT.PUT_LINE(
        '================================================'
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee not found — check the employee ID.'
        );

END;
/

================================OUTPUT===================================================================

================================================
LJ BANK - SALARY SLIP
August	  2026
================================================
Employee ID	    : 111
Employee Name	    : Hiren
Job		    : SA_REP
------------------------------------------------
Basic Salary			    30,000.00
DA (40%)			    12,000.00
HRA (20%)			     6,000.00
PF Deduction (12%)		     3,600.00
------------------------------------------------
NET PAY 			    44,400.00
================================================