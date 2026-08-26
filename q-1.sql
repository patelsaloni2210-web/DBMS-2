DECLARE
v_name varchar2(20):='Saloni';  
v_rollno Number :=31;
message varchar2(100):= 'Welcome To PL/SQL';

BEGIN 
  dbms_output.put_line('Name:- '||v_name); 
  dbms_output.put_line('Roll No :- '||v_rollno);
  dbms_output.put_line('Name:- '||message);
  dbms_output.put_line('Lucky Number:- '|| (v_rollno MOD 7+1));
END;
/