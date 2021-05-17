-- DATA ANALYSIS

-- Set schema search path
SET search_path TO showfinder,public;

-- Show employees table
SELECT * FROM employees


-- 1. Perform an INNER JOIN on employees and salaries table to show each employees, 
-- employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2. Select first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date like '%1986';

-- 3. Select the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, department_managers.emp_no, employees.last_name, employees.first_name
FROM department_managers 
INNER JOIN departments ON department_managers.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = department_managers.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN department_employees ON department_employees.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = department_employees.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN department_employees ON department_employees.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = department_employees.dept_no
WHERE departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN department_employees ON department_employees.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = department_employees.dept_no
WHERE departments.dept_name in ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC

