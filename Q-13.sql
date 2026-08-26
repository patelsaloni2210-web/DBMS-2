SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31; 
    v_amt     NUMBER;

    v_n500    NUMBER;
    v_n200    NUMBER;
    v_n100    NUMBER;
    v_rem     NUMBER;

BEGIN
    v_amt := v_roll_no * 137 + 1000;

    v_n500 := TRUNC(v_amt / 500);
    v_rem  := MOD(v_amt, 500);

    v_n200 := TRUNC(v_rem / 200);
    v_rem  := MOD(v_rem, 200);

    v_n100 := TRUNC(v_rem / 100);
    v_rem  := MOD(v_rem, 100);

    DBMS_OUTPUT.PUT_LINE('====================================');
    DBMS_OUTPUT.PUT_LINE('          ATM NOTE SPLITTER');
    DBMS_OUTPUT.PUT_LINE('====================================');

    DBMS_OUTPUT.PUT_LINE(
        'Withdrawal Amount : Rs.' || v_amt
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        'Rs.500 Notes      : ' || v_n500
    );

    DBMS_OUTPUT.PUT_LINE(
        'Rs.200 Notes      : ' || v_n200
    );

    DBMS_OUTPUT.PUT_LINE(
        'Rs.100 Notes      : ' || v_n100
    );

    DBMS_OUTPUT.PUT_LINE(
        'Remaining Amount  : Rs.' || v_rem
    );

    DBMS_OUTPUT.PUT_LINE('====================================');

END;
/

======================OUTPUT========================================================================
====================================
ATM NOTE SPLITTER
====================================
Withdrawal Amount : Rs.5247
------------------------------------
Rs.500 Notes	  : 10
Rs.200 Notes	  : 1
Rs.100 Notes	  : 0
Remaining Amount  : Rs.47
====================================