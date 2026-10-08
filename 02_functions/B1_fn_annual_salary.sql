CREATE OR REPLACE FUNCTION fn_annual_salary (
    p_monthly_salary IN NUMBER
) RETURN NUMBER
DETERMINISTIC
IS
BEGIN
    IF p_monthly_salary IS NULL OR p_monthly_salary < 0 THEN
        RETURN 0;
    END IF;
    RETURN p_monthly_salary * 12;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END fn_annual_salary;
/