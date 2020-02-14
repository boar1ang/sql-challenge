--SQL Queries for sql-challenge homework


--QUERY 1
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary
FROM employees e
	JOIN salaries s
		ON e.emp_no = s.emp_no
ORDER BY emp_no;


--QUERY 2
SELECT *
FROM employees
WHERE (hire_date BETWEEN '1986-01-01' AND '1986-12-31')
ORDER BY hire_date;


--QUERY 3
/*List the manager of each department with the following information: department number, department name, the manager's employee number,
last name, first name, and start and end employment dates.*/
SELECT 	e.first_name,
		e.last_name, 
		d.emp_no, 
		z.dept_name,
		d.dept_no, 
		d.from_date,
		d.to_date		
FROM dept_manager d
JOIN employees e
	ON d.emp_no = e.emp_no
JOIN departments z 
	ON d.dept_no = z.dept_no;

		
--QUERY 4
/*List the department of each employee with the following information: employee number, last name, first name, and department name.*/
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employees e
	JOIN dept_emp x 
		ON e.emp_no = x.emp_no 
		LEFT JOIN departments d
			ON d.dept_no = x.dept_no;
	
--Query 5
/*List all employees whose first name is "Hercules" and last names begin with "B."*/	 
SELECT first_name, last_name
FROM employees
WHERE ((first_name = 'Hercules' ) AND (last_name LIKE 'B%'));	


--QUERY 6
/*List all employees in the Sales department, including their employee number, last name, first name, and department name.*/
CREATE TABLE sales AS
	SELECT d.dept_name, x.emp_no
	FROM departments d
	JOIN dept_emp x
		ON d.dept_no = x.dept_no;

CREATE TABLE sales_dept AS
	SELECT *
	FROM sales s
	WHERE s.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, z.dept_name
FROM employees e	
JOIN sales_dept z
	ON e.emp_no = z.emp_no;

--Query 7
/*List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.*/
CREATE TABLE sales_dev AS
	SELECT *
	FROM sales s
	WHERE s.dept_name = 'Sales' OR s.dept_name = 'Development';

SELECT e.emp_no, e.last_name, e.first_name, v.dept_name
FROM employees e	
JOIN sales_dev v
	ON e.emp_no = v.emp_no;
	
--QUERY 8
/*In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/
SELECT last_name, COUNT(last_name) AS count_lname
FROM employees
GROUP BY last_name
ORDER BY count_lname DESC;



/*--------------BONUS: see sql-bonus.ipynb file--------------*/
SELECT MAX(salary)
FROM salaries;
--129492
SELECT MIN(salary)
FROM salaries;
--40000
SELECT COUNT(salary)
FROM salaries;
--300024
SELECT COUNT(DISTINCT(salary))
FROM salaries;
--50355
SELECT COUNT(salary)
FROM salaries
WHERE salary BETWEEN 31000 AND 45999;
--132682
--see "images/avg_sal_by_title.png"