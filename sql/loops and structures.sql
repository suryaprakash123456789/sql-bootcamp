-- declare 
-- counter number:=1;
-- begin
--     while counter<=5 loop
--     dbms_output.put_line('counter' || counter);
--     counter:=counter+1;
--     end loop;
-- end;

-- declare 
-- counter number:=1;
-- begin
--     while counter<=10 loop
--     dbms_output.put_line('counter' || counter);
--     counter:=counter+2;
--     end loop;
-- end;

-- declare 
-- counter number:=10;
-- begin
--     while counter >1 loop
--     dbms_output.put_line('counter' || counter);
--     counter:=counter-1;
--     end loop;
-- end;

-- DECLARE
-- counter number:=1;
-- BEGIN
--     while counter<=5 LOOP
--     if counter=3 THEN
--     counter:=counter+1;
--     CONTINUE;  
--     end if;
--       dbms_output.PUT_LINE('counter' || counter);
--       counter:=counter+1;
--     end loop;
-- end;

-- declare 
-- i number:=1;
-- BEGIN
--     while i<=5 LOOP
--     if i=3 THEN
--     i:=i+1;
--     exit;
--     end if;
--     dbms_output.put_line('i' || i);
--     i:=i+1;
--     end loop;
-- end;

-- declare 
-- i number:=2;
-- BEGIN
--     while i<=10 LOOP
--     if MOD(i,2)=1 THEN
--     exit;
--     end if;
--     dbms_output.put_line('i' || i);
--     i:=i+1;
--     end loop;
-- end;

-- DECLARE
-- i number:=1;
-- BEGIN
--     while i<=6 loop
--     if MOD(i,3)=1 then
--      i:=i+1;
--     continue;
   
--     end if;
--     dbms_output.put_line('not div by 3' || i);
--     i:=i+1;
--     end loop;
-- end;

-- declare 
-- num number:=1;
-- sum number:=0;
-- begin
--     while num<=6 LOOP
--     sum:=sum+num;
--     if sum>=6 THEN
--     exit;
--     end if;
--     dbms_output.put_line('sum:' || sum);
--     num:=num+1;
--     end loop;
-- end;

DECLARE
   i NUMBER := 1;
-- BEGIN
--    WHILE i <= 5 LOOP
--       IF i IN (2, 4) THEN
--          i := i + 1;
--          CONTINUE;
--       END IF;
--       DBMS_OUTPUT.PUT_LINE('i: ' || i);
--       i := i + 1;
--    END LOOP;
-- END;


-- SET SERVEROUTPUT ON;