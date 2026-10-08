SET SERVEROUTPUT ON;

-- 1. ILLEGAL GOTO DEMONSTRATION
BEGIN
    GOTO inside_branch;
    IF 1 = 1 THEN
        <<inside_branch>>
        DBMS_OUTPUT.PUT_LINE('Inside IF block');
    END IF;
END;
/

-- 2. THE FIX
DECLARE
    v_status VARCHAR2(20) := 'PENDING';
BEGIN
    IF v_status = 'PENDING' THEN
        GOTO process_pending;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Status not pending.');
    GOTO finish;

    <<process_pending>>
    DBMS_OUTPUT.PUT_LINE('Processing pending transaction...');
    GOTO finish;

    <<finish>>
    DBMS_OUTPUT.PUT_LINE('Workflow completed successfully.');
END;
/