CREATE OR REPLACE FUNCTION fn_years_of_service (
    p_hire_date IN DATE
) RETURN NUMBER
IS
    v_years NUMBER;
BEGIN
    IF p_hire_date IS NULL OR p_hire_date > SYSDATE THEN
        RETURN 0;
    END IF;
    v_years := FLOOR(MONTHS_BETWEEN(SYSDATE, p_hire_date) / 12);
    RETURN v_years;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END fn_years_of_service;
/