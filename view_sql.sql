use example;
CREATE TABLE emplo (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE
);

-- Insert some sample data into `employees` table
INSERT INTO emplo (employee_id, first_name, last_name, department_id, hire_date)
VALUES
(1, 'John', 'Doe', 1, '2020-01-15'),
(2, 'Jane', 'Smith', 2, '2019-04-23'),
(3, 'Mary', 'Johnson', 1, '2018-07-10'),
(4, 'James', 'Brown', 3, '2021-02-01');
CREATE TABLE depart (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Insert some sample data into `departments` table
INSERT INTO depart (department_id, department_name)
VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'HR');

CREATE TABLE salaries (
    employee_id INT,
    salary DECIMAL(10, 2),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (employee_id, start_date),
    FOREIGN KEY (employee_id) REFERENCES emplo(employee_id)
);

-- Insert some sample data into `salaries` table
INSERT INTO salaries (employee_id, salary, start_date, end_date)
VALUES
(1, 50000.00, '2020-01-15', NULL),
(2, 60000.00, '2019-04-23', NULL),
(3, 55000.00, '2018-07-10', '2020-07-10'),
(3, 60000.00, '2020-07-11', NULL),
(4, 45000.00, '2021-02-01', NULL);

select * from emplo;
--  Creating a View to Show Employee Information with Department and Salary Details
create view employees_y as 
select first_name,last_name,department_id from emplo;
select * from employees_y;
-- Find employees who are in the 'Sales' department.

create view info as select
emplo.first_name,emplo.last_name,depart.department_name 
from emplo  join depart
where emplo.department_id=depart.department_id;

select first_name,last_name from info where department_name="sales";

-- Find the highest salary in the company.
 create view salary_info as 
select emplo.first_name, salaries.salary from emplo
join salaries where emplo.employee_id =salaries.employee_id;

select max(salary) from salary_info;

-- Update the salary for the employee named "John Doe" to 55,000.
update  salary_info   set salary=55000 where first_name="John";
select * from salaries;

select * from salary_info;