CREATE OR REPLACE FUNCTION fn_dept_name (
    p_department_id IN NUMBER
) RETURN VARCHAR2
IS
    v_dept_name departments.department_name%TYPE;
BEGIN
    IF p_department_id IS NULL THEN
        RETURN 'No Department';
    END IF;

    SELECT department_name 
    INTO v_dept_name 
    FROM departments 
    WHERE department_id = p_department_id;

    RETURN v_dept_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Unknown Department';
    WHEN OTHERS THEN
        RETURN 'Error Department';
END fn_dept_name;
/