
----------------------------
--pull the data for retirement_titles.csv
Select Distinct employees.emp_no, employees.first_name, employees.last_name, 
Titles.title, Titles.from_date, Titles.to_date
from employees
inner join Titles on (employees.emp_no = Titles.emp_no)
where employees.birth_date  BETWEEN '1952-01-01' AND '1955-12-31'
order by emp_no


--------------------------
--pull the data for the unique_titles.csv
Select Distinct on (employees.emp_no) employees.emp_no, employees.first_name, employees.last_name, 
Titles.title --, Titles.from_date, Titles.to_date
into unique_titles
from employees
inner join Titles on (employees.emp_no = Titles.emp_no)
where employees.birth_date  BETWEEN '1952-01-01' AND '1955-12-31'
order by emp_no, from_date DESC;


------------------------
--pull the data for the retiring_titles.csv
Select count (title) , unique_titles.title
from unique_titles
group by title
order by count DESC


-------------------------
--pull the data for the MentorShip_Eligibility.csv
Select distinct on (employees.emp_no) employees.emp_no, employees.first_name, 
employees.last_name, employees.birth_date,
titles.title, dept_emp.from_date, dept_emp.to_date
into MentorShip_Eligibility
from employees
inner join Titles on (employees.emp_no = Titles.emp_no)
inner join dept_emp on (employees.emp_no = dept_emp.emp_no)

where dept_emp.to_date > '2021-11-04' AND
(employees.birth_date  BETWEEN '1965-01-01' AND '1965-12-31')
order by emp_no, from_date DESC