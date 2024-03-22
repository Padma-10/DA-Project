# DA-Project
Project on Employee Management Database using PostgreSQL with various views and queries.
It has SQL code to with 3 tables create views for displaying employee payroll information and performance reviews. Queries to retrieve data from these created views.

Table-1: Employee
Employee_Id (Primary Key)
First_Name
Last_Name

Table-2: Payroll
Payroll_Id (Primary Key)
Employee_Id(Foreign Key)
Gross_Salary
Tax_Deducted
Net_Salary

Table-3: Performance
Review_Id (Primary Key)
Employee_Id (Foreign Key)
Review_Date
Performance_Score

**Views**

1. Employee_Payroll_View
This view displays the details of employees along with their payroll information, including gross salary, tax deducted, and net salary.

CREATE VIEW Employee_Payroll_View AS
SELECT e.Employee_Id, e.First_Name, e.Last_Name, p.Gross_salary, p.Tax_deducted, p.Net_salary
FROM Employee e
JOIN Payroll p ON e.Employee_Id = p.Employee_Id;

2. Employee_Performance_View
This view displays the performance reviews of employees, including the review date and performance score.

CREATE VIEW Employee_Performance_View AS
SELECT e.Employee_Id, e.First_Name, e.Last_Name, pr.Review_date, pr.Performance_score
FROM Employee e
JOIN Performance pr ON e.Employee_Id = pr.Employee_Id;

3. Performance_Summary_View
This view displays the overall summary of employee performance as well as average performance score.

CREATE VIEW Performance_Summary_View AS
SELECT e.Employee_Id, e.First_Name, e.Last_Name, AVG(pr.Performance_score) AS Avg_Performance
FROM Employee e
JOIN Performance pr ON e.Employee_Id = pr.Employee_Id
GROUP BY e.Employee_Id, e.First_Name, e.Last_Name;

**Queries for users**
1. Retrieve Employee Payroll Information
SELECT * FROM Employee_Payroll_View;

2. Retrieve Overall Employee Performance Summary
SELECT * FROM Performance_Summary_View;
