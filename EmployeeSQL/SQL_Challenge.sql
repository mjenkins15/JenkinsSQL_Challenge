
/*DROP TABLE IF EXISTS departments CASCADE ;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;


CREATE TABLE departments (
	dept_no VARCHAR(10) NOT NULL PRIMARY KEY
	,dept_name VARCHAR(30) NOT NULL
);

SELECT * FROM departments;

CREATE TABLE employees (
	emp_no INTEGER NOT NULL PRIMARY KEY
	,birth_date DATE NOT NULL
	,first_name VARCHAR(30) NOT NULL
	,last_name VARCHAR(30) NOT NULL
	,gender VARCHAR(1) NOT NULL
	,hire_date DATE NOT  NULL
);
 
SELECT * FROM employees;

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL 
	,dept_no VARCHAR (10) NOT NULL
	,from_date DATE NOT NULL
	,to_date DATE NOT NULL
	,FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	,FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager(
	dept_no VARCHAR (10) NOT NULL 
	,emp_no INTEGER NOT NULL
	,from_date DATE NOT NULL
	,to_date DATE NOT NULL
	,FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
	,FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM dept_manager;


CREATE TABLE salaries (
	emp_no INTEGER NOT NULL
	,salary INTEGER NOT NULL
	,from_date DATE NOT NULL
	,to_date DATE NOT NULL
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

CREATE TABLE titles (
	emp_no INTEGER NOT NULL
	,title VARCHAR(30) NOT NULL
	,from_date DATE NOT NULL
	,to_date DATE NOT NULL
	,FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM titles;
*/

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;

--#1
SELECT employees.emp_no
	,employees.last_name
	,employees.first_name
	,employees.gender
	,salaries.salary
FROM employees INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;
 
--#2
SELECT employees.first_name
	,employees.last_name
	,employees.hire_date
FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
	
--#3
SELECT departments.dept_no
	,departments.dept_name
	,dept_manager.emp_no
	,employees.last_name
	,employees.first_name
	,employees.hire_date
	,dept_manager.to_date
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no

--4)
SELECT dept_emp.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

--5)
SELECT employees.first_name
	,employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
	
--6)
SELECT dept_emp.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7)
SELECT dept_emp.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8)
SELECT last_name,COUNT (last_name)
FROM employees
	GROUP BY last_name
	ORDER BY last_name DESC;
	