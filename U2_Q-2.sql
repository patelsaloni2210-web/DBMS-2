SET SERVEROUTPUT ON;

DECLARE
    v_salary NUMBER := 1000000;   -- Rs.10,00,000

    v_standard_deduction CONSTANT NUMBER := 75000;

    v_taxable_income NUMBER;
    v_tax NUMBER := 0;
    v_monthly_tds NUMBER;
    v_monthly_salary NUMBER;

BEGIN

    v_taxable_income := v_salary - v_standard_deduction;

    CASE
        WHEN v_taxable_income <= 300000 THEN
            v_tax := 0;

        WHEN v_taxable_income <= 700000 THEN
            v_tax := (v_taxable_income - 300000) * 0.05;

        WHEN v_taxable_income <= 1000000 THEN
            v_tax := (700000 - 300000) * 0.05
                   + (v_taxable_income - 700000) * 0.10;

        WHEN v_taxable_income <= 1200000 THEN
            v_tax := (700000 - 300000) * 0.05
                   + (1000000 - 700000) * 0.10
                   + (v_taxable_income - 1000000) * 0.15;

        WHEN v_taxable_income <= 1500000 THEN
            v_tax := (700000 - 300000) * 0.05
                   + (1000000 - 700000) * 0.10
                   + (1200000 - 1000000) * 0.15
                   + (v_taxable_income - 1200000) * 0.20;

        ELSE
            v_tax := (700000 - 300000) * 0.05
                   + (1000000 - 700000) * 0.10
                   + (1200000 - 1000000) * 0.15
                   + (1500000 - 1200000) * 0.20
                   + (v_taxable_income - 1500000) * 0.30;
    END CASE;

    v_monthly_tds := v_tax / 12;

    v_monthly_salary := (v_salary - v_tax) / 12;

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('       INDIAN INCOME TAX CALCULATOR');
    DBMS_OUTPUT.PUT_LINE('             FY 2024-25');
    DBMS_OUTPUT.PUT_LINE('========================================');

    DBMS_OUTPUT.PUT_LINE(
        'Gross Salary       : Rs.' ||
        TO_CHAR(v_salary, '99,99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Standard Deduction : Rs.' ||
        TO_CHAR(v_standard_deduction, '99,99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Taxable Income     : Rs.' ||
        TO_CHAR(v_taxable_income, '99,99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Total Tax          : Rs.' ||
        TO_CHAR(v_tax, '99,99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Monthly TDS        : Rs.' ||
        TO_CHAR(v_monthly_tds, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Monthly Take-home  : Rs.' ||
        TO_CHAR(v_monthly_salary, '99,999.00')
    );

    IF v_tax = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'No tax this year - save more with PPF/ELSS!'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('========================================');

END;
/

====================Output=============================================
========================================
INDIAN INCOME TAX CALCULATOR
FY 2024-25
========================================
Gross Salary	   : Rs. 10,00,000.00
Standard Deduction : Rs.    75,000.00
Taxable Income	   : Rs.  9,25,000.00
Total Tax	   : Rs.    42,500.00
Monthly TDS	   : Rs.  3,541.67
Monthly Take-home  : Rs. 79,791.67
========================================