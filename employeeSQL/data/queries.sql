-- # 1 List the employee number, last name, first name, sex, and salary of each employee 
Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
order by e.emp_no;

-- # 2 List the first name, last name, and hire date for the employees who were hired in 1986 
Select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

-- # 3 List the manager of each department along with their department number, department name, employee number, last name, and first name.
select d.dept_name, d.dept_no, dept.emp_no, e.last_name, e.first_name
from dept_manager as dept
inner join departments as d
on dept.dept_no= d.dept_no
inner join employees as e
on dept.emp_no = e.emp_no;

-- # 4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.


-- # 5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name, last_name, sex
from employees
where first_name = ('Hercules') 
and last_name like 'B%';

-- # 6 List each employee in the Sales department, including their employee number, last name, and first name.

select dept.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
inner join dept_emp as dept
on dept.dept_no = d.dept_no
inner join employees as e
on e.emp_no = dept.emp_no
WHERE dept_name =('Sales');

-- # 7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select d.dept_name, dept.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
inner join dept_emp as dept
on dept.dept_no = d.dept_no
inner join employees as e
on e.emp_no = dept.emp_no
WHERE dept_name = ('Sales') 
or dept_name = ('Development');

-- # 8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;