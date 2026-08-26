SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(100) := 'Saloni Patel';
    v_roll       NUMBER := 31; 
    v_dob        DATE := TO_DATE('22-OCT-2007', 'DD-MON-YYYY');

    v_upper      VARCHAR2(100);
    v_first      VARCHAR2(50);
    v_id         VARCHAR2(30);
    v_age        NUMBER;
    v_display    VARCHAR2(100);
    v_last       VARCHAR2(50);
    v_space      NUMBER;
BEGIN
    
    v_upper := UPPER(v_name);

    
    v_first := SUBSTR(v_upper, 1, INSTR(v_upper, ' ') - 1);

    
    v_id := 'LJICA' || TO_CHAR(v_dob, 'YYYY') ||
            LPAD(v_roll, 3, '0');

    
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    
    IF LENGTH(v_upper) > 20 THEN

        v_space := INSTR(v_upper, ' ');
        v_last := SUBSTR(v_upper, v_space + 1);

        v_display := v_first || ' ' || SUBSTR(v_last, 1, 1) || '.';

    ELSE
        v_display := v_upper;
    END IF;

    v_display := REPLACE(v_display, '  ', ' ');

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE(
        RPAD(' ', 10) || 'LJICA STUDENT ID CARD'
    );
    DBMS_OUTPUT.PUT_LINE('========================================');

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Student ID', 18) || ': ' || LPAD(v_id, 12)
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Name', 18) || ': ' || v_display
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('First Name', 18) || ': ' || v_first
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Roll No', 18) || ': ' || LPAD(v_roll, 3, '0')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Date of Birth', 18) || ': ' ||
        TO_CHAR(v_dob, 'DD-MON-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Age', 18) || ': ' || v_age || ' years'
    );

    DBMS_OUTPUT.PUT_LINE('========================================');

END;
/

=====================================OUTPUT======================================================
========================================
LJICA STUDENT ID CARD
========================================
Student ID	  : LJICA2007031
Name		  : SALONI PATEL
First Name	  : SALONI
Roll No 	  : 031
Date of Birth	  : 22-OCT-2007
Age		  : 18 years
========================================