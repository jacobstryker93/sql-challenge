CREATE TABLE Title (
    Title_ID varchar   NOT NULL,
    Title varchar   NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (
        Title_ID
     )
);

CREATE TABLE Salaries (
    Emp_no int   NOT NULL,
    Salary money   NOT NULL
);

CREATE TABLE Employees (
    Emp_no int   NOT NULL,
    Emp_title varchar   NOT NULL,
    Birth_date date   NOT NULL,
    First_name varchar   NOT NULL,
    Last_name varchar   NOT NULL,
    Sex varchar   NOT NULL,
    Hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE Dept_Manager (
    Dept_no varchar   NOT NULL,
    Emp_no int   NOT NULL
);

CREATE TABLE Dept_Emp (
    Emp_no int   NOT NULL,
    Dept_no varchar   NOT NULL
);

CREATE TABLE Departments (
    Dept_no varchar   NOT NULL,
    Dept_name varchar   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_no )
	);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_Emp_title FOREIGN KEY(Emp_title)
REFERENCES Title (Title_ID);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM title;

--1
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no =salaries.emp_no;

--2
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '01-01-1986' AND '01-01-1987';

--3

--4
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

--5
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6
SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM dept_emp
JOIN employees ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'

--7
SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM dept_emp
JOIN employees ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--8
SELECT last_name,
COUNT (last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT (last_name) DESC;
