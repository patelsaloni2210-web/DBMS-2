SET SERVEROUTPUT ON;
DECLARE
v_city VARCHAR2(50):='Gujarat';
v_num NUMBER:=100;
BEGIN
    DBMS_OUTPUT.PUT_LINE('OUTER BLOCK');
    DBMS_OUTPUT.PUT_LINE('City : '||v_city);
    DBMS_OUTPUT.PUT_LINE('NUMBER : '||v_num);
    
        DECLARE
         v_city VARCHAR2(50):='Ahmedabad';
         v_num NUMBER:=200;
         BEGIN
           DBMS_OUTPUT.PUT_LINE('MIDDLE BLOCK');
           DBMS_OUTPUT.PUT_LINE('City : '||v_city);
           DBMS_OUTPUT.PUT_LINE('NUMBER : '||v_num); 
            DECLARE
            v_num NUMBER:=300;
            BEGIN
                 DBMS_OUTPUT.PUT_LINE('INNER BLOCK');
                 DBMS_OUTPUT.PUT_LINE('NUMBER : '||v_num);
            END;
        END;
      DBMS_OUTPUT.PUT_LINE('City : '||v_city);
    DBMS_OUTPUT.PUT_LINE('NUMBER : '||v_num);
    END;
    /   
====================================================OUTPUT=================================================

OUTER BLOCK
City : Gujarat
NUMBER : 100
MIDDLE BLOCK
City : Ahmedabad
NUMBER : 200
INNER BLOCK
NUMBER : 200
City : Gujarat
NUMBER : 100

