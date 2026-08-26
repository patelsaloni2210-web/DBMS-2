SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31;  

    v_m1 NUMBER;
    v_m2 NUMBER;
    v_m3 NUMBER;
    v_m4 NUMBER;
    v_m5 NUMBER := NULL;

    v_total NUMBER;
    v_pct   NUMBER;

    v_passed BOOLEAN;

BEGIN
    v_m1 := MOD(v_roll_no, 30) + 60;
    v_m2 := MOD(v_roll_no, 30) + 60;
    v_m3 := MOD(v_roll_no, 30) + 60;
    v_m4 := MOD(v_roll_no, 30) + 60;

    v_m5 := NULL;

    v_total := v_m1 + v_m2 + v_m3 + v_m4 + NVL(v_m5, 0);

    v_pct := ROUND(v_total / 500 * 100, 2);

    v_passed := (v_pct >= 40);

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('          STUDENT RESULT CARD');
    DBMS_OUTPUT.PUT_LINE('========================================');

    DBMS_OUTPUT.PUT_LINE('Subject 1 Marks : ' || v_m1);
    DBMS_OUTPUT.PUT_LINE('Subject 2 Marks : ' || v_m2);
    DBMS_OUTPUT.PUT_LINE('Subject 3 Marks : ' || v_m3);
    DBMS_OUTPUT.PUT_LINE('Subject 4 Marks : ' || v_m4);
    DBMS_OUTPUT.PUT_LINE('Subject 5 Marks : ABSENT');

    DBMS_OUTPUT.PUT_LINE('----------------------------------------');

    DBMS_OUTPUT.PUT_LINE('Total           : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage      : ' || v_pct || '%');

   

    DBMS_OUTPUT.PUT_LINE(
        'Result          : ' ||
        CASE
            WHEN v_passed THEN 'PASS'
            ELSE 'FAIL'
        END
    );

    DBMS_OUTPUT.PUT_LINE('========================================');

END;
/

============================================OUTPUT============================================================

========================================
STUDENT RESULT CARD
========================================
Subject 1 Marks : 61
Subject 2 Marks : 61
Subject 3 Marks : 61
Subject 4 Marks : 61
Subject 5 Marks : ABSENT
----------------------------------------
Total		: 244
Percentage	: 48.8%
Result		: PASS
========================================