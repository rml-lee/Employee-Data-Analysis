DELIMITER $$
CREATE PROCEDURE clean_data()
BEGIN

-- Correction of field types
ALTER TABLE hr_dataset_v14
MODIFY manager_id int NULL,
MODIFY emp_satisfaction int NULL,
MODIFY special_projects_count int NULL,
MODIFY days_late_last int NULL,
MODIFY absences int NULL;



-- Split employee and manager name columns to first name and last name

-- Add first and last name columns
ALTER TABLE hr_dataset_v14
ADD COLUMN employee_first_name VARCHAR(25) NULL,
ADD COLUMN employee_last_name VARCHAR(25) NULL,
ADD COLUMN manager_first_name VARCHAR(25) NULL,
ADD COLUMN manager_last_name VARCHAR(25) NULL;



-- Create employee_first_name and employee_last_name string values
UPDATE hr_dataset_v14
SET
    employee_first_name = SUBSTRING_INDEX(employee_name, ',', 1),
    employee_last_name  = SUBSTRING_INDEX(SUBSTRING_INDEX(employee_name, ', ', -1), ',', 1);



-- Remove leading spaces from employee_last_name
UPDATE hr_dataset_v14
SET
    employee_last_name = TRIM(employee_last_name);



-- Remove middle initial from employee_last_name
UPDATE hr_dataset_v14
SET
    employee_last_name = SUBSTRING_INDEX(employee_last_name, ' ', 1);


-- Create manager_first_name and manager_last_name values
UPDATE hr_dataset_v14
SET
    manager_first_name = SUBSTRING_INDEX(manager_name, ' ', 1),
    manager_last_name =  SUBSTRING_INDEX(SUBSTRING_INDEX(manager_name, ' ', -2), ' ', -1);



-- Drop employee_name and manager_name columns
ALTER TABLE hr_dataset_v14
DROP COLUMN employee_name,
DROP COLUMN manager_name;


-- Convert columns containing dates '%m/%d/%Y' format to '%Y-%m-%d' format
UPDATE hr_dataset_v14
SET
    date_of_birth                = CASE
                                       WHEN date_of_birth LIKE '%/%'
                                           THEN DATE_FORMAT(STR_TO_DATE(date_of_birth, '%m/%d/%Y'), '%Y-%m-%d')
                                       ELSE date_of_birth
                                   END,
    date_of_hire                 = CASE
                                       WHEN date_of_hire LIKE '%/%'
                                           THEN DATE_FORMAT(STR_TO_DATE(date_of_hire, '%m/%d/%Y'), '%Y-%m-%d')
                                       ELSE date_of_hire
                                   END,
    date_of_termination          = CASE
                                       WHEN date_of_termination LIKE '%/%' THEN DATE_FORMAT(
                                               STR_TO_DATE(date_of_termination, '%m/%d/%Y'), '%Y-%m-%d')
                                       ELSE date_of_termination
                                   END,
    last_performance_review_date = CASE
                                       WHEN last_performance_review_date LIKE '%/%' THEN DATE_FORMAT(
                                               STR_TO_DATE(last_performance_review_date, '%m/%d/%Y'), '%Y-%m-%d')
                                       ELSE last_performance_review_date
                                   END;


-- Convert columns from TEXT to DATE format.
ALTER TABLE hr_dataset_v14
MODIFY COLUMN date_of_birth date,
MODIFY COLUMN date_of_hire date,
MODIFY COLUMN date_of_termination date,
MODIFY COLUMN last_performance_review_date date;



-- Replace Date of Birth with years that are after the current year with NULL's
UPDATE hr_dataset_v14
SET
    date_of_birth = NULL
WHERE
    YEAR(date_of_birth) > YEAR(CURRENT_DATE);


END $$

DELIMITER ;