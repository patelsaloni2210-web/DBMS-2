SET SERVEROUTPUT ON;

DECLARE
    -- Input values
    v_monthly_salary NUMBER := 50000;
    v_existing_emi   NUMBER := 5000;
    v_loan_amount    NUMBER := 2000000;
    v_annual_rate    NUMBER := 9;
    v_tenure_months  NUMBER := 60;

    -- Variables
    v_monthly_rate   NUMBER;
    v_foir_limit     NUMBER;
    v_available_emi  NUMBER;
    v_emi            NUMBER;
    v_approved_amount NUMBER := 0;
    v_max_loan       NUMBER;
    v_test_loan      NUMBER;
    v_power          NUMBER;

    v_decision VARCHAR2(20);
    v_reason   VARCHAR2(100);

BEGIN

    -- Monthly interest rate
    v_monthly_rate := v_annual_rate / 12 / 100;

    -- FOIR limit = 40% of salary
    v_foir_limit := v_monthly_salary * 0.40;

    -- EMI available after existing EMI
    v_available_emi := v_foir_limit - v_existing_emi;

    -- Maximum loan = 60 times monthly salary
    v_max_loan := v_monthly_salary * 60;


    ------------------------------------------------------------
    -- Minimum salary check
    ------------------------------------------------------------

    IF v_monthly_salary < 25000 THEN

        v_approved_amount := 0;
        v_emi := 0;
        v_decision := 'REJECTED';
        v_reason := 'Salary is below Rs.25,000.';


    ------------------------------------------------------------
    -- Existing EMI exceeds FOIR
    ------------------------------------------------------------

    ELSIF v_available_emi <= 0 THEN

        v_approved_amount := 0;
        v_emi := 0;
        v_decision := 'REJECTED';
        v_reason := 'Existing EMI exceeds FOIR limit.';


    ELSE

        --------------------------------------------------------
        -- Calculate EMI for requested loan
        --------------------------------------------------------

        v_power := POWER(1 + v_monthly_rate, v_tenure_months);

        v_emi := (v_loan_amount * v_monthly_rate * v_power)
                 / (v_power - 1);


        --------------------------------------------------------
        -- Check affordability
        --------------------------------------------------------

        IF v_emi <= v_available_emi
           AND v_loan_amount <= v_max_loan THEN

            -- Requested loan is affordable
            v_approved_amount := v_loan_amount;

        ELSE

            -- Start checking from maximum allowed loan
            IF v_loan_amount < v_max_loan THEN
                v_test_loan := v_loan_amount;
            ELSE
                v_test_loan := v_max_loan;
            END IF;


            ----------------------------------------------------
            -- Reduce loan by Rs.10,000 until EMI fits
            ----------------------------------------------------

            WHILE v_test_loan > 0 LOOP

                v_power := POWER(
                    1 + v_monthly_rate,
                    v_tenure_months
                );

                v_emi := (v_test_loan * v_monthly_rate * v_power)
                         / (v_power - 1);


                IF v_emi <= v_available_emi THEN

                    v_approved_amount := v_test_loan;
                    EXIT;

                END IF;


                v_test_loan := v_test_loan - 10000;

            END LOOP;

        END IF;


        --------------------------------------------------------
        -- Calculate final EMI for approved amount
        --------------------------------------------------------

        IF v_approved_amount > 0 THEN

            v_power := POWER(
                1 + v_monthly_rate,
                v_tenure_months
            );

            v_emi := (v_approved_amount * v_monthly_rate * v_power)
                     / (v_power - 1);

        ELSE

            v_emi := 0;

        END IF;


        --------------------------------------------------------
        -- Decision using CASE
        --------------------------------------------------------

        v_decision :=
            CASE
                WHEN v_approved_amount = v_loan_amount
                     AND v_emi <= v_available_emi
                    THEN 'APPROVED'

                WHEN v_approved_amount > 0
                    THEN 'CONDITIONAL'

                ELSE 'REJECTED'
            END;


        --------------------------------------------------------
        -- Remark
        --------------------------------------------------------

        IF v_decision = 'APPROVED' THEN

            v_reason := 'Requested loan is affordable.';

        ELSIF v_decision = 'CONDITIONAL' THEN

            v_reason := 'Loan amount reduced to meet FOIR limit.';

        ELSE

            v_reason := 'Loan amount is not affordable.';

        END IF;

    END IF;


    ------------------------------------------------------------
    -- PRINT LOAN SUMMARY
    ------------------------------------------------------------

    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('       LOAN EMI AFFORDABILITY CHECKER');
    DBMS_OUTPUT.PUT_LINE('==========================================');

    DBMS_OUTPUT.PUT_LINE(
        'Monthly Salary    : Rs.' ||
        TO_CHAR(v_monthly_salary, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Existing EMI      : Rs.' ||
        TO_CHAR(v_existing_emi, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Requested Loan    : Rs.' ||
        TO_CHAR(v_loan_amount, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Annual Rate       : ' || v_annual_rate || '%'
    );

    DBMS_OUTPUT.PUT_LINE(
        'Tenure            : ' || v_tenure_months || ' months'
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        'FOIR Limit (40%)  : Rs.' ||
        TO_CHAR(v_foir_limit, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Available EMI     : Rs.' ||
        TO_CHAR(v_available_emi, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Maximum Loan      : Rs.' ||
        TO_CHAR(v_max_loan, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Calculated EMI    : Rs.' ||
        TO_CHAR(ROUND(v_emi), '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Approved Amount   : Rs.' ||
        TO_CHAR(v_approved_amount, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        'Decision          : ' || v_decision
    );

    DBMS_OUTPUT.PUT_LINE(
        'Remark            : ' || v_reason
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        'Existing EMI      : Rs.' ||
        TO_CHAR(v_existing_emi, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'New Loan EMI      : Rs.' ||
        TO_CHAR(ROUND(v_emi), '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Total Monthly EMI : Rs.' ||
        TO_CHAR(
            ROUND(v_existing_emi + v_emi),
            '99,99,999'
        )
    );

    DBMS_OUTPUT.PUT_LINE('==========================================');

END;
/

================================OUTPUT=======================================================

==========================================
LOAN EMI AFFORDABILITY CHECKER
==========================================
Monthly Salary	  : Rs.    50,000
Existing EMI	  : Rs.     5,000
Requested Loan	  : Rs. 20,00,000
Annual Rate	  : 9%
Tenure		  : 60 months
------------------------------------------
FOIR Limit (40%)  : Rs.    20,000
Available EMI	  : Rs.    15,000
Maximum Loan	  : Rs. 30,00,000
Calculated EMI	  : Rs.    14,946
Approved Amount   : Rs.  7,20,000
------------------------------------------
Decision	  : CONDITIONAL
Remark		  : Loan amount reduced to meet FOIR limit.
------------------------------------------
Existing EMI	  : Rs.     5,000
New Loan EMI	  : Rs.    14,946
Total Monthly EMI : Rs.    19,946
==========================================