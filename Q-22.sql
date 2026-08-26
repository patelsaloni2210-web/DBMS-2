SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31; 

    v_qty     NUMBER;
    v_price   NUMBER;
    v_coupon  NUMBER;

    v_gross   NUMBER;
    v_disc    NUMBER;
    v_taxable NUMBER;
    v_cgst    NUMBER;
    v_sgst    NUMBER;
    v_total   NUMBER;

    c_cgst_rate CONSTANT NUMBER := 9;
    c_sgst_rate CONSTANT NUMBER := 9;

BEGIN
    v_qty   := MOD(v_roll_no, 5) + 2;
    v_price := v_roll_no * 100 + 400;

    
    v_coupon := NULL;

    v_gross := v_qty * v_price;

    v_disc := v_gross * NVL(v_coupon, 0) / 100;

    v_taxable := v_gross - v_disc;

    v_cgst := v_taxable * c_cgst_rate / 100;
    v_sgst := v_taxable * c_sgst_rate / 100;

    v_total := ROUND(v_taxable + v_cgst + v_sgst);

    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('          KIRANA STORE BILL');
    DBMS_OUTPUT.PUT_LINE('======================================');

    DBMS_OUTPUT.PUT_LINE('Quantity        : ' || v_qty);
    DBMS_OUTPUT.PUT_LINE('Price/Item      : Rs.' ||
                         TO_CHAR(v_price, '99,999.00'));

    DBMS_OUTPUT.PUT_LINE(
        'Gross Amount    : Rs.' ||
        TO_CHAR(v_gross, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Discount        : Rs.' ||
        TO_CHAR(v_disc, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        NVL2(v_coupon,
             'Coupon applied: ' || v_coupon || '%',
             'No coupon')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Taxable Amount  : Rs.' ||
        TO_CHAR(v_taxable, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'CGST @9%        : Rs.' ||
        TO_CHAR(v_cgst, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'SGST @9%        : Rs.' ||
        TO_CHAR(v_sgst, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Final Total     : Rs.' ||
        TO_CHAR(v_total, '99,999')
    );

    DBMS_OUTPUT.PUT_LINE('======================================');


    

    v_coupon := 10;

    v_gross := v_qty * v_price;

    v_disc := v_gross * NVL(v_coupon, 0) / 100;

    v_taxable := v_gross - v_disc;

    v_cgst := v_taxable * c_cgst_rate / 100;
    v_sgst := v_taxable * c_sgst_rate / 100;

    v_total := ROUND(v_taxable + v_cgst + v_sgst);

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('       KIRANA STORE BILL - COUPON');
    DBMS_OUTPUT.PUT_LINE('======================================');

    DBMS_OUTPUT.PUT_LINE('Quantity        : ' || v_qty);
    DBMS_OUTPUT.PUT_LINE('Price/Item      : Rs.' ||
                         TO_CHAR(v_price, '99,999.00'));

    DBMS_OUTPUT.PUT_LINE(
        'Gross Amount    : Rs.' ||
        TO_CHAR(v_gross, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Discount        : Rs.' ||
        TO_CHAR(v_disc, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        NVL2(v_coupon,
             'Coupon applied: ' || v_coupon || '%',
             'No coupon')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Taxable Amount  : Rs.' ||
        TO_CHAR(v_taxable, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'CGST @9%        : Rs.' ||
        TO_CHAR(v_cgst, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'SGST @9%        : Rs.' ||
        TO_CHAR(v_sgst, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Final Total     : Rs.' ||
        TO_CHAR(v_total, '99,999')
    );

    DBMS_OUTPUT.PUT_LINE('======================================');

END;
/

===================================OUTPUT=================================

======================================
KIRANA STORE BILL
======================================
Quantity	: 3
Price/Item	: Rs.  3,500.00
Gross Amount	: Rs. 10,500.00
Discount	: Rs.	    .00
No coupon
Taxable Amount	: Rs. 10,500.00
CGST @9%	: Rs.	 945.00
SGST @9%	: Rs.	 945.00
Final Total	: Rs. 12,390
======================================
======================================
KIRANA STORE BILL - COUPON
======================================
Quantity	: 3
Price/Item	: Rs.  3,500.00
Gross Amount	: Rs. 10,500.00
Discount	: Rs.  1,050.00
Coupon applied: 10%
Taxable Amount	: Rs.  9,450.00
CGST @9%	: Rs.	 850.50
SGST @9%	: Rs.	 850.50
Final Total	: Rs. 11,151
======================================