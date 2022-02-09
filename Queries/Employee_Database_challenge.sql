--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
Select emp_no, first_name, last_name from employees

--Retrieve the title, from_date, and to_date columns from the Titles table.
Select title, from_date, to_date from titles

--Join both tables on the primary key.
select e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
from employees as e
inner join titles as t
on e.emp_no=t.emp_no;

--Filter the data on the birth_date column to retrieve the employees
--who were born between 1952 and 1955.
--Then, order by the employee number.
select e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
into retirement_titles
from employees as e
inner join titles as t
on e.emp_no=t.emp_no
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no asc;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

--Retrieve the number of titles from the Unique Titles table
select count(title), title
into retiring_titles
from unique_titles
group by title
order by count desc;

--Retrieve the emp_no, first_name, last_name
--and birth_date columns from the Employees table.
--Retrieve the from_date and to_date columns from the Department Employee table.
--Retrieve the title column from the Titles table.
select distinct on(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	d.from_date, d.to_date,
	t.title
into mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
where (d.to_date='9999-01-01')
and (e.birth_date between '1965-01-01' and '1965-12-31')
order by emp_no asc;
