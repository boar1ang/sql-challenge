--Database schema for sql-challenge homework
--Link to ERD : https://app.quickdatabasediagrams.com/#/d/8K5BCU

CREATE TABLE employees(
	emp_no SERIAL PRIMARY KEY NOT NULL,
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(30),
	gender VARCHAR(2),
	hire_date DATE
);

CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(25)
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(5), 
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(5),
	emp_no INT,
	from_date DATE,
	to_date DATE
);


CREATE TABLE titles(
	emp_no INT,
	title VARCHAR(25) NOT NULL,
	from_date DATE,
	to_date DATE
);

CREATE TABLE salaries(
	emp_no INT,
	salary BIGINT,
	from_date DATE,
	to_date DATE
);

