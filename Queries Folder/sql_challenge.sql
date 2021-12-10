--Deliverable 1
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
--INTO retirement_titles
FROM employees AS e
INNER JOIN dept_employee AS de
ON (e.emp_no = t.emp_no)
INNER JOIN titles AS t
ON (de.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
 DISTINCT ON (rt.emp_no)
--INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, from_date DESC;

SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles
from unique_titles as ut
GROUP BY ut.title
ORDER BY ut.count DESC;

--Challenge Deliverable 2
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligible
FROM employees AS e
INNER JOIN dept_employee AS de
ON (de.emp_no = e.emp_no)
INNER JOIN titles AS t
ON (t.emp_no = e.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
