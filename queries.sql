
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,e.sex
	,s.salary
FROM
	employees e
	JOIN salaries s ON e.emp_no = s.emp_no
;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT
	employees.first_name
	,employees.last_name
	,employees.hire_date
FROM
	employees
WHERE 1=1
	AND employees.hire_date BETWEEN '1/1/1986' AND '12/31/1986'
;

-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
WITH managers AS (
SELECT
	d.dept_no
	,d.dept_name
	,m.emp_no
FROM
	departments d
	JOIN deptmanagers m ON m.dept_no = d.dept_no
)
SELECT
	managers.dept_no
	,managers.dept_name
	,managers.emp_no
	,e.last_name
	,e.first_name
FROM
	employees e
	JOIN managers ON managers.emp_no = e.emp_no
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
WITH depts AS (
SELECT
	d.dept_no
	,d.dept_name
	,m.emp_no
FROM
	departments d
	JOIN deptemp m ON m.dept_no = d.dept_no
)
SELECT
	depts.dept_no
	,depts.dept_name
	,depts.emp_no
	,e.last_name
	,e.first_name
FROM
	employees e
	JOIN depts ON depts.emp_no = e.emp_no
;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
	first_name
	,last_name
	,sex
FROM
	employees
WHERE 1=1
	AND first_name = 'Hercules'
	AND last_name ILIKE 'B%'
;


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
WITH deptnames AS (
SELECT
	d.dept_no
	,d.dept_name
	,de.emp_no
FROM
	departments d
	JOIN deptemp de ON de.dept_no = d.dept_no
)

SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,deptnames.dept_name
FROM
	employees e
	JOIN deptnames ON deptnames.emp_no = e.emp_no
WHERE 1=1
	AND deptnames.dept_name = 'Sales'
;


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
WITH deptnames AS (
SELECT
	d.dept_no
	,d.dept_name
	,de.emp_no
FROM
	departments d
	JOIN deptemp de ON de.dept_no = d.dept_no
)

SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,deptnames.dept_name
FROM
	employees e
	JOIN deptnames ON deptnames.emp_no = e.emp_no
WHERE 1=1
	AND deptnames.dept_name = 'Sales' OR deptnames.dept_name = 'Development'
;
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT 
	last_name
	, COUNT(last_name) AS "freq count"
FROM
	employees
GROUP BY last_name
ORDER BY "freq count" DESC
;


SELECT
	*
FROM
	employees
WHERE
	emp_no = 499942
;


