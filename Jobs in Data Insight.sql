/*
Data Exploration using Jobs in Data dataset (cleaned). 
*/
-- Load the data
SELECT *
FROM jobs_in_data

-- Average Salary by Job Title
SELECT job_title, AVG(salary_in_usd) AS avg_salary
FROM jobs_in_data
GROUP BY job_title
ORDER BY avg_salary DESC 

-- Comparison of Average Salary by Experience Level
SELECT experience_level, AVG(salary_in_usd) AS avg_salary
FROM jobs_in_data
GROUP BY experience_level
ORDER BY avg_salary DESC

-- Salary distribution by Employee Residence
SELECT employee_residence, AVG(salary_in_usd) AS avg_salary
FROM jobs_in_data
GROUP BY employee_residence
ORDER BY avg_salary DESC

-- Count of Job Titles per Experience Level
SELECT experience_level, job_title, COUNT(*) AS job_count
FROM jobs_in_data
GROUP BY experience_level, job_title
ORDER BY job_count DESC;

-- Average Salary by Experience Level Across Job Categories
SELECT job_category, experience_level, AVG(salary_in_usd) AS avg_salary
FROM jobs_in_data
GROUP BY job_category, experience_level
ORDER BY job_category, experience_level;

-- Average Salary by Employee Residence
SELECT employee_residence, AVG(salary_in_usd) AS avg_salary
FROM jobs_in_data
GROUP BY employee_residence
ORDER BY avg_salary DESC;

-- Count of Employees per Country
SELECT employee_residence, COUNT(*) AS employee_count
FROM jobs_in_data
GROUP BY employee_residence
ORDER BY employee_count DESC;

-- Distribution of Employment Types Across Job Categories
SELECT job_category, employment_type, COUNT(*) AS count
FROM jobs_in_data
GROUP BY job_category, employment_type
ORDER BY count DESC;

-- Average Salary for Remote vs. In-Person Jobs
SELECT work_setting, AVG(salary_in_usd) AS avg_salary
FROM jobs_in_data
GROUP BY work_setting
ORDER BY avg_salary DESC;

-- Distribution of Job Titles in Different Company Sizes
SELECT company_size, job_title, COUNT(*) AS job_count
FROM jobs_in_data
GROUP BY company_size, job_title
ORDER BY company_size, job_count DESC;

-- Average Salary Based on Company Size
SELECT company_size, AVG(salary_in_usd) AS avg_salary
FROM jobs_in_data
GROUP BY company_size
ORDER BY avg_salary DESC;

-- Correlation Between Company Size and Experience Level
SELECT company_size, experience_level, COUNT(*) AS count
FROM jobs_in_data
GROUP BY company_size, experience_level
ORDER BY company_size, experience_level;






