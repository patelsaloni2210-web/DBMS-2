SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31; 
    v_n       NUMBER;

BEGIN
    v_n := MOD(v_roll_no, 12) + 1;

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('       DATE FUNCTION PLAYGROUND');
    DBMS_OUTPUT.PUT_LINE('========================================');

    DBMS_OUTPUT.PUT_LINE(
        'Today  : ' ||
        TO_CHAR(SYSDATE, 'Day, DD "th" Month YYYY')
    );

    DBMS_OUTPUT.PUT_LINE(
        'N (Months)   : ' || v_n
    );

    DBMS_OUTPUT.PUT_LINE(
        'Date after N months: ' ||
        TO_CHAR(ADD_MONTHS(SYSDATE, v_n), 'DD-MON-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Last day of month  : ' ||
        TO_CHAR(LAST_DAY(SYSDATE), 'DD-MON-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Next Monday        : ' ||
        TO_CHAR(NEXT_DAY(SYSDATE, 'MONDAY'), 'DD-MON-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Days left this month: ' ||
        TRUNC(LAST_DAY(SYSDATE) - SYSDATE) || ' days'
    );

    DBMS_OUTPUT.PUT_LINE('========================================');

END;
/

========================================OUTPUT==========================================


========================================
DATE FUNCTION PLAYGROUND
========================================
Today  : Wednesday, 26 th August    2026
N (Months)   : 8
Date after N months: 26-APR-2027
Last day of month  : 31-AUG-2026
Next Monday	   : 31-AUG-2026
Days left this month: 5 days
========================================