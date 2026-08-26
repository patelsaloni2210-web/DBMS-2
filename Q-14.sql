SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31;    

    c_gst     CONSTANT NUMBER := 18;

    v_plan     NUMBER;
    v_gst      NUMBER;
    v_total    NUMBER;
    v_index    NUMBER;

    v_plan_name VARCHAR2(30) := 'Jio Recharge';
BEGIN

    v_index := MOD(v_roll_no, 4) + 1;

    IF v_index = 1 THEN
        v_plan := 199;
    ELSIF v_index = 2 THEN
        v_plan := 299;
    ELSIF v_index = 3 THEN
        v_plan := 399;
    ELSE
        v_plan := 599;
    END IF;

    v_gst := v_plan * c_gst / 100;

    v_total := v_plan + v_gst;

    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('         MOBILE RECHARGE RECEIPT');
    DBMS_OUTPUT.PUT_LINE('======================================');

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Plan Name:', 18) || v_plan_name
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Base Price:', 18) ||
        'Rs.' || TO_CHAR(v_plan, '99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('GST @18%:', 18) ||
        'Rs.' || TO_CHAR(v_gst, '99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Total Payable:', 18) ||
        'Rs.' || TO_CHAR(v_total, '99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Validity Date:', 18) ||
        TO_CHAR(SYSDATE + 28, 'DD-MON-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE('======================================');

END;
/

============================OUTPUT=======================================================

======================================
MOBILE RECHARGE RECEIPT
======================================
Plan Name:	  Jio Recharge
Base Price:	  Rs.	 599.00
GST @18%:	  Rs.	 107.82
Total Payable:	  Rs.	 706.82
Validity Date:	  23-SEP-2026
======================================