/***Question: What are the top-paying data analyst jobs?**
 
 - Identify the top 10 highest-paying Data Analyst
 roles that are available remotely.
 - Focuses on job postings with specified salaries.
 - Why? Aims to highlight the top-paying opportunities 
 for Data Analysts, offering insights into employment 
 options and location flexibility.*/
SELECT job_title,
    salary_year_avg,
    name as company_name
from job_postings_fact
    left join company_dim ON job_postings_fact.company_id = company_dim.company_id
where salary_year_avg is not null
    and job_title_short = 'Data Analyst'
    and job_work_from_home = TRUE
order by salary_year_avg desc
limit 10