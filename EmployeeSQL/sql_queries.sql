-- John Hopkins
-- GEGT BootCamp 2021
-- SQL Queries for Employee Database:
-- "A Mystery in Two Parts"
-- Data Analysis --
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.gender, salary.salary
FROM employee
JOIN salary
ON employee.emp_no = salary.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date
BETWEEN '1986-01-01'
AND '1986-12-31';


-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.
SELECT department.dept_no, department.dept_name, dept_mgr.emp_no, employee.last_name, employee.first_name
FROM department
JOIN dept_mgr
ON department.dept_no = dept_mgr.dept_no
JOIN employee 
ON dept_mgr.emp_no = employee.emp_no;

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM dept_emp
JOIN employee 
ON dept_emp.emp_no = employee.emp_no
JOIN department 
ON dept_emp.dept_no = department.dept_no
ORDER BY dept_name;

-- 5. List first name, last name, and sex for employees whose first name is
-- "Hercules" and last names begin with "B."
SELECT first_name, last_name, gender
FROM employee
WHERE first_name = 'Hercules'
AND last_name
LIKE 'B%';

-- 6. List all employees in the Sales department, including
-- their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM dept_emp
JOIN employee
ON dept_emp.emp_no = employee.emp_no
JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including
-- their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE
departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT last_name AS "LastName", COUNT (last_name) AS "Frequency"
FROM employee
GROUP BY last_name
ORDER BY "Frequency"
DESC;