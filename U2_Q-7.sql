SET SERVEROUTPUT ON;

DECLARE
    v_attendance_pct   NUMBER := 85;
    v_theory_marks     NUMBER := 55;
    v_practical_marks  NUMBER := 25;
    v_assignment_marks NUMBER := 8;

    v_assignment_counted NUMBER;
    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(5);
    v_result VARCHAR2(30);
    v_remark VARCHAR2(100);

BEGIN

    v_assignment_counted := LEAST(v_assignment_marks, 10);

    IF v_attendance_pct < 40 THEN

        v_result := 'DETAINED';
        v_remark := 'Attendance below 40% - Student is detained.';

    ELSIF v_theory_marks < 28 THEN

        v_result := 'FAIL in Theory';
        v_remark := 'Theory marks are below the minimum passing marks.';

    ELSIF v_practical_marks < 12 THEN

        v_result := 'FAIL in Practical';
        v_remark := 'Practical marks are below the minimum passing marks.';

    ELSE

        v_total := v_theory_marks
                   + v_practical_marks
                   + v_assignment_counted;

        v_percentage := ROUND((v_total / 110) * 100, 2);

        v_grade :=
            CASE
                WHEN v_percentage >= 90 THEN 'A+'
                WHEN v_percentage >= 80 THEN 'A'
                WHEN v_percentage >= 70 THEN 'B'
                WHEN v_percentage >= 60 THEN 'C'
                WHEN v_percentage >= 50 THEN 'D'
                ELSE 'F'
            END;

        v_result := 'PASS';

        v_remark :=
            CASE
                WHEN v_percentage >= 75 THEN 'Excellent performance.'
                WHEN v_percentage >= 60 THEN 'Good performance.'
                WHEN v_percentage >= 50 THEN 'Satisfactory performance.'
                ELSE 'Pass - Needs improvement.'
            END;

    END IF;


    DBMS_OUTPUT.PUT_LINE('==============================================');
    DBMS_OUTPUT.PUT_LINE('             LJICA SEMESTER RESULT');
    DBMS_OUTPUT.PUT_LINE('==============================================');

    DBMS_OUTPUT.PUT_LINE(
        'Attendance       : ' || v_attendance_pct || '%'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Theory Marks     : ' || v_theory_marks || ' / 70'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Practical Marks  : ' || v_practical_marks || ' / 30'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Assignment Marks : ' || v_assignment_counted || ' / 10'
    );

    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');

    IF v_result = 'PASS' THEN

        DBMS_OUTPUT.PUT_LINE(
            'Total            : ' || v_total || ' / 110'
        );

        DBMS_OUTPUT.PUT_LINE(
            'Percentage       : ' || v_percentage || '%'
        );

        DBMS_OUTPUT.PUT_LINE(
            'Grade            : ' || v_grade
        );

    ELSE

        DBMS_OUTPUT.PUT_LINE(
            'Total            : Not Applicable'
        );

        DBMS_OUTPUT.PUT_LINE(
            'Percentage       : Not Applicable'
        );

        DBMS_OUTPUT.PUT_LINE(
            'Grade            : Not Applicable'
        );

    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Result           : ' || v_result
    );

    DBMS_OUTPUT.PUT_LINE(
        'Remark           : ' || v_remark
    );

    DBMS_OUTPUT.PUT_LINE('==============================================');

END;
/
=========================OUTPUT==============================
==============================================
LJICA SEMESTER RESULT
==============================================
Attendance	 : 85%
Theory Marks	 : 55 / 70
Practical Marks  : 25 / 30
Assignment Marks : 8 / 10
----------------------------------------------
Total		 : 88 / 110
Percentage	 : 80%
Grade		 : A
Result		 : PASS
Remark		 : Excellent performance.
==============================================