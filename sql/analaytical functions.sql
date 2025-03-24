-- 6. Assign a rank to employees based on their salary within each department.
-- select department_id,employee_id,salary, rank() over(PARTITION by department_id order by salary desc) as salary_rank from hr.EMPLOYEES


-- 7. Find the top 3 highest-paid employees in each department.


-- SELECT department_id, employee_id, salary
-- FROM (
--     SELECT department_id, employee_id, salary, 
--            RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
--     FROM hr.employees
-- )
-- WHERE salary_rank <= 3 order by department_id,salary_rank

-- WITH RankedEmployees AS (
--     SELECT 
--         employee_id,
--         first_name || ' ' || last_name AS employee_name,
--         salary,
--         department_id,
--         RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank_num
--     FROM hr.employees
-- )
-- SELECT 
--     employee_id, 
--     employee_name, 
--     salary, 
--     department_id, 
--     rank_num
-- FROM RankedEmployees
-- WHERE rank_num <= 3
-- ORDER BY department_id, rank_num;

-- 8. Identify the second highest salary in each department using DENSE_RANK().
-- Uses DENSE_RANK() to identify employees with the second-highest salary per department.
-- SELECT department_id, employee_id, salary
-- FROM (
--     SELECT department_id, employee_id, salary, 
--            DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
--     FROM HR.employees
-- ) WHERE salary_rank = 2;

--  WITH RankedEmployees AS (
--     SELECT 
--         employee_id,
--         first_name || ' ' || last_name AS employee_name,
--         salary,
--         department_id,
--         DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank_num
--     FROM hr.employees
-- )
-- SELECT 
--     employee_id, 
--     employee_name, 
--     salary, 
--     department_id, 
--     rank_num
-- FROM RankedEmployees
-- WHERE rank_num =2
-- ORDER BY department_id, rank_num;


-- 9. Compute the cumulative total salary of employees ordered by hire date.
-- select employee_id,salary,hire_date ,sum(salary) over(order by hire_date) as cum_salary from hr.EMPLOYEES

-- 10. Assign a row number to each employee in each department.
-- Uses ROW_NUMBER() to assign a unique row number per department.
-- select employee_id,department_id,ROW_NUMBER()over(PARTITION by department_id order by employee_id) as row_num from hr.EMPLOYEES


-- 11. Find the salary difference between each employee and the next highest-paid employee.
-- Uses LEAD() to compare an employee's salary with the next highest.
-- select employee_id,salary, LEAD(salary) over( order by salary desc) - salary as salary_diff from hr.EMPLOYEES

-- 12. Calculate the previous month’s salary for each employee using LAG().
-- Uses LAG() to get the previous salary entry for each employee.
-- select employee_id,salary,hire_date,LAG(salary) over(PARTITION by employee_id order by hire_date ) as pervious_salary from hr.EMPLOYEES

-- SELECT 
--     employee_id,
--     first_name || ' ' || last_name AS employee_name,
--     salary,
--     department_id,
--     hire_date,
--     LAG(salary) OVER (
--         PARTITION BY employee_id 
--         ORDER BY hire_date
--     ) AS previous_salary
-- FROM hr.employees
-- ORDER BY employee_id, hire_date;

-- 13. Identify employees whose salaries increased over time.
-- Uses LAG() to compare an employee's current and previous salaries.
-- WITH SalaryHistory AS (
--     SELECT employee_id, 
--            first_name || ' ' || last_name AS employee_name, 
--            salary, 
--            hire_date, 
--            LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS previous_salary
--     FROM hr.employees
-- )
-- SELECT * 
-- FROM SalaryHistory
-- WHERE salary > previous_salary;

-- SELECT employee_id, hire_date, salary, 
--        LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary,
--        CASE WHEN salary > LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) 
--             THEN 'Increased' ELSE 'Decreased' END AS salary_trend
-- FROM hr.employees;

-- 14. Find the average salary of employees who joined in each year.
-- Computes average salary grouped by year of hire.
-- select EXTRACT(year from hire_date) as year ,avg(salary) from hr.EMPLOYEES group by year order by year

-- 15. Count the number of employees in each job role.
-- Counts employees for each job role using GROUP BY.
-- select job_id,count(*) from hr.employees group by job_id


-- 16. Find the total salary expenditure for each manager's team.
-- Sums salaries of employees under each manager.
-- select manager_id,sum(salary) from hr.EMPLOYEES group by MANAGER_ID


-- 17. Find the highest-paid employee in each department.
-- Uses RANK() to find the highest-paid employee in each department.
-- select department_id,salary,employee_id from(
--   select department_id,salary,employee_id, rank() over(PARTITION by department_id order  by salary) as rank_salary from hr.EMPLOYEES
-- )where rank_salary =1;

-- WITH RankedEmployees AS (
--     SELECT 
--         employee_id,
--         first_name || ' ' || last_name AS employee_name,
--         salary,
--         department_id,
--         RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank_num
--     FROM hr.employees
-- )
-- SELECT 
--     employee_id, 
--     employee_name, 
--     salary, 
--     department_id, 
--     rank_num
-- FROM RankedEmployees
-- WHERE rank_num = 1
-- ORDER BY department_id, rank_num;

-- 18. Calculate the running total of salaries for employees hired in each department.
-- Uses SUM() OVER() to compute cumulative salary totals.
-- select department_id,employee_id,salary, sum(salary) over(PARTITION by department_id order by HIRE_DATE) as total_rumnning from hr.employees

-- 20. Rank employees within their department based on experience.
-- Uses RANK() to order employees by hire date per department.
-- select employee_id,salary,department_id,rank() over(PARTITION by department_id order by HIRE_DATE) as exper from hr.EMPLOYEES

-- 21. Find the difference between each employee’s salary and the department average.
-- Uses AVG() OVER() to compute salary difference from department average.
-- select department_id,salary,employee_id,salary - avg(salary) over(PARTITION by department_id) as salary_diff from hr.employees

-- 22. Find the department where the most employees have been hired.
-- Counts employees in each department and selects the highest.
-- select department_id,count(*) as total from hr.EMPLOYEES group by DEPARTMENT_ID order by total