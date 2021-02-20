use human_resources;


select * from Employee where recruiment_source like "%G";
alter table Employee drop index idx;
create index idx on Employee(recruiment_source);

delimiter $$
use human_resources$$
create procedure age(id BigInt)
begin
declare current_year year;
set current_year  =year(sysdate());

end $$

delimiter ;

select * from Employee;
call age(602000312);

call will_retire(55);


call guest_list('Sales');
call guest_list('IT/IS');



SELECT 
    *
FROM
    Employee;
    
    



SELECT 
    race_desc, COUNT(employee_name) AS totals
FROM
    Employee
GROUP BY race_desc
ORDER BY totals;


SELECT 
    citizen_desc, COUNT(employee_name) AS totals
FROM
    Employee
GROUP BY citizen_desc
ORDER BY totals;   


SELECT 
    recruiment_source, COUNT(employee_name) AS totals
FROM
    Employee
GROUP BY recruiment_source
ORDER BY totals;


SELECT 
    term_reason, COUNT(employee_name) AS totals
FROM
    Employee
        JOIN
    TermReason ON (Employee.term_reason_id = TermReason.term_reason_id)
GROUP BY term_reason
ORDER BY totals;



SELECT 
    employee_name, term_reason
FROM
    Employee
        JOIN
    TermReason ON (Employee.term_reason_id = TermReason.term_reason_id)
WHERE
    term_reason NOT LIKE 'N/A%';
    

SELECT 
    T1.employee_name, T2.manager_name, T1.department_name
FROM
    (SELECT 
        Employee.employee_id,
            Employee.employee_name,
            D.department_id,
            D.department_name
    FROM
        Employee
    JOIN (SELECT 
        department_name, Department.department_id, employee_id
    FROM
        PositionHistory
    JOIN Department ON (PositionHistory.department_id = Department.department_id)) AS D ON (D.employee_id = Employee.employee_id)) AS T1
        JOIN
    (SELECT 
        Employee.employee_id,
            employee_name,
            manager_name,
            manager_id
    FROM
        Employee
    JOIN (SELECT 
        Manager.manager_id, manager_name, employee_id
    FROM
        Manager
    JOIN ManagedBy ON (Manager.manager_id = ManagedBy.manager_id)) AS M ON (M.employee_id = Employee.employee_id)) AS T2 ON (T1.employee_id = T2.employee_id);


SELECT 
    M.employee_name, manager_name, department_name
FROM
    employeemanager AS M
        JOIN
    employeedepartment AS D ON (M.employee_id = D.employee_id);
    
  CREATE VIEW EmployeeManager AS
    SELECT 
        Employee.employee_id,
        employee_name,
        manager_name
    FROM
        Employee
            JOIN
        (SELECT 
            Manager.manager_id, manager_name, employee_id
        FROM
            Manager
        JOIN ManagedBy ON (Manager.manager_id = ManagedBy.manager_id)) AS M ON (M.employee_id = Employee.employee_id);
        

create view EmployeeDepartment as SELECT 
        Employee.employee_id,
            Employee.employee_name,
            D.department_id,
            D.department_name
    FROM
        Employee
    JOIN (SELECT 
        department_name, Department.department_id, employee_id
    FROM
        PositionHistory
    JOIN Department ON (PositionHistory.department_id = Department.department_id)) AS D ON (D.employee_id = Employee.employee_id);

SELECT 
    EM.employee_name, EM.manager_name, ED.department_name
FROM
    EmployeeDepartment AS ED
        JOIN
    EmployeeManager AS EM ; 

SELECT 
    *
FROM
    EmployeeDepartment;
    
    
SELECT 
    *
FROM
    employeemanager;

create view employeeposition as 

SELECT 
    employee_name, pay_rate, position_name
FROM
    Employee AS E
        JOIN
    (SELECT 
        employee_id, position_name
    FROM
        PositionHistory AS H
    JOIN Position AS P ON (H.position_id = P.position_id)) AS T ON (E.employee_id = T.employee_id);

CREATE VIEW activeemployees AS
    SELECT 
        employee_name, E.employee_id
    FROM
        Employee AS E
            JOIN
        (SELECT 
            employee_id
        FROM
            PositionHistory
        WHERE
            employee_status_id IN (SELECT 
                    employee_status_id
                FROM
                    EmployeeStatus
                WHERE
                    employee_status = 'Active')) AS T ON (T.employee_id = E.employee_id);





call will_retire(30);
call all_ages();



select * from employee;

CREATE VIEW employeeages AS
    SELECT 
        employee_name,
        (YEAR(SYSDATE()) - YEAR(date_of_birth)) AS age,
        gender
    FROM
        Employee
    ORDER BY age;
    
    

create index recruiment_idx on Employee(recruiment_source);
create index name_idx on Employee(employee_name);

select employee_name from Employee where employee_name not in (
select distinct employee_name from Employee);

select employee_name from Employee
union
select distinct employee_name from Employee;















