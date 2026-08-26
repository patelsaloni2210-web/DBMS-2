CREATE TABLE departments (
    department_id   NUMBER(5) PRIMARY KEY,
    department_name VARCHAR2(30),
    location_id     NUMBER(5)
);
INSERT INTO departments
VALUES (10, 'Information Technology', 100);

INSERT INTO departments
VALUES (20, 'Human Resources', 200);

INSERT INTO departments
VALUES (30, 'Sales', 300);

INSERT INTO departments
VALUES (40, 'Finance', 400);

INSERT INTO departments
VALUES (50, 'Marketing', 500);

INSERT INTO departments
VALUES (60, 'Administration', 600);

INSERT INTO departments
VALUES (70, 'Operations', 700);

INSERT INTO departments
VALUES (80, 'Research', 800);

INSERT INTO departments
VALUES (90, 'Production', 900);

INSERT INTO departments
VALUES (100, 'Support', 1000);

COMMIT;
SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31;  

    v_id    departments.department_id%TYPE;
    v_dname departments.department_name%TYPE;
    v_loc   departments.location_id%TYPE;

BEGIN
    v_id := (MOD(v_roll_no + 2, 11) + 1) * 10;

    BEGIN
        SELECT department_name, location_id
        INTO v_dname, v_loc
        FROM departments
        WHERE department_id = v_id;

        DBMS_OUTPUT.PUT_LINE(
            'Dept ' || v_id || ': ' ||
            v_dname || ' at location ' || v_loc
        );

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE(
                'Department not found — check the ID.'
            );
    END;



END;
/
=======================OUTPUT=====================================================

Dept 10: Information Technology at location 100