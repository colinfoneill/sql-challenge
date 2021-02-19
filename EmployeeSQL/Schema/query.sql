--add foreign keys to the dept_emp table
ALTER TABLE dept_emp
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp
	ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
	
SELECT * FROM employees
WHERE emp_no = 499942;

--list employee number, last name, first name, sex, and salary for each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM
	employees AS e
	JOIN salaries AS s
		ON e.emp_no = s.emp_no;
		
--list first name, last name, hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
	WHERE hire_date LIKE '%1986';
	
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM
	dept_manager AS dm
	JOIN departments AS d
		ON dm.dept_no = d.dept_no
	JOIN employees AS e
		ON dm.emp_no = e. emp_no;
		
--list the department of each employee with the following information: employee number, last name, first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM
	employees AS e
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
	JOIN departments AS d
	ON de.dept_no = d.dept_no;
	
--list first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
--list all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM 
		employees AS e
		JOIN dept_emp AS de
			ON e.emp_no = de.emp_no
		JOIN departments AS d
			ON de.dept_no = d.dept_no
	WHERE dept_name = 'Sales';
	
--list all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM 
		employees AS e
		JOIN dept_emp AS de
			ON e.emp_no = de.emp_no
		JOIN departments AS d
			ON de.dept_no = d.dept_no
	WHERE dept_name = 'Sales'
		OR dept_name = 'Development';
		
--in descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(1) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;

--creating table to create bar chart by title
SELECT title, AVG(salary) AS "Average Salary"
FROM
    salaries
    JOIN employees
        ON employees.emp_no = salaries.emp_no
    JOIN titles
        ON titles.title_id = employees.emp_title_id
GROUP BY title;
	







