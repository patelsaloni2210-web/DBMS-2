SET SERVEROUTPUT ON;

<<bank>>
DECLARE
    v_bank          VARCHAR2(30) := 'LJ Bank';
    v_total_deposit NUMBER := 0;

BEGIN

    <<branch>>
    DECLARE
        v_branch VARCHAR2(30) := 'Ahmedabad';
        v_dep    NUMBER := 31 * 1000; 

    BEGIN

        bank.v_total_deposit := bank.v_total_deposit + v_dep;

        DBMS_OUTPUT.PUT_LINE('Branch: ' || v_branch);
        DBMS_OUTPUT.PUT_LINE('Deposit: Rs.' || v_dep);

        <<counter>>
        DECLARE
            v_token NUMBER := 101;

        BEGIN
            DBMS_OUTPUT.PUT_LINE('--------------------------------');
            DBMS_OUTPUT.PUT_LINE('Bank Name : ' || bank.v_bank);
            DBMS_OUTPUT.PUT_LINE('Branch    : ' || branch.v_branch);
            DBMS_OUTPUT.PUT_LINE('Token     : ' || v_token);
            DBMS_OUTPUT.PUT_LINE('--------------------------------');

        END counter;

    END branch;

    DBMS_OUTPUT.PUT_LINE(
        'Total Bank Deposit: Rs.' || v_total_deposit
    );

END bank;
/

=============================OUTPUT==========================================================================
Branch: Ahmedabad
Deposit: Rs.31000
--------------------------------
Bank Name : LJ Bank
Branch	  : Ahmedabad
Token	  : 101
--------------------------------
Total Bank Deposit: Rs.31000