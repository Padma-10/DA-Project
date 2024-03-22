--Database Name: Employee Management System with 3 tables
--Create 3 tables 'Employee', 'Payroll', 'Performance'
Create Table Employee(
Employee_Id serial Primary Key,
	First_Name Text,
	Last_Name Text
);
Create table Payroll(
Payroll_Id serial Primary Key,
	Employee_Id serial references Employee(Employee_Id),
	Gross_salary Decimal(5,2),
	Tax_deducted int,
	Net_salary Decimal(5,2)
);

Create Table Performance(
Review_Id serial Primary Key,
	Employee_Id serial references Employee(Employee_Id),
	Review_date date,
	Performance_score int
);

-- Create a view to display the details of employees along with their payroll information
CREATE VIEW Employee_Payroll_View AS
SELECT e.Employee_Id, e.First_Name, e.Last_Name, p.Gross_salary, p.Tax_deducted, p.Net_salary
FROM Employee e
JOIN Payroll p ON e.Employee_Id = p.Employee_Id;

-- View to display the performance reviews of employees
CREATE VIEW Employee_Performance_View AS
SELECT e.Employee_Id, e.First_Name, e.Last_Name, pr.Review_date, pr.Performance_score
FROM Employee e
JOIN Performance pr ON e.Employee_Id = pr.Employee_Id;

-- View to display the overall summary of employee performance
CREATE VIEW Performance_Summary_View AS
SELECT e.Employee_Id, e.First_Name, e.Last_Name, AVG(pr.Performance_score) AS Avg_Performance
FROM Employee e
JOIN Performance pr ON e.Employee_Id = pr.Employee_Id
GROUP BY e.Employee_Id, e.First_Name, e.Last_Name;

-- Query 1: Retrieve the details of employees along with their payroll information
SELECT * FROM Employee_Payroll_View;

-- Query 2: Retrieve the overall summary of employee performance
SELECT * FROM Performance_Summary_View;

