SET SERVEROUTPUT ON;

DECLARE
    v_emp_id     employees.employee_id%TYPE := 101;
    v_salary     employees.salary%TYPE;
    v_first_name employees.first_name%TYPE;
BEGIN
    SELECT first_name, salary 
    INTO v_first_name, v_salary
    FROM employees
    WHERE employee_id = v_emp_id;

    IF v_salary < 3000 THEN
        GOTO lbl_low_salary;
    ELSIF v_salary BETWEEN 3000 AND 7000 THEN
        GOTO lbl_medium_salary;
    ELSE
        GOTO lbl_high_salary;
    END IF;

    <<lbl_low_salary>>
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_first_name || ' earns ' || v_salary || ': Needs Urgent Review / Salary Increase.');
    GOTO lbl_exit;

    <<lbl_medium_salary>>
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_first_name || ' earns ' || v_salary || ': Standard Range / Periodic Review.');
    GOTO lbl_exit;

    <<lbl_high_salary>>
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_first_name || ' earns ' || v_salary || ': Competitive Range / Retention Review.');
    GOTO lbl_exit;

    <<lbl_exit>>
    NULL;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_emp_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/