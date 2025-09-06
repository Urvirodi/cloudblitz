use class6;
desc department;
desc Emp_Personal_Detail;
desc employee25;

-- 1. Find the highest paid employee in each department along with department name.
select e.emp_name,e.salary,d.dept_name
from employee25 e
join department d on e.dept_id = d.dept_id
where e.salary =(
	select MAX(salary)
    from employee25
    where dept_id = e.dept_id
);

-- Q2. List employees who earn more than their manager’s salary.
select e.emp_name as employee,
	   e.salary as employee_salary,
       m.emp_name as manager,
       m.salary as managaer_salary
from employee25 e
join employee25 m
	on e.manager_id = m.emp_id
where e.salary > m.salary;

-- . Show department(s) where the average salary of employees is greater than the overall company average salary.
select d. dept_name, avg(e.salary) as dept_avg_salary
from employee25 e
join department d on e.dept_id = d.dept_id
group by d.dept_id ,d.dept_name
having avg(e.salary) > (select avg(salary) from employee25);

-- 4. Find employees whose age is more than 30 and are working in the same city
select e.emp_name,p.city,
		timestampdiff(year,p.dob,curdate()) as age
from employee25 e
join emp_personal_detail p on e.emp_id = d.emp_id
where timestampdiff(year,p.dob,curdate()) > 30
order by p.city,e.emp_name;

-- 5. Display employees who are the only employee in their department (single employee department).
select e.emp_name,d.dept_name
from employee25 e
join department d on e.dept_id = d.dept_id
group by e.dept_id,e.emp_id,d.dept_name,e.emp_name
having count(*) = 1

-- Show employees with duplicate city entries in Emp_Personal_Detail table (i.e., more than one employee from the same city).
Select e.emp_name, p.city
from employee25 e
join Emp_Personal_Detail p ON e.emp_id = p.emp_id
where p.city IN (
    select city
    from Emp_Personal_Detail
    group by city
    having count(*) > 1
);

-- 7. Display employees with email IDs that do not follow proper format (use REGEXP to detect invalid emails).
select e.emp_name, p.email
from employee25 e
join Emp_Personal_Detail p on e.emp_id = p.emp_id
where 


-- Q8. Find employees whose salary is within 10% of the highest salary in the company.
select emp_name, salary
from employee25
where salary >= (select max(salary)*0.09 from employee25);

--  List departments where all employees are Single (based on marital_status in Emp_Personal_Detail).
select d.dept_name
from department d
join employee25 on d.dept_id = e.dept_id
join emp_personal_detail p on e.emp_id = p.emp_id
group by d. dept_id , d.dept_name
having count(*) = sum(p.marital_status = 'single');

-- Q10. How to find the second highest salary in a table?
select MAX(salary)
from Employee25
where salary < (SELECT MAX(salary) from Employee25);

Q11. What is the difference between WHERE and HAVING clause?
where clause → filters rows before grouping.
having clause → filters groups after group by.


Q12. What are Aggregate functions in SQL? Explain with example.
Functions that work on a set of rows and return a single value.
Examples:
COUNT(*) → number of rows
SUM(salary) → total salary


Q13. Write a query to find duplicate records in a table.
select emp_name, COUNT(*)
from employee25
group by emp_name
having count(*) > 1;

Q14. Write a query to find employees who have the same salary as another employee.
select emp_name, salary
from Employee25 e1
where exist(
    select 1
    fromEmployee25 e2
    where e1.salary = e2.salary
      and e1.emp_id <> e2.emp_id
);


Q15. What is a Subquery? Difference between Correlated Subquery and Simple Subquery.
Subquery → a query inside another query.
Simple Subquery → runs independently 
Correlated Subquery → depends on outer query
(WHERE e.salary > (SELECT AVG(salary) FROM Employee25 WHERE dept_id = e.dept_id)).


Q16. List employees hired in year 2020 or later.
select emp_name, hire_date
from Employee25
where year(hire_date) >= 2020;


Q18. Explain Primary Key, Foreign Key, Unique Key differences?
Primary Key → uniquely identifies each row, cannot be NULL.
Foreign Key → references another table’s primary key, maintains relationships.
Unique Key → ensures column values are unique, but allows one NULL


Q19. What is the difference between DELETE, TRUNCATE, and DROP?
DELETE → removes rows.
TRUNCATE → removes all rows (faster)
DROP → deletes the table structure itself.


Q20. Difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN with example?
INNER JOIN → rows with matching values in both tables.
LEFT JOIN → all rows from left, matches from right (NULL if none).
RIGHT JOIN → all rows from right, matches from left (NULL if none).
FULL JOIN → all rows from both tables (MySQL uses UNION of LEFT + RIGHT).


https://docs.google.com/forms/d/e/1FAIpQLSd8-j-ZlEfwDtpOvjxNNhN0WHvK54vUlhUfNJu1rzPnuMaT0w/viewform?usp=sharing&ouid=112755961426482977665

