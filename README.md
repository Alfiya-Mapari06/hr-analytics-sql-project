# HR Analytics SQL Project

## 📌 Project Overview

This project is an **HR Analytics database and SQL analysis project** designed to analyze employee workforce data and generate meaningful HR business insights.

The project uses a relational database containing employee information, departments, attendance records, and performance data. SQL queries are used to calculate key HR KPIs and answer common business questions related to workforce, salary, performance, attendance, and employee attrition.

---

## 🎯 Business Objective

The main objective of this project is to help HR teams understand:

* Workforce size and composition
* Employee attrition
* Department-wise headcount
* Salary distribution
* Employee performance
* Bonus distribution
* Attendance and absenteeism
* Employee tenure
* Workforce growth
* Promotion eligibility

The project also demonstrates practical SQL skills used by Data Analysts in real-world business scenarios.

---

## 🗄️ Database Structure

The database is named:

`hr_analytics_db`

It contains **4 main tables**:

### 1. `departments`

Stores department information.

| Column          | Description          |
| --------------- | -------------------- |
| department_id   | Unique department ID |
| department_name | Name of department   |

### 2. `employees`

Stores employee information.

| Column            | Description          |
| ----------------- | -------------------- |
| employee_id       | Unique employee ID   |
| employee_name     | Employee name        |
| gender            | Employee gender      |
| age               | Employee age         |
| department_id     | Department reference |
| designation       | Job role             |
| salary            | Employee salary      |
| hire_date         | Joining date         |
| city              | Employee city        |
| employment_status | Active or Resigned   |

### 3. `attendance`

Stores employee attendance records.

| Column          | Description               |
| --------------- | ------------------------- |
| attendance_id   | Unique attendance record  |
| employee_id     | Employee reference        |
| attendance_date | Attendance date           |
| status          | Present, Absent, or Leave |

### 4. `performance`

Stores employee performance and bonus information.

| Column             | Description             |
| ------------------ | ----------------------- |
| review_id          | Unique review ID        |
| employee_id        | Employee reference      |
| review_year        | Performance review year |
| performance_rating | Employee rating         |
| bonus              | Employee bonus          |

---

## 🔗 Database Relationships

```text
Departments
     │
     │ department_id
     ↓
Employees
   │       │
   │       │
   ↓       ↓
Attendance  Performance
```

* One department can have multiple employees.
* One employee can have multiple attendance records.
* One employee can have performance records.

---

## 📊 Dataset

The project contains:

* **5 departments**
* **25 employees**
* **75 attendance records**
* **25 performance records**

The dataset contains employees from multiple cities, departments, designations, salary levels, and employment statuses to support realistic HR analysis.

---

## 📈 Key HR KPIs

The project calculates the following **25 business KPIs**:

### Workforce Analytics

1. Total Employees
2. Active Employees
3. Employee Attrition Rate
4. Department-wise Headcount
5. Gender Diversity Ratio
6. Age Distribution
7. Average Employee Tenure
8. Employees by City

### Compensation Analytics

9. Average Employee Salary
10. Salary by Department
11. Highest-Paying Department
12. Highest-Paying Job Role
13. Bonus Distribution

### Performance Analytics

14. Average Performance Rating
15. Top Performers
16. Promotion Eligibility
17. Performance Rating Distribution

### Attendance Analytics

18. Employee Attendance Rate
19. Leave Utilization
20. Absenteeism Rate

### Advanced Workforce Analysis

21. Department-wise Attrition
22. Top 3 Employees by Salary per Department
23. Employees Above Department Average
24. Employee Hiring Growth Trend
25. Workforce Dashboard Metrics

---

## 🛠️ SQL Concepts Used

This project demonstrates practical SQL concepts including:

* `SELECT`
* `WHERE`
* `COUNT()`
* `SUM()`
* `AVG()`
* `ROUND()`
* `CASE WHEN`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* `INNER JOIN`
* Subqueries
* CTEs
* `DENSE_RANK()`
* Window Functions
* `PARTITION BY`
* `DATEDIFF()`
* `YEAR()`
* Conditional aggregation

---

## 💼 Business Questions Answered

Some of the key questions answered through SQL include:

* How many employees are in the organization?
* How many employees are currently active?
* What is the employee attrition rate?
* Which department has the highest average salary?
* Which job role has the highest average salary?
* Which employees are top performers?
* Which employees may be eligible for promotion?
* Which department has the highest attrition?
* What is the average employee tenure?
* What is the employee attendance rate?
* What is the absenteeism rate?
* Who are the top 3 highest-paid employees in each department?
* Which employees earn above their department's average salary?
* How has employee hiring changed over time?

---

## 🔍 Example SQL Analysis

### Top 3 Employees by Salary in Each Department

```sql
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
```

This demonstrates the use of a **CTE, JOIN, and window function** to identify the highest-paid employees within each department.

---

## 📁 Project Structure

```text
HR-Analytics-SQL-Project/
│
├── 01_database_setup.sql
│
├── 02_hr_kpi_analysis.sql
│
└── README.md
```

### `01_database_setup.sql`

Contains:

* Database creation
* Table creation
* Primary keys
* Foreign keys
* Sample data insertion

### `02_hr_kpi_analysis.sql`

Contains:

* 25 HR KPI queries
* Workforce analysis
* Salary analysis
* Performance analysis
* Attendance analysis
* Advanced SQL analysis

---

## 🎓 Skills Demonstrated

Through this project, I demonstrated my ability to:

* Design and work with relational databases
* Write SQL queries for business problems
* Analyze HR and workforce data
* Use joins across multiple tables
* Perform aggregation and filtering
* Use CTEs and subqueries
* Apply window functions
* Calculate business KPIs
* Translate business requirements into SQL queries
* Generate insights from structured data

---
## 🔍 Key Insights

The SQL analysis generated the following HR insights from the dataset:

* 📉 **Employee Attrition Rate:** 16.00% of employees have resigned.
* 💰 **Average Employee Salary:** The overall average salary is **76,240.00**.
* 🏆 **Highest-Paying Department:** **Finance**, with an average salary of **82,800.00**.
* ⭐ **Average Performance Rating:** The overall average performance rating is **4.08 / 5.00**.
* 👥 **Largest Department:** **Marketing** has the highest headcount with **6 employees**.

### 📌 Business Takeaways

* The **16% attrition rate** indicates that employee retention should be monitored.
* **Finance** has the highest average salary among the departments in the dataset.
* The overall **4.08/5 performance rating** indicates generally strong employee performance.
* **Marketing** represents the largest department by employee count and may require additional workforce planning as the organization grows.
* The average salary of **76,240.00** provides a baseline for comparing compensation across departments and job roles.
---
## 🚀 Future Improvements

Possible future improvements include:

* Creating an HR dashboard using Power BI
* Adding more historical attendance data
* Adding monthly performance records
* Adding employee promotion history
* Adding department budgets
* Adding recruitment and hiring data
* Performing deeper attrition analysis

---

## 👩‍💻 Project Type

**Data Analytics | SQL | HR Analytics | Business Intelligence**

**Database:** MySQL
**Focus:** SQL Data Analysis & Business KPIs

