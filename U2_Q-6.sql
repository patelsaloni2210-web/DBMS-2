SET SERVEROUTPUT ON;

DECLARE
    v_distance    NUMBER := 10;
    v_order_value NUMBER := 650;

    v_rain        BOOLEAN := TRUE;
    v_late_night  BOOLEAN := FALSE;
    v_festival    BOOLEAN := TRUE;
    v_peak_hour   BOOLEAN := FALSE;
    v_first_order BOOLEAN := TRUE;

    v_base_charge NUMBER := 0;
    v_rain_charge NUMBER := 0;
    v_night_charge NUMBER := 0;
    v_festival_charge NUMBER := 0;
    v_peak_charge NUMBER := 0;

    v_delivery NUMBER := 0;
    v_discount NUMBER := 0;
    v_grand_total NUMBER;

BEGIN


    IF v_distance < 3 THEN
        v_base_charge := 0;

    ELSIF v_distance <= 8 THEN
        v_base_charge := 29;

    ELSIF v_distance <= 15 THEN
        v_base_charge := 49;

    ELSE
        v_base_charge := 79;
    END IF;


    
    v_rain_charge :=
        CASE
            WHEN v_rain THEN v_base_charge * 0.20
            ELSE 0
        END;

    v_night_charge :=
        CASE
            WHEN v_late_night THEN v_base_charge * 0.15
            ELSE 0
        END;

    v_festival_charge :=
        CASE
            WHEN v_festival THEN v_base_charge * 0.10
            ELSE 0
        END;

    v_peak_charge :=
        CASE
            WHEN v_peak_hour THEN v_base_charge * 0.10
            ELSE 0
        END;



    v_delivery := v_base_charge
                  + v_rain_charge
                  + v_night_charge
                  + v_festival_charge
                  + v_peak_charge;



    IF v_order_value > 499 THEN

        v_discount := v_delivery;
        v_delivery := 0;

    ELSIF v_first_order THEN

        v_discount := v_delivery * 0.50;
        v_delivery := v_delivery - v_discount;

    END IF;


 
    v_delivery := ROUND(v_delivery);
    v_grand_total := ROUND(v_order_value + v_delivery);


 
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('          ZOMATO DELIVERY RECEIPT');
    DBMS_OUTPUT.PUT_LINE('==========================================');

    DBMS_OUTPUT.PUT_LINE(
        'Distance        : ' || v_distance || ' km'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Food Total      : Rs.' || v_order_value
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        'Base Delivery   : Rs.' || v_base_charge
    );

    DBMS_OUTPUT.PUT_LINE(
        'Rain (+20%)     : Rs.' || ROUND(v_rain_charge)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Late Night (+15%): Rs.' || ROUND(v_night_charge)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Festival (+10%) : Rs.' || ROUND(v_festival_charge)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Peak Hour (+10%): Rs.' || ROUND(v_peak_charge)
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

    IF v_order_value > 499 THEN
        DBMS_OUTPUT.PUT_LINE(
            'Discount        : FREE DELIVERY'
        );

    ELSIF v_first_order THEN
        DBMS_OUTPUT.PUT_LINE(
            'Discount        : 50% First Order'
        );

    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Discount        : None'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Final Delivery  : Rs.' || v_delivery
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        'Food Total      : Rs.' || v_order_value
    );

    DBMS_OUTPUT.PUT_LINE(
        'Grand Total     : Rs.' || v_grand_total
    );

    DBMS_OUTPUT.PUT_LINE('==========================================');

END;
/

=============================Output=========================
==========================================
ZOMATO DELIVERY RECEIPT
==========================================
Distance	: 10 km
Food Total	: Rs.650
------------------------------------------
Base Delivery	: Rs.49
Rain (+20%)	: Rs.10
Late Night (+15%): Rs.0
Festival (+10%) : Rs.5
Peak Hour (+10%): Rs.0
------------------------------------------
Discount	: FREE DELIVERY
Final Delivery	: Rs.0
------------------------------------------
Food Total	: Rs.650
Grand Total	: Rs.650
==========================================