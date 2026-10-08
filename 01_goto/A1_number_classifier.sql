SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := 15;
BEGIN
    IF v_number < 0 THEN
        GOTO lbl_negative;
    ELSIF v_number = 0 THEN
        GOTO lbl_zero;
    ELSIF MOD(v_number, 2) = 0 THEN
        GOTO lbl_even;
    ELSE
        GOTO lbl_odd;
    END IF;

    <<lbl_negative>>
    DBMS_OUTPUT.PUT_LINE('The number ' || v_number || ' is NEGATIVE.');
    GOTO lbl_end;

    <<lbl_zero>>
    DBMS_OUTPUT.PUT_LINE('The number ' || v_number || ' is ZERO.');
    GOTO lbl_end;

    <<lbl_even>>
    DBMS_OUTPUT.PUT_LINE('The number ' || v_number || ' is POSITIVE EVEN.');
    GOTO lbl_end;

    <<lbl_odd>>
    DBMS_OUTPUT.PUT_LINE('The number ' || v_number || ' is POSITIVE ODD.');
    GOTO lbl_end;

    <<lbl_end>>
    NULL;
END;
/