CREATE DATABASE hr_analytics_db;
USE hr_analytics_db;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'Human Resources'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    department_id INT,
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(50),
    employment_status VARCHAR(20),
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
INSERT INTO employees
(employee_id, employee_name, gender, age, department_id, designation, salary, hire_date, city, employment_status)
VALUES
(101, 'Arjun Mehta', 'Male', 29, 1, 'Software Engineer', 72000, '2022-03-14', 'Mumbai', 'Active'),
(102, 'Kavya Nair', 'Female', 27, 1, 'Data Analyst', 68000, '2023-07-10', 'Pune', 'Active'),
(103, 'Vikram Singh', 'Male', 34, 1, 'Senior Software Engineer', 105000, '2020-05-18', 'Bangalore', 'Active'),
(104, 'Ishita Rao', 'Female', 31, 1, 'Business Analyst', 82000, '2021-09-22', 'Hyderabad', 'Active'),
(105, 'Aditya Shah', 'Male', 26, 1, 'Junior Developer', 52000, '2024-01-15', 'Mumbai', 'Active'),

(106, 'Meera Kapoor', 'Female', 36, 2, 'HR Manager', 88000, '2019-04-08', 'Delhi', 'Active'),
(107, 'Ritesh Kumar', 'Male', 30, 2, 'HR Executive', 56000, '2022-11-21', 'Pune', 'Active'),
(108, 'Ananya Bose', 'Female', 25, 2, 'Recruiter', 48000, '2024-06-17', 'Kolkata', 'Active'),
(109, 'Siddharth Jain', 'Male', 40, 2, 'HR Business Partner', 95000, '2018-08-13', 'Delhi', 'Resigned'),

(110, 'Nikhil Desai', 'Male', 33, 3, 'Financial Analyst', 78000, '2021-02-11', 'Pune', 'Active'),
(111, 'Pooja Iyer', 'Female', 29, 3, 'Senior Financial Analyst', 98000, '2020-10-05', 'Mumbai', 'Active'),
(112, 'Karan Malhotra', 'Male', 42, 3, 'Finance Manager', 125000, '2017-06-19', 'Delhi', 'Active'),
(113, 'Shruti Menon', 'Female', 27, 3, 'Accounts Executive', 51000, '2023-12-04', 'Kochi', 'Active'),
(114, 'Manish Verma', 'Male', 38, 3, 'Accountant', 62000, '2019-09-16', 'Ahmedabad', 'Resigned'),

(115, 'Rohan Sethi', 'Male', 28, 4, 'Sales Executive', 58000, '2023-05-22', 'Mumbai', 'Active'),
(116, 'Neha Bhatia', 'Female', 32, 4, 'Sales Manager', 92000, '2020-07-13', 'Delhi', 'Active'),
(117, 'Yash Kulkarni', 'Male', 24, 4, 'Sales Associate', 45000, '2024-08-01', 'Pune', 'Active'),
(118, 'Tanvi Joshi', 'Female', 30, 4, 'Business Development Executive', 67000, '2022-01-24', 'Bangalore', 'Active'),
(119, 'Saurabh Gupta', 'Male', 37, 4, 'Regional Sales Manager', 110000, '2019-03-11', 'Hyderabad', 'Resigned'),

(120, 'Ayesha Khan', 'Female', 28, 5, 'Marketing Specialist', 64000, '2023-02-20', 'Mumbai', 'Active'),
(121, 'Rahul Kapoor', 'Male', 35, 5, 'Marketing Manager', 97000, '2020-06-15', 'Delhi', 'Active'),
(122, 'Simran Kaur', 'Female', 26, 5, 'Content Strategist', 55000, '2024-04-09', 'Chandigarh', 'Active'),
(123, 'Dev Patel', 'Male', 31, 5, 'Digital Marketing Analyst', 73000, '2022-10-17', 'Ahmedabad', 'Active'),
(124, 'Manya Roy', 'Female', 39, 5, 'Brand Manager', 115000, '2018-12-03', 'Kolkata', 'Resigned'),
(125, 'Harsh Agarwal', 'Male', 27, 5, 'SEO Specialist', 50000, '2024-09-12', 'Jaipur', 'Active');

Create  TABLE attendance
 (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);

INSERT INTO attendance
(attendance_id, employee_id, attendance_date, status)
VALUES
(1,101,'2025-01-02','Present'),
(2,101,'2025-01-03','Present'),
(3,101,'2025-01-04','Leave'),
(4,102,'2025-01-02','Present'),
(5,102,'2025-01-03','Absent'),
(6,102,'2025-01-04','Present'),
(7,103,'2025-01-02','Present'),
(8,103,'2025-01-03','Present'),
(9,103,'2025-01-04','Present'),
(10,104,'2025-01-02','Present'),
(11,104,'2025-01-03','Leave'),
(12,104,'2025-01-04','Present'),
(13,105,'2025-01-02','Absent'),
(14,105,'2025-01-03','Present'),
(15,105,'2025-01-04','Present'),

(16,106,'2025-01-02','Present'),
(17,106,'2025-01-03','Present'),
(18,106,'2025-01-04','Present'),
(19,107,'2025-01-02','Present'),
(20,107,'2025-01-03','Leave'),
(21,107,'2025-01-04','Present'),
(22,108,'2025-01-02','Absent'),
(23,108,'2025-01-03','Present'),
(24,108,'2025-01-04','Present'),
(25,109,'2025-01-02','Present'),
(26,109,'2025-01-03','Absent'),
(27,109,'2025-01-04','Leave'),

(28,110,'2025-01-02','Present'),
(29,110,'2025-01-03','Present'),
(30,110,'2025-01-04','Present'),
(31,111,'2025-01-02','Present'),
(32,111,'2025-01-03','Present'),
(33,111,'2025-01-04','Leave'),
(34,112,'2025-01-02','Present'),
(35,112,'2025-01-03','Present'),
(36,112,'2025-01-04','Present'),
(37,113,'2025-01-02','Leave'),
(38,113,'2025-01-03','Present'),
(39,113,'2025-01-04','Present'),
(40,114,'2025-01-02','Absent'),
(41,114,'2025-01-03','Present'),
(42,114,'2025-01-04','Leave'),

(43,115,'2025-01-02','Present'),
(44,115,'2025-01-03','Present'),
(45,115,'2025-01-04','Absent'),
(46,116,'2025-01-02','Present'),
(47,116,'2025-01-03','Present'),
(48,116,'2025-01-04','Present'),
(49,117,'2025-01-02','Absent'),
(50,117,'2025-01-03','Absent'),
(51,117,'2025-01-04','Present'),
(52,118,'2025-01-02','Present'),
(53,118,'2025-01-03','Leave'),
(54,118,'2025-01-04','Present'),
(55,119,'2025-01-02','Present'),
(56,119,'2025-01-03','Leave'),
(57,119,'2025-01-04','Absent'),

(58,120,'2025-01-02','Present'),
(59,120,'2025-01-03','Present'),
(60,120,'2025-01-04','Present'),
(61,121,'2025-01-02','Present'),
(62,121,'2025-01-03','Leave'),
(63,121,'2025-01-04','Present'),
(64,122,'2025-01-02','Absent'),
(65,122,'2025-01-03','Present'),
(66,122,'2025-01-04','Leave'),
(67,123,'2025-01-02','Present'),
(68,123,'2025-01-03','Present'),
(69,123,'2025-01-04','Present'),
(70,124,'2025-01-02','Present'),
(71,124,'2025-01-03','Absent'),
(72,124,'2025-01-04','Leave'),
(73,125,'2025-01-02','Present'),
(74,125,'2025-01-03','Present'),
(75,125,'2025-01-04','Absent');

CREATE TABLE performance (
    review_id INT PRIMARY KEY,
    employee_id INT,
    review_year INT,
    performance_rating DECIMAL(3,2),
    bonus DECIMAL(10,2),
    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);
INSERT INTO performance
(review_id, employee_id, review_year, performance_rating, bonus)
VALUES
(1,101,2024,4.50,15000),
(2,102,2024,4.10,10000),
(3,103,2024,4.80,22000),
(4,104,2024,4.30,14000),
(5,105,2024,3.60,7000),

(6,106,2024,4.70,20000),
(7,107,2024,4.00,9000),
(8,108,2024,3.80,6000),
(9,109,2024,3.20,5000),

(10,110,2024,4.20,12000),
(11,111,2024,4.90,24000),
(12,112,2024,4.60,21000),
(13,113,2024,3.90,8000),
(14,114,2024,3.40,6000),

(15,115,2024,4.10,9000),
(16,116,2024,4.80,19000),
(17,117,2024,3.50,5000),
(18,118,2024,4.30,11000),
(19,119,2024,3.10,4000),

(20,120,2024,4.40,13000),
(21,121,2024,4.70,20000),
(22,122,2024,3.70,6500),
(23,123,2024,4.20,10500),
(24,124,2024,3.30,4500),
(25,125,2024,3.90,7500);