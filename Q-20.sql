SET SERVEROUTPUT ON;

DECLARE
    v_name  VARCHAR2(50) := 'Saloni Patel';
    v_dob   DATE := TO_DATE('22-OCT-2007', 'DD-MON-YYYY');
    v_roll  NUMBER := 31;

    v_pnr        VARCHAR2(30);
    v_jdate      DATE;
    v_fare       NUMBER;
    v_age        NUMBER;
    v_final_fare NUMBER;

BEGIN
    v_pnr := 'GJ' ||
             TO_CHAR(SYSDATE, 'YYMM') ||
             LPAD(v_roll, 4, '0');

    v_jdate := SYSDATE + (MOD(v_roll, 30) + 1);

    v_fare := v_roll * 50 + 200;

    v_age := TRUNC(
        MONTHS_BETWEEN(SYSDATE, v_dob) / 12
    );

    IF v_age >= 60 THEN
        v_final_fare := v_fare * 0.60;
    ELSE
        v_final_fare := v_fare;
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        '============================================'
    );

    DBMS_OUTPUT.PUT_LINE(
        LPAD('IRCTC RAILWAY TICKET', 34)
    );

    DBMS_OUTPUT.PUT_LINE(
        '============================================'
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Passenger Name', 20) || ': ' || v_name
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('PNR Number', 20) || ': ' || v_pnr
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Roll Number', 20) || ': ' ||
        LPAD(v_roll, 4, '0')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Date of Birth', 20) || ': ' ||
        TO_CHAR(v_dob, 'DD-MON-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Age', 20) || ': ' || v_age || ' years'
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Journey Date', 20) || ': ' ||
        TO_CHAR(v_jdate, 'Day, DD-MON-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Base Fare', 20) || ': Rs.' ||
        TO_CHAR(v_fare, '99,999.00')
    );

    IF v_age >= 60 THEN
        DBMS_OUTPUT.PUT_LINE(
            RPAD('Concession', 20) || ': 40%'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            RPAD('Concession', 20) || ': NIL'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Final Fare', 20) || ': Rs.' ||
        TO_CHAR(v_final_fare, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        '============================================'
    );

END;
/

==================================================OUTPUT==========================================

============================================
IRCTC RAILWAY TICKET
============================================
Passenger Name	    : Saloni Patel
PNR Number	    : GJ26080031
Roll Number	    : 0031
Date of Birth	    : 22-OCT-2007
Age		    : 18 years
Journey Date	    : Friday   , 28-AUG-2026
Base Fare	    : Rs.  1,750.00
Concession	    : NIL
Final Fare	    : Rs.  1,750.00
============================================