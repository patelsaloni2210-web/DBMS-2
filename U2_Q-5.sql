SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 31;

    -- Part A
    v_n NUMBER;
    v_a NUMBER := 0;
    v_b NUMBER := 1;
    v_c NUMBER;

    -- Part B
    v_fib NUMBER;
    v_divisor NUMBER;
    v_is_prime BOOLEAN;

    -- Part C
    v_num NUMBER;
    v_d NUMBER;
    v_prime BOOLEAN;
    v_prime_count NUMBER := 0;

    -- Part D
    v_x NUMBER := 48;
    v_y NUMBER := 18;
    v_a_gcd NUMBER;
    v_b_gcd NUMBER;
    v_r NUMBER;
    v_gcd NUMBER;

    v_perfect_num NUMBER := 28;
    v_div NUMBER;
    v_sum NUMBER := 0;

BEGIN


    v_n := 5 + MOD(v_roll_no, 8);

    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('PART A: FIBONACCI SERIES');
    DBMS_OUTPUT.PUT_LINE('======================================');

    DBMS_OUTPUT.PUT_LINE(
        'N = ' || v_n
    );

    v_a := 0;
    v_b := 1;

    DECLARE
        v_i NUMBER := 1;
    BEGIN

        WHILE v_i <= v_n LOOP

            DBMS_OUTPUT.PUT(v_a || ' ');

            v_c := v_a + v_b;
            v_a := v_b;
            v_b := v_c;

            v_i := v_i + 1;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('');

    END;


    v_a := 0;
    v_b := 1;

    DECLARE
        v_i NUMBER := 1;
    BEGIN

        WHILE v_i <= v_n LOOP

            v_fib := v_a;

            v_c := v_a + v_b;
            v_a := v_b;
            v_b := v_c;

            v_i := v_i + 1;

        END LOOP;

    END;

    v_is_prime := TRUE;

    IF v_fib < 2 THEN
        v_is_prime := FALSE;
    ELSE
        v_divisor := 2;

        WHILE v_divisor <= TRUNC(SQRT(v_fib)) LOOP

            IF MOD(v_fib, v_divisor) = 0 THEN
                v_is_prime := FALSE;
                EXIT;
            END IF;

            v_divisor := v_divisor + 1;

        END LOOP;
    END IF;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('PART B: PRIME CHECK');
    DBMS_OUTPUT.PUT_LINE(
        'Nth Fibonacci number = ' || v_fib
    );

    IF v_is_prime THEN
        DBMS_OUTPUT.PUT_LINE('Result: PRIME');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: NOT PRIME');
    END IF;



    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('PART C: PRIMES FROM 1 TO 100');
    DBMS_OUTPUT.PUT_LINE('======================================');

    v_num := 2;

    WHILE v_num <= 100 LOOP

        v_prime := TRUE;
        v_d := 2;

        WHILE v_d <= TRUNC(SQRT(v_num)) LOOP

            IF MOD(v_num, v_d) = 0 THEN
                v_prime := FALSE;
                EXIT;
            END IF;

            v_d := v_d + 1;

        END LOOP;

        IF v_prime THEN
            DBMS_OUTPUT.PUT(v_num || ' ');
            v_prime_count := v_prime_count + 1;
        END IF;

        v_num := v_num + 1;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(
        'Total primes = ' || v_prime_count
    );



    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('PART D: GCD USING EUCLIDEAN ALGORITHM');
    DBMS_OUTPUT.PUT_LINE('======================================');

    v_a_gcd := v_x;
    v_b_gcd := v_y;

    WHILE v_b_gcd != 0 LOOP

        v_r := MOD(v_a_gcd, v_b_gcd);

        v_a_gcd := v_b_gcd;
        v_b_gcd := v_r;

    END LOOP;

    v_gcd := v_a_gcd;

    DBMS_OUTPUT.PUT_LINE(
        'Numbers: ' || v_x || ' and ' || v_y
    );

    DBMS_OUTPUT.PUT_LINE(
        'GCD = ' || v_gcd
    );



    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('PART E: PERFECT NUMBER CHECK');
    DBMS_OUTPUT.PUT_LINE('======================================');

    v_sum := 0;
    v_div := 1;

    WHILE v_div <= TRUNC(v_perfect_num / 2) LOOP

        IF MOD(v_perfect_num, v_div) = 0 THEN
            v_sum := v_sum + v_div;
        END IF;

        v_div := v_div + 1;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'Number = ' || v_perfect_num
    );

    DBMS_OUTPUT.PUT_LINE(
        'Sum of divisors = ' || v_sum
    );

    IF v_sum = v_perfect_num THEN
        DBMS_OUTPUT.PUT_LINE(
            'Result: PERFECT NUMBER'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Result: NOT A PERFECT NUMBER'
        );
    END IF;

END;
/

=======================OUTPUT==============================
======================================
PART A: FIBONACCI SERIES
======================================
N = 12
0 1 1 2 3 5 8 13 21 34 55 89
PART B: PRIME CHECK
Nth Fibonacci number = 89
Result: PRIME
======================================
PART C: PRIMES FROM 1 TO 100
======================================
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97
Total primes = 25
======================================
PART D: GCD USING EUCLIDEAN ALGORITHM
======================================
Numbers: 48 and 18
GCD = 6
======================================
PART E: PERFECT NUMBER CHECK
======================================
Number = 28
Sum of divisors = 28
Result: PERFECT NUMBER
