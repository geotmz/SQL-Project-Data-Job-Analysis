/***Question: What are the top-paying data analyst jobs, 
 and what skills are required?** 
 
 - Identify the top 10 highest-paying Data Analyst jobs 
 and the specific skills required for these roles.
 - Filters for roles with specified salaries that are remote
 - Why? It provides a detailed look at which high-paying jobs 
 demand certain skills, helping job seekers understand which 
 skills to develop that align with top salaries*/
WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        salary_year_avg,
        name as company_name
    from job_postings_fact
        left join company_dim ON job_postings_fact.company_id = company_dim.company_id
    where salary_year_avg is not null
        and job_title_short = 'Data Analyst'
        and job_work_from_home = TRUE
    order by salary_year_avg desc
    limit 10
)
select job_title,
    company_name,
    salary_year_avg,
    skills_dim.skills,
    skills_dim.type
from top_paying_jobs
    INNER join skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC