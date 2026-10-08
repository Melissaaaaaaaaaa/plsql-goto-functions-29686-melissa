SET SERVEROUTPUT ON;

DECLARE
    v_emp_id     employees.employee_id%TYPE := 101;
    v_salary     employees.salary%TYPE;
    v_first_name employees.first_name%TYPE;
    v_review     VARCHAR2(100);
BEGIN
    SELECT first_name, salary 
    INTO v_first_name, v_salary
    FROM employees
    WHERE employee_id = v_emp_id;

    v_review := CASE 
        WHEN v_salary < 3000 THEN 'Needs Urgent Review / Salary Increase.'
        WHEN v_salary BETWEEN 3000 AND 7000 THEN 'Standard Range / Periodic Review.'
        ELSE 'Competitive Range / Retention Review.'
    END;

    DBMS_OUTPUT.PUT_LINE('Employee ' || v_first_name || ' earns ' || v_salary || ': ' || v_review);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ID not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/