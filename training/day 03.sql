SET SERVEROUTPUT ON;

    DECLARE
        v_number        NUMBER := 0;
    BEGIN
--        FOR i IN 1 .. 10
--        LOOP
--            dbms_output.put_line(i);
--        END LOOP;

--        WHILE v_number < 10
--        LOOP
--            v_number := v_number + 2;
--            
--            dbms_output.put_line(v_number);            
--        END LOOP;

        LOOP
            v_number := v_number + 2;

            dbms_output.put_line(v_number);            

            EXIT WHEN v_number > 10;
        END LOOP;

        dbms_output.put_line('Hello world!');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Doh!');
            RAISE;
    END;
    /