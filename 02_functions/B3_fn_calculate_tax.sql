CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_salary IN NUMBER
) RETURN NUMBER
DETERMINISTIC
IS
    v_tax NUMBER := 0;
BEGIN
    IF p_salary IS NULL OR p_salary <= 0 THEN
        RETURN 0;
    END IF;

    IF p_salary <= 3000 THEN
        v_tax := p_salary * 0.10;
    ELSIF p_salary <= 7000 THEN
        v_tax := p_salary * 0.20;
    ELSE
        v_tax := p_salary * 0.30;
    END IF;

    RETURN ROUND(v_tax, 2);
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END fn_calculate_tax;
/