SET SERVEROUTPUT ON;

DECLARE
    v_roll_no     NUMBER := 31;

    v_p           NUMBER;
    v_annual_rate NUMBER := 9;
    v_years       NUMBER := 5;

    v_r           NUMBER;
    v_n           NUMBER;
    v_emi         NUMBER;
    v_total       NUMBER;
    v_interest    NUMBER;
    v_interest_pct NUMBER;

BEGIN
    v_p := v_roll_no * 10000 + 50000;

    v_r := v_annual_rate / 12 / 100;

    v_n := v_years * 12;

    v_emi := ROUND(
        v_p * v_r * POWER(1 + v_r, v_n) /
        (POWER(1 + v_r, v_n) - 1),
        2
    );

    v_total := ROUND(v_emi * v_n, 2);

    v_interest := ROUND(v_total - v_p, 2);

    v_interest_pct := ROUND(
        (v_interest / v_total) * 100,
        2
    );

    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('        SBI HOME LOAN EMI CALCULATOR');
    DBMS_OUTPUT.PUT_LINE('==========================================');

    DBMS_OUTPUT.PUT_LINE(
        'Principal Amount : Rs.' ||
        TO_CHAR(v_p, '99,99,99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Annual Rate      : ' || v_annual_rate || '%'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Loan Period      : ' || v_years || ' years'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Monthly EMI      : Rs.' ||
        TO_CHAR(v_emi, '99,99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Total Payment    : Rs.' ||
        TO_CHAR(v_total, '99,99,99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Total Interest   : Rs.' ||
        TO_CHAR(v_interest, '99,99,99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Interest %       : ' ||
        v_interest_pct || '%'
    );

    DBMS_OUTPUT.PUT_LINE('==========================================');

END;
/

================================================OUTPUT=================================================
==========================================
SBI HOME LOAN EMI CALCULATOR
==========================================
Principal Amount : Rs.	   3,60,000.00
Annual Rate	 : 9%
Loan Period	 : 5 years
Monthly EMI	 : Rs.	   7,473.01
Total Payment	 : Rs.	   4,48,380.60
Total Interest	 : Rs.	     88,380.60
Interest %	 : 19.71%
==========================================