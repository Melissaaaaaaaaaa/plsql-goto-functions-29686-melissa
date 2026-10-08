SET SERVEROUTPUT ON;

DECLARE
    v_result VARCHAR2(100);
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TESTING PAYROLL VALIDATOR ---');
    v_result := fn_validate_payroll(101);
    DBMS_OUTPUT.PUT_LINE('Emp 101: ' || v_result);

    v_result := fn_validate_payroll(999);
    DBMS_OUTPUT.PUT_LINE('Emp 999: ' || v_result);
END;
/