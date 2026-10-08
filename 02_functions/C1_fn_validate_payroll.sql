CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_emp_id IN NUMBER
) RETURN VARCHAR2
IS
    v_salary        employees.salary%TYPE;
    v_hire_date     employees.hire_date%TYPE;
    v_dept_id       employees.department_id%TYPE;
    v_dept_count    NUMBER;
BEGIN
    IF p_emp_id IS NULL THEN
        RETURN 'INVALID: Employee ID is NULL';
    END IF;

    SELECT salary, hire_date, department_id
    INTO v_salary, v_hire_date, v_dept_id
    FROM employees
    WHERE employee_id = p_emp_id;

    IF v_salary <= 0 THEN
        RETURN 'INVALID: Salary must be positive';
    END IF;

    IF v_hire_date > SYSDATE THEN
        RETURN 'INVALID: Hire date is in the future';
    END IF;

    SELECT COUNT(*) 
    INTO v_dept_count
    FROM departments 
    WHERE department_id = v_dept_id;

    IF v_dept_count = 0 THEN
        RETURN 'INVALID: Department does not exist';
    END IF;

    RETURN 'VALID';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee does not exist';
    WHEN OTHERS THEN
        RETURN 'ERROR: ' || SQLERRM;
END fn_validate_payroll;
/