# MYSQL-Tableau-Human-Resources-Project

# Business Task

The goal of this project is to gather actionable insights and identify trends from the provided Human Resources (HR) dataset.

**Domain**: Workforce Management and Organizational Development

## Table of Contents
- [Data Source](#data-source)
- [Data Dictionary](#data-dictionary)
- [Data Cleaning & Exploration](#data-cleaning--exploration)
- [Data Schema](#data-schema)
- [Data Transformation](#data-transformation)
- [Analysis/Findings](#analysisfindings)

# Data Source
Human Resources Data Set - [Kaggle](https://www.kaggle.com/datasets/rhuebner/human-resources-data-set)

# Data Dictionary

## Human Resources Data Set

| Field                          | Description                                                                              |
|--------------------------------|------------------------------------------------------------------------------------------|
| Employee Name                  | Employee’s full name                                                                     |
| EmpID                          | Employee ID is unique to each employee                                                   |
| MarriedID                      | Is the person married (1 or 0 for yes or no)                                              |
| MaritalStatusID                | Marital status code that matches the text field MaritalDesc                              |
| EmpStatusID                    | Employment status code that matches text field EmploymentStatus                          |
| DeptID                         | Department ID code that matches the department the employee works in                     |
| PerfScoreID                    | Performance Score code that matches the employee’s most recent performance score         |
| FromDiversityJobFairID         | Was the employee sourced from the Diversity job fair? 1 or 0 for yes or no               |
| Salary                         | The person’s yearly salary. $ U.S. Dollars                                               |
| Termd                          | Has this employee been terminated - 1 or 0                                               |
| PositionID                     | An integer indicating the person’s position                                              |
| Position                       | The text name/title of the position the person has                                       |
| State                          | The state that the person lives in                                                       |
| Zip                            | The zip code for the employee                                                            |
| DOB                            | Date of Birth for the employee                                                           |
| Sex                            | Sex - M or F                                                                             |
| MaritalDesc                    | The marital status of the person (divorced, single, widowed, separated, etc)             |
| CitizenDesc                    | Label for whether the person is a Citizen or Eligible NonCitizen                         |
| HispanicLatino                 | Yes or No field for whether the employee is Hispanic/Latino                              |
| RaceDesc                       | Description/text of the race the person identifies with                                  |
| DateofHire                     | Date the person was hired                                                                |
| DateofTermination              | Date the person was terminated, only populated if, in fact, Termd = 1                    |
| TermReason                     | A text reason / description for why the person was terminated                            |
| EmploymentStatus               | A description/category of the person’s employment status. Anyone currently working full time = Active |
| Department                     | Name of the department that the person works in                                          |
| ManagerName                    | The name of the person’s immediate manager                                               |
| ManagerID                      | A unique identifier for each manager.                                                    |
| RecruitmentSource              | The name of the recruitment source where the employee was recruited from                 |
| PerformanceScore               | Performance Score text/category (Fully Meets, Partially Meets, PIP, Exceeds)             |
| EngagementSurvey               | Results from the last engagement survey, managed by our external partner                 |
| EmpSatisfaction                | A basic satisfaction score between 1 and 5, as reported on a recent employee satisfaction survey |
| SpecialProjectsCount           | The number of special projects that the employee worked on during the last 6 months      |
| LastPerformanceReviewDate      | The most recent date of the person’s last performance review.                            |
| DaysLateLast30                 | The number of times that the employee was late to work during the last 30 days           |
| Absences                       | The number of times the employee was absent from work                                    |

# Data Cleaning & Exploration

Tools used:
| Python | Jupyter | Pandas | Numpy | Conda |
|--------|-------|---------|--------|-------|
| <img src="https://github.com/rml-lee/MYSQL-Tableau-Video-Games-Project/assets/160198611/cc008c2a-1e65-46fe-99aa-fcef90c84b2b" width="55" height="55"/> | <img src="https://github.com/rml-lee/MYSQL-Tableau-Video-Games-Project/assets/160198611/029ca083-0c94-40b2-96bc-5a4ccd5199bb" width="50" height="55"/> | <img src="https://github.com/rml-lee/MYSQL-Tableau-Video-Games-Project/assets/160198611/1f1bf784-7c28-491e-9c70-d78a8cfd9ec3" width="55" height="55"/> | <img src="https://github.com/rml-lee/MYSQL-Tableau-Video-Games-Project/assets/160198611/ca024f21-791d-4cc9-836a-710df995811a" width="55" height="55"/> | <img src="https://github.com/rml-lee/MYSQL-Tableau-Video-Games-Project/assets/160198611/752b8489-df2a-457b-ab2e-294b34774a78" width="55" height="55"/> |


In this section, you'll find a Jupyter Notebook that demonstrates my proficiency in data cleaning and exploration using pandas. This notebook showcases various techniques to clean and preprocess raw data, ensuring that it's ready for analysis.

You can access the Jupyter Notebook file [here](https://github.com/rml-lee/MYSQL-Tableau-Human-Resources-Project/blob/main/Data%20Cleaning%20%26%20Exploration%20-%20Human%20Resources.ipynb).

# Data Schema

After cleaning the data, this is our schema that will be used throughout this project.

<img src="https://github.com/rml-lee/MYSQL-Tableau-Human-Resources-Project/assets/160198611/e7cc0adf-95e3-4954-9868-b4bb8d0461dc" alt="Description" width="500"/>

# Data Transformation

Tools used:
| MySQL |
| ----- |
| <img src="https://github.com/rml-lee/MYSQL-Tableau-Video-Games-Project/assets/160198611/a1f80d2c-f675-4c97-b497-f21377fd0042" width="55" height="55"/> |


The provided SQL script contains a set of questions with queries used to gather insight about this dataset using MySQL. 

You can access the SQL file [here](https://github.com/rml-lee/MYSQL-Tableau-Human-Resources-Project/blob/main/HR%20Project.sql).

# Analysis/Findings

Tools used:
| Tableau |
| ------- |
| <img src="https://github.com/rml-lee/MYSQL-Tableau-Video-Games-Project/assets/160198611/fb9f12dc-8640-4197-b3f6-ab0ce2241bc1" width="55" height="55"/> |


To conclude, I've provided an analysis of the results from a few of the questions provided within the SQL file. This section will also include visuals for our data and discussing the implications and potential impact on the business or research problem at hand. The goal is to provide a thorough and actionable understanding of the data, guiding informed decision-making.

You can review the results [here](https://github.com/rml-lee/MYSQL-Tableau-Human-Resources-Project/blob/main/Analysis-Findings.md).
