-- List employee number, last name, first name, gender, and salary.
select e.emp_no, last_name, first_name, gender, salary 
from employees as e
left join salaries as s 
on e.emp_no = s.emp_no
order by emp_no desc;
	
-- List employees hired in 1986.
select emp_no, hire_date, last_name, first_name 
from employees
where extract(year from hire_date) = 1986
order by hire_date;

-- List department managers with department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no, dept_name, e.emp_no, first_name, last_name, from_date, to_date
from departments as d, employees as e, dept_manager as dm
where d.dept_no = dm.dept_no and dm.emp_no = e.emp_no;
	
-- List department of each employee with employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where e.emp_no = de.emp_no and de.dept_no = d.dept_no;
	
-- List all employees with first name 'Hercules' and last name beginning with B.
select * from employees
where first_name = 'Hercules' and last_name like 'B%';
	
-- List all employees in the Sales department including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
join dept_emp as de 
on d.dept_no = de.dept_no
join employees as e
on de.emp_no = e.emp_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names
select last_name, count(last_name)
from employees
group by last_name
order by count desc;
	
--Epilogue
select * from employees
where emp_no = 499942;