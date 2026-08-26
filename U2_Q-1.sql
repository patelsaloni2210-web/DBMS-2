SET SERVEROUTPUT ON;

DECLARE
    v_m1 NUMBER := 85;
    v_m2 NUMBER := 78;
    v_m3 NUMBER := 92;
    v_m4 NUMBER := 67;
    v_m5 NUMBER := 81;

    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(10);
    v_result VARCHAR2(20);
    v_class VARCHAR2(20);

BEGIN
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + v_m5;
    v_percentage := ROUND(v_total / 500 * 100, 2);

    IF v_percentage >= 90 THEN
        v_grade := 'A+';
    ELSIF v_percentage >= 80 THEN
        v_grade := 'A';
    ELSIF v_percentage >= 70 THEN
        v_grade := 'B';
    ELSIF v_percentage >= 60 THEN
        v_grade := 'C';
    ELSIF v_percentage >= 50 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'FAIL';
    END IF;

    IF v_m1 < 35 THEN
        v_result := 'DETAINED';
        v_class := 'Subject 1 failed';

    ELSIF v_m2 < 35 THEN
        v_result := 'DETAINED';
        v_class := 'Subject 2 failed';

    ELSIF v_m3 < 35 THEN
        v_result := 'DETAINED';
        v_class := 'Subject 3 failed';

    ELSIF v_m4 < 35 THEN
        v_result := 'DETAINED';
        v_class := 'Subject 4 failed';

    ELSIF v_m5 < 35 THEN
        v_result := 'DETAINED';
        v_class := 'Subject 5 failed';

    ELSE
        v_result := 'PASS';

        IF v_percentage >= 75 THEN
            v_class := 'Distinction';

        ELSIF v_percentage >= 60 THEN
            v_class := 'First';

        ELSIF v_percentage >= 50 THEN
            v_class := 'Second';

        ELSE
            v_class := 'Pass';
        END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('          STUDENT REPORT CARD');
    DBMS_OUTPUT.PUT_LINE('======================================');

    DBMS_OUTPUT.PUT_LINE('Subject 1 Marks : ' || v_m1);
    DBMS_OUTPUT.PUT_LINE('Subject 2 Marks : ' || v_m2);
    DBMS_OUTPUT.PUT_LINE('Subject 3 Marks : ' || v_m3);
    DBMS_OUTPUT.PUT_LINE('Subject 4 Marks : ' || v_m4);
    DBMS_OUTPUT.PUT_LINE('Subject 5 Marks : ' || v_m5);

    DBMS_OUTPUT.PUT_LINE('--------------------------------------');

    DBMS_OUTPUT.PUT_LINE('Total           : ' || v_total || ' / 500');
    DBMS_OUTPUT.PUT_LINE('Percentage      : ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Grade           : ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Result          : ' || v_result);

    IF v_result = 'DETAINED' THEN
        DBMS_OUTPUT.PUT_LINE('Remark          : ' || v_class);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Class           : ' || v_class);
    END IF;

    DBMS_OUTPUT.PUT_LINE('======================================');

END;
/

===========================OUTPUT================================
======================================
STUDENT REPORT CARD
======================================
Subject 1 Marks : 85
Subject 2 Marks : 78
Subject 3 Marks : 92
Subject 4 Marks : 67
Subject 5 Marks : 81
--------------------------------------
Total		: 403 / 500
Percentage	: 80.6%
Grade		: A
Result		: PASS
Class		: Distinction
======================================