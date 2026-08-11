USE hr_analytics_db;
#Total Employees
SELECT COUNT(*) AS total_employees
FROM employees;
#Active Employees
SELECT COUNT(*) AS active_employees
FROM employees
WHERE employment_status = 'Active';
#Employee Attrition Rate
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE 
            WHEN employment_status = 'Resigned' THEN 1 
            ELSE 0
        END) AS Resigned_Employees,
    ROUND(
        SUM(CASE 
                WHEN employment_status = 'Resigned' THEN 1 
                ELSE 0
            END) / COUNT(*) * 100,
        2
    ) AS Attrition_Rate
FROM employees;
#Department-wise Headcount
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM employees e
INNER JOIN departments d
    ON d.department_id = e.department_id
GROUP BY d.department_name;
#Gender Diversity Ratio
SELECT
    gender,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) / (SELECT COUNT(*) FROM employees) * 100,
        2
    ) AS gender_percentage
FROM employees
GROUP BY gender;
#Age Distribution
SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 30 THEN '25-30'
        WHEN age BETWEEN 31 AND 35 THEN '31-35'
        WHEN age BETWEEN 36 AND 40 THEN '36-40'
        ELSE 'Above 40'
    END AS age_group,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 30 THEN '25-30'
        WHEN age BETWEEN 31 AND 35 THEN '31-35'
        WHEN age BETWEEN 36 AND 40 THEN '36-40'
        ELSE 'Above 40'
    END;
#Average Employee Tenure
SELECT 
    ROUND(
        AVG(DATEDIFF(CURRENT_DATE(), hire_date)) / 365,
        2
    ) AS average_tenure_years
FROM employees;
#Employees by City
SELECT city,
       COUNT(*) AS employee_count
FROM employees
GROUP BY city;
#Average Employee Salary
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;
#Salary by Department
SELECT 
    d.department_name,
    ROUND(AVG(e1.salary), 2) AS avg_salary
FROM employees e1
INNER JOIN departments d
    ON e1.department_id = d.department_id
GROUP BY d.department_name;
#Highest-Paying Department
SELECT 
    d.department_name,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC
LIMIT 1;
#Highest-Paying Job Role
SELECT 
    e.designation,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees e
GROUP BY e.designation
ORDER BY avg_salary DESC
LIMIT 1;
#Bonus Distribution
SELECT 
    d.department_name,
    SUM(p.bonus) AS total_bonus,
    ROUND(AVG(p.bonus), 2) AS average_bonus
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN performance p
    ON e.employee_id = p.employee_id
GROUP BY d.department_name;
#Average Performance Rating
SELECT 
    ROUND(AVG(performance_rating), 2) AS average_performance_rating
FROM performance;
#Top Performers
SELECT 
    e.employee_name,
    d.department_name,
    p.performance_rating
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN performance p
    ON e.employee_id = p.employee_id
WHERE p.performance_rating >= 4.5;
#Promotion Eligibility
SELECT 
    e.employee_name,
    e.designation,
    e.salary,
    p.performance_rating
FROM employees e
JOIN performance p
    ON e.employee_id = p.employee_id
WHERE p.performance_rating >= 4.5
  AND e.salary < 100000;
  #Performance Rating Distribution
  SELECT
    CASE
        WHEN performance_rating >= 4.5 THEN 'Excellent'
        WHEN performance_rating >= 4.0 THEN 'Good'
        WHEN performance_rating >= 3.5 THEN 'Average'
        ELSE 'Needs Improvement'
    END AS performance_category,
    COUNT(*) AS employee_count
FROM performance
GROUP BY
    CASE
        WHEN performance_rating >= 4.5 THEN 'Excellent'
        WHEN performance_rating >= 4.0 THEN 'Good'
        WHEN performance_rating >= 3.5 THEN 'Average'
        ELSE 'Needs Improvement'
    END;
#Employee Attendance Rate
SELECT
    e.employee_name,
    ROUND(
        SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS attendance_rate
FROM employees e
JOIN attendance a
    ON e.employee_id = a.employee_id
GROUP BY e.employee_id, e.employee_name;
#Leave Utilization
SELECT
    e.employee_name,
    COUNT(CASE WHEN a.status = 'Leave' THEN 1 END) AS leave_days,
    COUNT(*) AS total_records,
    ROUND(
        COUNT(CASE WHEN a.status = 'Leave' THEN 1 END)
        / COUNT(*) * 100,
        2
    ) AS leave_utilization
FROM employees e
JOIN attendance a
    ON e.employee_id = a.employee_id
GROUP BY e.employee_id, e.employee_name;
#Absenteeism Rate
SELECT
    ROUND(
        SUM(CASE WHEN status = 'Absent' THEN 1 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS absenteeism_rate
FROM attendance;
#Department-wise Attrition
SELECT
    d.department_name,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN e.employment_status = 'Resigned' THEN 1 ELSE 0 END) AS resigned_employees,
    ROUND(
        SUM(CASE WHEN e.employment_status = 'Resigned' THEN 1 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS attrition_rate
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name;
#Top 3 Employees by Salary per Department
WITH RankedEmployees AS (
    SELECT
        e.employee_name,
        d.department_name,
        e.salary,
        DENSE_RANK() OVER (
            PARTITION BY e.department_id
            ORDER BY e.salary DESC
        ) AS salary_rank
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
)
SELECT
    employee_name,
    department_name,
    salary,
    salary_rank
FROM RankedEmployees
WHERE salary_rank <= 3
ORDER BY department_name, salary_rank;
#Employees Above Department Average
WITH DepartmentSalary AS (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        AVG(salary) OVER (
            PARTITION BY department_id
        ) AS department_avg_salary
    FROM employees
)
SELECT
    employee_name,
    salary,
    department_avg_salary
FROM DepartmentSalary
WHERE salary > department_avg_salary;
#Employee Growth / Hiring Trend
SELECT
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS new_hires
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY hire_year;
#Workforce Dashboard Metrics
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN employment_status = 'Active' THEN 1 ELSE 0 END) AS active_employees,
    SUM(CASE WHEN employment_status = 'Resigned' THEN 1 ELSE 0 END) AS resigned_employees,
    ROUND(AVG(salary), 2) AS average_salary,
    ROUND(AVG(age), 2) AS average_age
FROM employees;