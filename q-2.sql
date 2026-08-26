DECLARE
v_name VARCHAR2(50):='Saloni';
v_marks NUMBER(5,2):=89;
v_percentage NUMBER(5,2):= ROUND((v_marks/500)*100, 2); 
v_dob DATE;
v_passed BOOLEAN;
BEGIN 
  v_passed:=True;
  v_dob:=SYSDATE;
  dbms_output.put_line('Today date:- '|| v_dob);
  dbms_output.put_line('Name:- '||v_name); 
  dbms_output.put_line('Marks:- '||v_marks);
  dbms_output.put_line('percentage:- '|| v_percentage||'%');
  if v_passed then
  dbms_output.put_line('Pass');
else
  dbms_output.put_line('Fail');
end if;

END;
/