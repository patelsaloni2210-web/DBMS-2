DECLARE
c_gst CONSTANT NUMBER := 18;
base_price NUMBER :=40000;
 v_cgst NUMBER:= base_price * 9/100;
 v_sgst NUMBER:= base_price * 9/100;
 v_total NUMBER:=base_price+v_cgst+v_sgst;

 BEGIN 
  dbms_output.put_line('Base Price :- '|| base_price);
  dbms_output.put_line('CGST:- '||v_cgst); 
  dbms_output.put_line('SGST:- '||v_sgst);
  dbms_output.put_line('Total:- '|| v_total);
 END;
 /
