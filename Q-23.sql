SET SERVEROUTPUT ON;

DECLARE
    -- Bug 1: '=' used instead of ':=' for variable initialization
    v_name VARCHAR2(50) := 'Saloni Patel';

    -- Bug 2 & 3: VARCHAR2 size was too small and CONSTANT
    -- must be initialized when declared
    c_bonus_rate CONSTANT NUMBER := 0.1;

    v_sal NUMBER := 31 * 1000 + 20000;  -- Roll number seed
    v_bonus NUMBER;
    v_fname employees.first_name%TYPE;

BEGIN

    v_bonus := v_sal * c_bonus_rate;

    -- Bug 4: Missing semicolon after the declaration
    -- Fixed by declaring v_sal with a semicolon above.

    -- Bug 5: SELECT inside PL/SQL requires INTO
    SELECT first_name
    INTO v_fname
    FROM employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: Rs.' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Bonus: Rs.' || v_bonus);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee ID 100 not found.'
        );

END;
/