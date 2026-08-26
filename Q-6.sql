SET SERVEROUTPUT ON;

DECLARE
    v_p        NUMBER := 100000; 
    v_r        NUMBER := 8;       
    v_t        NUMBER := 5;       

    v_si       NUMBER;
    v_ci       NUMBER;
    v_si_amt   NUMBER;
    v_ci_amt   NUMBER;
    v_diff_pct NUMBER;
BEGIN
   
    v_si := v_p * v_r * v_t / 100;

   
    v_ci := v_p * POWER(1 + v_r / 100, v_t) - v_p;

   
    v_si_amt := v_p + v_si;
    v_ci_amt := v_p + v_ci;

   
    v_diff_pct := (v_ci - v_si) / v_si * 100;

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('       BANK INTEREST CALCULATOR');
    DBMS_OUTPUT.PUT_LINE('========================================');

    DBMS_OUTPUT.PUT_LINE(
        'Principal       : Rs.' || TO_CHAR(v_p, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Rate            : ' || v_r || '%'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Years           : ' || v_t
    );

    DBMS_OUTPUT.PUT_LINE('----------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        'Simple Interest : Rs.' || TO_CHAR(v_si, '99,99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Compound Interest: Rs.' || TO_CHAR(v_ci, '99,99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE('----------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        'SI Final Amount : Rs.' || TO_CHAR(v_si_amt, '99,99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        'CI Final Amount : Rs.' || TO_CHAR(v_ci_amt, '99,99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        'SI vs CI Difference: ' ||
        TO_CHAR(v_diff_pct, '990.00') || '%'
    );

    DBMS_OUTPUT.PUT_LINE('----------------------------------------');

    IF v_diff_pct > 10 THEN
        DBMS_OUTPUT.PUT_LINE(
            'Tip: FD is better than savings account for this amount.'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('========================================');

END;
/

================================================OUTPUT=============================================================

Output:
========================================
BANK INTEREST CALCULATOR
========================================
Principal	: Rs.  1,00,000
Rate		: 8%
Years		: 5
----------------------------------------
Simple Interest : Rs.	 40,000.00
Compound Interest: Rs.	  46,932.81
----------------------------------------
SI Final Amount : Rs.  1,40,000.00
CI Final Amount : Rs.  1,46,932.81
SI vs CI Difference:   17.33%
----------------------------------------
Tip: FD is better than savings account for this amount.
========================================

