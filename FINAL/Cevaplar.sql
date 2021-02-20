use human_resources;
#Question1
SELECT 
    employee_name
FROM
    Employee
WHERE
    employee_satisfaction < (SELECT 
            AVG(employee_satisfaction)
        FROM
            Employee)
        AND employee_id IN (SELECT 
            employee_id
        FROM
            PositionHistory as H join PerformanceScore as S on(H.performance_score_id=S.performance_score_id)
        WHERE
            performance_score = 'Needs Improvements');


#Question2

SELECT 
    employee_name, position_name
FROM
    Employee AS E
        JOIN
    (SELECT 
        position_name, employee_id
    FROM
        PositionHistory AS H
    JOIN Position AS P ON (H.position_id = P.position_id)
    WHERE
        YEAR(date_of_hire) = 2015) AS T ON (T.employee_id = E.employee_id);



#Question3


SELECT 
    manager_name, total
FROM
    Manager
      JOIN
    (SELECT 
        M.manager_id, COUNT(*) AS total
    FROM
        Employee AS E
    JOIN ManagedBy AS M ON (M.employee_id = E.employee_id)
    GROUP BY manager_id) AS T ON (T.manager_id = Manager.manager_id)
ORDER BY total;

#Question4

SELECT 
    employee_name
FROM
    Employee AS E
        JOIN
    PositionHistory AS H ON (E.employee_id = H.employee_id)
WHERE
    performance_score_id IN (SELECT 
            performance_score_id
        FROM
            PerformanceScore
        WHERE
            performance_score = 'Needs Improvements')
        AND employee_status_id IN (SELECT 
            employee_status_id
        FROM
            EmployeeStatus
        WHERE
            employee_status = 'Future Start');

#with join

SELECT 
    employee_name, employee_status, performance_score
FROM
    Employee AS E
        JOIN
    (SELECT 
        employee_id,
            employee_status,
            ES.employee_status_id,
            performance_score,
            PS.performance_score_id
    FROM
        PositionHistory AS PH, EmployeeStatus AS ES, PerformanceScore AS PS
    WHERE
        PH.performance_score_id = PS.performance_score_id
            AND ES.employee_status_id = PH.employee_status_id) AS T ON (E.employee_id = T.employee_id)
WHERE
    performance_score = 'Needs Improvements'
        AND employee_status = 'Future Start';
            




#Question5
SELECT 
    employee_name, pay_rate, department_name
FROM
    Employee AS E
        JOIN
    (SELECT 
        employee_id, department_name
    FROM
        PositionHistory AS H
    JOIN Department AS D ON (H.department_id = D.department_id)
    WHERE
        term_reason_id IN (SELECT 
                term_reason_id
            FROM
                TermReason
            WHERE
                term_reason = 'more money')) AS T ON (E.employee_id = T.employee_id)
ORDER BY pay_rate;

SELECT 
    employee_name,pay_rate
FROM
    Employee
WHERE
    pay_rate = (select MAX(pay_rate) from Employee);





#Question6


SELECT 
    employee_name, position_name
FROM
    Employee AS E
        JOIN
    (SELECT 
        employee_id, P.position_id, position_name
    FROM
        Position AS P
    JOIN PositionHistory AS H ON (P.position_id = H.position_id)) AS T ON (E.employee_id = T.employee_id)
WHERE
    e.pay_rate < (SELECT 
            AVG(pay_rate)
        FROM
            Employee);
            
            
            
            

#Question7
SELECT 
    d.department_name, COUNT(T.employee_name) AS employee_count
FROM
    Department AS d
        JOIN
    (SELECT 
        Employee.employee_name, PositionHistory.department_id
    FROM
        Employee
    JOIN PositionHistory ON (Employee.employee_id = PositionHistory.employee_id)) AS T ON (T.department_id = d.department_id)
GROUP BY department_name;


#Question8
SELECT 
    employee_name,
    engagement_survey,
    performance_score,
    recruiment_source
FROM
    Employee AS E
        JOIN
    (SELECT 
        employee_id, performance_score
    FROM
        PositionHistory AS H
    JOIN PerformanceScore AS S ON (H.performance_score_id = S.performance_score_id)) AS T ON (E.employee_id = T.employee_id)
WHERE
    recruiment_source = 'Employee Referral';
    
    
#Question9

SELECT 
    employee_name, position_name
FROM
    Employee AS E
        JOIN
    (SELECT 
        employee_id,position_name
    FROM
        PositionHistory AS H
    JOIN Position AS P ON (P.position_id = H.position_id)) AS T ON (T.employee_id = E.employee_id)
WHERE
    YEAR(e.date_of_birth) < 1960;
    
    
    
#Question10

SELECT 
    employee_name, department_name, marital_desc
FROM
    (SELECT 
        employee_name, marital_desc, employee_id
    FROM
        Employee AS E
    JOIN Married AS M ON (E.marital_status_id = M.marital_status_id)) AS T1
        JOIN
    (SELECT 
        department_name, employee_id
    FROM
        Department AS D
    JOIN (SELECT 
        employee_id, department_id
    FROM
        PositionHistory AS H
    JOIN EmployeeStatus AS S ON (H.employee_status_id = S.employee_status_id)
    WHERE
        employee_status = 'Active') AS T ON (T.department_id = D.department_id)) AS T2 ON (T1.employee_id = T2.employee_id);

select * from Department;

call guest_list('Sales');






    
