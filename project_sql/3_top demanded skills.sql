SELECT skills,
    count(skills_dim.skills) as numofskills
FROM job_postings_fact
    INNER join skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY numofskills desc
LIMIT 5