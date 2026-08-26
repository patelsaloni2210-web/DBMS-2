SET SERVEROUTPUT ON;

DECLARE
    v_consumer_name VARCHAR2(50) := 'Saloni Patel';
    v_roll_no       NUMBER := 31; 

    v_units         NUMBER;
    v_energy        NUMBER;
    v_total         NUMBER;

    c_rate          CONSTANT NUMBER := 5;
    c_fixed         CONSTANT NUMBER := 70;

BEGIN
    v_units := v_roll_no * 10 + 50;

    v_energy := v_units * c_rate;

    v_total := v_energy + c_fixed;

    DBMS_OUTPUT.PUT_LINE('====================================');
    DBMS_OUTPUT.PUT_LINE('       TORRENT POWER BILL');
    DBMS_OUTPUT.PUT_LINE('====================================');

    DBMS_OUTPUT.PUT_LINE(
        'Consumer Name : ' || v_consumer_name
    );

    DBMS_OUTPUT.PUT_LINE(
        'Units Consumed: ' || v_units
    );

    DBMS_OUTPUT.PUT_LINE(
        'Energy Charge : Rs.' || ROUND(v_energy, 2)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Fixed Charge  : Rs.' || ROUND(c_fixed, 2)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Total         : Rs.' || ROUND(v_total, 2)
    );

    DBMS_OUTPUT.PUT_LINE('====================================');

END;
/

==============================================OUTPUT====================================================================
====================================
TORRENT POWER BILL
====================================
Consumer Name : Saloni Patel
Units Consumed: 360
Energy Charge : Rs.1800
Fixed Charge  : Rs.70
Total	      : Rs.1870
====================================