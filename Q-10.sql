SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31;      

    v_c      NUMBER;
    v_f      NUMBER;
    v_k      NUMBER;

    v_f2     NUMBER := 98.6;
    v_c2     NUMBER;

BEGIN
    v_c := MOD(v_roll_no, 20) + 25;

    v_f := ROUND(v_c * 9 / 5 + 32, 1);

    v_k := v_c + 273.15;

    DBMS_OUTPUT.PUT_LINE('====================================');
    DBMS_OUTPUT.PUT_LINE('       TEMPERATURE CONVERTER');
    DBMS_OUTPUT.PUT_LINE('====================================');

    DBMS_OUTPUT.PUT_LINE(
        'Celsius     : ' || v_c || ' °C'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Fahrenheit  : ' || v_f || ' °F'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Kelvin      : ' || ROUND(v_k, 2) || ' K'
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------');

    v_c2 := (v_f2 - 32) * 5 / 9;

    DBMS_OUTPUT.PUT_LINE(
        'Given Fahrenheit : ' || v_f2 || ' °F'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Converted Celsius : ' || ROUND(v_c2, 1) || ' °C'
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        'C * 9 / 5 + 32  = ' || (v_c * 9 / 5 + 32)
    );

    DBMS_OUTPUT.PUT_LINE(
        'C * (9 / 5) + 32 = ' || (v_c * (9 / 5) + 32)
    );

    DBMS_OUTPUT.PUT_LINE('====================================');

END;
/

==================================================OUTPUT=================================================

====================================
TEMPERATURE CONVERTER
====================================
Celsius     : 36 °C
Fahrenheit  : 96.8 °F
Kelvin	    : 309.15 K
------------------------------------
Given Fahrenheit : 98.6 °F
Converted Celsius : 37 °C
------------------------------------
C * 9 / 5 + 32	= 96.8
C * (9 / 5) + 32 = 96.8
====================================