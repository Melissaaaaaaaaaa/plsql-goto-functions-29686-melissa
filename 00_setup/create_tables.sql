BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE departments (
    department_id   NUMBER PRIMARY KEY,
    department_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
    employee_id   NUMBER PRIMARY KEY,
    first_name    VARCHAR2(50) NOT NULL,
    last_name     VARCHAR2(50) NOT NULL,
    salary        NUMBER(10, 2) NOT NULL,
    hire_date     DATE NOT NULL,
    department_id NUMBER REFERENCES departments(department_id)
);

INSERT INTO departments (department_id, department_name) VALUES (10, 'Administration');
INSERT INTO departments (department_id, department_name) VALUES (20, 'Human Resources');
INSERT INTO departments (department_id, department_name) VALUES (30, 'Information Technology');
INSERT INTO departments (department_id, department_name) VALUES (40, 'Finance');

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (101, 'Alice', 'Smith', 4500, TO_DATE('2018-03-15', 'YYYY-MM-DD'), 30);

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (102, 'Bob', 'Jones', 8200, TO_DATE('2021-07-01', 'YYYY-MM-DD'), 40);

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (103, 'Charlie', 'Brown', 2500, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 20);

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (104, 'Diana', 'Prince', 12000, TO_DATE('2015-11-20', 'YYYY-MM-DD'), 10);

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id)
VALUES (105, 'Evan', 'Wright', 6000, TO_DATE('2020-05-18', 'YYYY-MM-DD'), 30);

COMMIT;