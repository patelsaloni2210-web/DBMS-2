SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31;

    v_balance NUMBER;
    v_withdraw NUMBER;
    v_choice NUMBER := 1;

    v_txns NUMBER := 0;
    v_total_withdrawn NUMBER := 0;

    v_iteration NUMBER := 0;

BEGIN
    v_balance := v_roll_no * 500 + 5000;

    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('           ATM MACHINE');
    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE(
        'Opening Balance : Rs.' || v_balance
    );

    LOOP
        v_iteration := v_iteration + 1;


        IF v_iteration = 1 THEN
            v_choice := 1;
            v_withdraw := 1000;

        ELSIF v_iteration = 2 THEN
            v_choice := 1;
            v_withdraw := 1500;

        ELSIF v_iteration = 3 THEN
            v_choice := 1;
            v_withdraw := 500;

        ELSIF v_iteration = 4 THEN
            v_choice := 1;
            v_withdraw := 1000;

        ELSE
            v_choice := 3;
        END IF;


        EXIT WHEN v_choice = 3 OR v_balance = 0;


        IF v_choice = 1 THEN

            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE(
                'Withdrawal Request : Rs.' || v_withdraw
            );

            IF v_withdraw <= 0 THEN

                DBMS_OUTPUT.PUT_LINE(
                    'ERROR: Withdrawal must be greater than 0.'
                );

            ELSIF MOD(v_withdraw, 100) <> 0 THEN

                DBMS_OUTPUT.PUT_LINE(
                    'ERROR: Withdrawal must be a multiple of Rs.100.'
                );

            ELSIF v_withdraw > 10000 THEN

                DBMS_OUTPUT.PUT_LINE(
                    'ERROR: Maximum withdrawal per transaction is Rs.10,000.'
                );

            ELSIF v_withdraw > v_balance THEN

                DBMS_OUTPUT.PUT_LINE(
                    'ERROR: Insufficient balance.'
                );

            ELSE
                v_balance := v_balance - v_withdraw;

                v_txns := v_txns + 1;

                v_total_withdrawn :=
                    v_total_withdrawn + v_withdraw;

                DBMS_OUTPUT.PUT_LINE(
                    'Transaction Status : SUCCESS'
                );

                DBMS_OUTPUT.PUT_LINE(
                    'Amount Withdrawn   : Rs.' || v_withdraw
                );

                DBMS_OUTPUT.PUT_LINE(
                    'Remaining Balance  : Rs.' || v_balance
                );

            END IF;

        END IF;

    END LOOP;


    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('             FINAL SUMMARY');
    DBMS_OUTPUT.PUT_LINE('======================================');

    DBMS_OUTPUT.PUT_LINE(
        'Transactions Done : ' || v_txns
    );

    DBMS_OUTPUT.PUT_LINE(
        'Total Withdrawn   : Rs.' || v_total_withdrawn
    );

    DBMS_OUTPUT.PUT_LINE(
        'Closing Balance   : Rs.' || v_balance
    );

    DBMS_OUTPUT.PUT_LINE('======================================');

END;
/

===================OUTPUT=======================================
======================================
ATM MACHINE
======================================
Opening Balance : Rs.20500
Withdrawal Request : Rs.1000
Transaction Status : SUCCESS
Amount Withdrawn   : Rs.1000
Remaining Balance  : Rs.19500
Withdrawal Request : Rs.1500
Transaction Status : SUCCESS
Amount Withdrawn   : Rs.1500
Remaining Balance  : Rs.18000
Withdrawal Request : Rs.500
Transaction Status : SUCCESS
Amount Withdrawn   : Rs.500
Remaining Balance  : Rs.17500
Withdrawal Request : Rs.1000
Transaction Status : SUCCESS
Amount Withdrawn   : Rs.1000
Remaining Balance  : Rs.16500
======================================
FINAL SUMMARY
======================================
Transactions Done : 4
Total Withdrawn   : Rs.4000
Closing Balance   : Rs.16500
======================================
