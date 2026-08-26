CREATE TABLE employees (
    employee_id    NUMBER(5) PRIMARY KEY,
    first_name     VARCHAR2(30),
    last_name      VARCHAR2(30),
    job_id         VARCHAR2(20),
    department_id  NUMBER(5),
    salary         NUMBER(10,2),
    hire_date      DATE
);
INSERT INTO employees
VALUES (101, 'Saloni', 'Patel', 'IT_PROG', 10, 40000,
        TO_DATE('15-JUN-2010', 'DD-MON-YYYY'));

INSERT INTO employees
VALUES (102, 'Pratham', 'Shah', 'IT_PROG', 20, 50000,
        TO_DATE('20-MAR-2012', 'DD-MON-YYYY'));

INSERT INTO employees
VALUES (103, 'Janvi', 'Desai', 'SA_REP', 30, 70000,
        TO_DATE('10-JAN-2008', 'DD-MON-YYYY'));

INSERT INTO employees
VALUES (104, 'Zeel', 'Patel', 'HR_REP', 40, 40000,
        TO_DATE('25-AUG-2015', 'DD-MON-YYYY'));

INSERT INTO employees
VALUES (105, 'Prachi', 'Mehta', 'IT_PROG', 10, 50000,
        TO_DATE('12-APR-2011', 'DD-MON-YYYY'));

INSERT INTO employees
VALUES (106, 'Mishwa', 'Joshi', 'FI_ACCOUNT', 50, 60000,
        TO_DATE('18-JUL-2009', 'DD-MON-YYYY'));

INSERT INTO employees
VALUES (107, 'Harvi', 'Shah', 'ST_CLERK', 60, 65000,
        TO_DATE('05-SEP-2013', 'DD-MON-YYYY'));

INSERT INTO employees
VALUES (108, 'Mahi', 'Desai', 'IT_PROG', 20, 53000,
        TO_DATE('22-FEB-2014', 'DD-MON-YYYY'));

INSERT INTO employees
VALUES (109, 'Sonal', 'Patel', 'HR_REP', 40, 40000,
        TO_DATE('30-NOV-2005', 'DD-MON-YYYY'));

INSERT INTO employees
VALUES (110, 'Hiren', 'Shah', 'SA_REP', 30, 30000,
        TO_DATE('14-MAY-2018', 'DD-MON-YYYY'));

COMMIT;

SET SERVEROUTPUT ON;


DECLARE
    v_roll_no NUMBER := 31;       

    v_dept    NUMBER;
    v_cnt     NUMBER;
    v_avg     NUMBER;
    v_max     NUMBER;

BEGIN
    v_dept := (MOD(v_roll_no, 6) + 1) * 10;

    SELECT COUNT(*),
           ROUND(AVG(salary), 2),
           MAX(salary)
    INTO v_cnt,
         v_avg,
         v_max
    FROM employees
    WHERE department_id = v_dept;

    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('       DEPARTMENT SUMMARY');
    DBMS_OUTPUT.PUT_LINE('======================================');

    DBMS_OUTPUT.PUT_LINE(
        'Department ID : ' || v_dept
    );

    DBMS_OUTPUT.PUT_LINE(
        'Employee Count: ' || v_cnt
    );

    DBMS_OUTPUT.PUT_LINE(
        'Average Salary: Rs.' || NVL(TO_CHAR(v_avg, '99,999.99'), '0.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Maximum Salary: Rs.' || NVL(TO_CHAR(v_max, '99,999.99'), '0.00')
    );

    DBMS_OUTPUT.PUT_LINE('======================================');

    
END;
/

==================================OUTPUT=============================================================

======================================
DEPARTMENT SUMMARY
======================================
Department ID : 20
Employee Count: 2
Average Salary: Rs. 51,500.00
Maximum Salary: Rs. 53,000.00
======================================