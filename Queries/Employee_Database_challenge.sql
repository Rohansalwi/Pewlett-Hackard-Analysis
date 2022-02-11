--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name 
FROM employees

--Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles

--Join both tables on the primary key.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no=t.emp_no;

--Filter the data on the birth_date column to retrieve the employees
--who were born between 1952 and 1955.
--Then, order by the employee number.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no=t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--Retrieve the number of titles from the Unique Titles table
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

--Retrieve the emp_no, first_name, last_name
--and birth_date columns from the Employees table.
--Retrieve the from_date and to_date columns from the Department Employee table.
--Retrieve the title column from the Titles table.
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	d.from_date, d.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (d.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC;

--Additional tables for summary
--Current employees
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO current_employees
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no=t.emp_no
ORDER BY e.emp_no ASC;

--show counts of titles
SELECT COUNT(emp_no), emp_no
INTO emp_promo
FROM current_employees
GROUP BY emp_no
HAVING COUNT(emp_no) >= 3
ORDER BY COUNT ASC;

--get the titles of the employees
SELECT e.count,
	e.emp_no,
	t.title,
	t.from_date,
	t.to_date
INTO promo_list
FROM emp_promo AS e
INNER JOIN titles AS t
ON e.emp_no=t.emp_no
WHERE t.to_date='9999-01-01'
ORDER BY e.emp_no ASC;