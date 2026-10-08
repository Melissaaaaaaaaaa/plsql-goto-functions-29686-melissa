SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TESTING INDIVIDUAL FUNCTIONS ---');
    DBMS_OUTPUT.PUT_LINE('Annual Salary (5000): ' || fn_annual_salary(5000));
    DBMS_OUTPUT.PUT_LINE('Tax for 2500 (10%): ' || fn_calculate_tax(2500));
    DBMS_OUTPUT.PUT_LINE('Tax for 5000 (20%): ' || fn_calculate_tax(5000));
    DBMS_OUTPUT.PUT_LINE('Tax for 10000 (30%): ' || fn_calculate_tax(10000));
    DBMS_OUTPUT.PUT_LINE('Dept Name (30): ' || fn_dept_name(30));
    DBMS_OUTPUT.PUT_LINE('Dept Name (999): ' || fn_dept_name(999));
    DBMS_OUTPUT.PUT_LINE('Years of service (2020-01-01): ' || fn_years_of_service(TO_DATE('2020-01-01', 'YYYY-MM-DD')));
END;
/