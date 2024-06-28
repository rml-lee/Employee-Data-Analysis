# HR Data Analysis

-- 1. What is the average salary for each position in the company?
SELECT
    position,
    ROUND(AVG(salary), 0) AS avg_salary
FROM
    hr_dataset_v14
GROUP BY 1;



-- 2. Which recruitment sources tend to attract productive employees?
SELECT
    recruitment_source,
    performance_score,
    COUNT(*) AS total
FROM
    hr_dataset_v14
GROUP BY 1, 2
ORDER BY 1 ASC, 2 ASC;



-- 3. What is the employee count and employee distribution for each department?
SELECT
    department,
    COUNT(*) AS employee_count,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM hr_dataset_v14) * 100, 0) AS percentage
FROM
    hr_dataset_v14
WHERE
    date_of_termination IS NULL
GROUP BY 1
ORDER BY 3 DESC;



-- 4. Is there a relationship between managers and the level of employee satisfaction within the Production department?
SELECT
    CONCAT(manager_first_name, ' ', manager_last_name) AS manager_name,
    CONCAT(employee_first_name, ' ', employee_last_name) AS employee_name,
    engagement_survey
FROM
    hr_dataset_v14
WHERE
    date_of_termination IS NULL
AND manager_id IS NOT NULL
AND department LIKE '%Production%';



-- 5. What are the top 5 most popular recruitment sources?
SELECT
    recruitment_source,
    total
FROM
    (SELECT
        recruitment_source,
        COUNT(*) AS total,
        RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
    FROM
        hr_dataset_v14
    GROUP BY 1) t
WHERE
    rnk <= 5;



-- 6. What is the full name of Data Analysts with the highest engagement survey rating?
SELECT
    CONCAT(employee_first_name, ' ', employee_last_name) AS employee_name,
    department,
    position
FROM
    hr_dataset_v14
WHERE
      date_of_termination IS NULL
  AND position = 'Data Analyst'
  AND emp_satisfaction =
      (SELECT MAX(engagement_survey) FROM hr_dataset_v14);



-- 7. Salary Adjustment: Give employees with the lowest salary from each department a 5% raise.
-- Let's exclude employees from the Executive Office.
SELECT
    t1.employee_id,
    t1.department,
    t1.salary AS old_salary,
    ROUND(t1.salary * 1.05, 0) AS new_salary
FROM
    hr_dataset_v14 t1
JOIN
    (SELECT
        department,
        MIN(salary) AS lowest_salary
    FROM
        hr_dataset_v14
    WHERE
        date_of_termination IS NULL
    AND department != 'Executive Office'
    GROUP BY 1) t2
    ON t2.department = t1.department
    AND t2.lowest_salary = t1.salary;



-- 8. Which department has the highest turnover rate?
SELECT
    department,
    total_employees,
    total_terminated,
    total_terminated / total_employees AS turnover_rate
FROM
    (SELECT
         department,
         COUNT(*) AS total_employees,
         SUM(IF(date_of_termination IS NOT NULL, 1, 0)) AS total_terminated
     FROM
         hr_dataset_v14
     GROUP BY 1) t
ORDER BY 4 DESC;



-- 9. What is the average length of employment among employees under attrition?
SELECT
    ROUND(AVG(experience_in_years), 0) AS avg_experience
FROM
    (SELECT
        employee_id,
        employee_first_name,
        employee_last_name,
        TIMESTAMPDIFF(YEAR, date_of_hire, date_of_termination) AS experience_in_years
    FROM
        hr_dataset_v14
    WHERE
        date_of_termination IS NOT NULL
    AND employment_status = 'Voluntarily Terminated') t;



-- 10. What is the longest that the company has went without hiring or terminating anybody?
SELECT
    MAX(h.daydiff_hired) AS days_hired,
    MAX(f.daydiff_fired) AS days_fired
FROM
    (SELECT
        *,
        DATEDIFF(date_of_hire, prev_hire) AS daydiff_hired
    FROM
        (SELECT
             date_of_hire,
             LAG(date_of_hire) OVER (ORDER BY date_of_hire ASC) AS prev_hire
         FROM
             hr_dataset_v14) t) h
CROSS JOIN
    (SELECT
        *,
        DATEDIFF(date_of_termination, prev_fired) AS daydiff_fired
    FROM
        (SELECT
             date_of_termination,
             LAG(date_of_termination) OVER (ORDER BY date_of_termination ASC) AS prev_fired
         FROM
             hr_dataset_v14) t) f;