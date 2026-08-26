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
    v_emp employees%ROWTYPE;
    v_id  employees.employee_id%TYPE;
    v_yrs NUMBER;
BEGIN
    -- Replace 5 with your roll number
    v_id := 100 + MOD(5, 9) + 1;

    SELECT *
    INTO v_emp
    FROM employees
    WHERE employee_id = v_id;

    v_yrs := TRUNC(
        MONTHS_BETWEEN(SYSDATE, v_emp.hire_date) / 12
    );

    DBMS_OUTPUT.PUT_LINE('================================');
    DBMS_OUTPUT.PUT_LINE('       EMPLOYEE PROFILE CARD');
    DBMS_OUTPUT.PUT_LINE('================================');

    DBMS_OUTPUT.PUT_LINE(
        'Name           : ' ||
        v_emp.first_name || ' ' || v_emp.last_name
    );

    DBMS_OUTPUT.PUT_LINE(
        'Job ID         : ' || v_emp.job_id
    );

    DBMS_OUTPUT.PUT_LINE(
        'Department ID  : ' || v_emp.department_id
    );

    DBMS_OUTPUT.PUT_LINE(
        'Salary         : Rs.' ||
        TO_CHAR(v_emp.salary, '99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Hire Date      : ' ||
        TO_CHAR(v_emp.hire_date, 'DD-MON-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Years of Experience : ' || v_yrs
    );

    IF v_yrs > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Senior Employee');
    END IF;

    DBMS_OUTPUT.PUT_LINE('================================');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/

=============================================================Output==========================================

================================
EMPLOYEE PROFILE CARD
================================
Name	       : Mishwa Joshi
Job ID	       : FI_ACCOUNT
Department ID  : 50
Salary	       : Rs. 60,000
Hire Date      : 18-JUL-2009
Years of Experience : 17
Senior Employee
================================