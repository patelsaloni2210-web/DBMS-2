set linesize 250;
CREATE TABLE employees (
    employee_id NUMBER(5) PRIMARY KEY,
    first_name VARCHAR2(50),
    salary NUMBER(10,2)
);
insert into employees values(101,'Saloni',40000);
insert into employees values(102,'Pratham',50000);
insert into employees values(103,'Janvi',70000);
insert into employees values(104,'Zeel',40000);
insert into employees values(105,'Prachi',50000);
insert into employees values(106,'Mishwa',60000);
insert into employees values(107,'Harvi',65000);
insert into employees values(108,'Mahi',53000);
insert into employees values(999,'Sonal',40000);
insert into employees values(110,'Hiren',30000);
commit;

select * from employees;
SET SERVEROUTPUT ON;

DECLARE
    v_fname employees.first_name%TYPE;
    v_sal   employees.salary%TYPE;
    v_id    employees.employee_id%TYPE;

BEGIN

    v_id := 101;

    SELECT first_name, salary
    INTO v_fname, v_sal
    FROM employees
    WHERE employee_id = v_id;

    DBMS_OUTPUT.PUT_LINE(
        'Employee: ' || v_fname ||
        ' earns Rs.' || v_sal ||
        ' per month.'
    );

    
    v_id := 999;

    BEGIN
        SELECT first_name, salary
        INTO v_fname, v_sal
        FROM employees
        WHERE employee_id = v_id;

        DBMS_OUTPUT.PUT_LINE(
            'Employee: ' || v_fname ||
            ' earns Rs.' || v_sal ||
            ' per month.'
        );

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE(
                'Employee not found — check the ID.'
            );
    END;

END;
/