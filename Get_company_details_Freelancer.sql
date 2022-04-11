/*
Functionality: Get the list of company details those have more than one freelancer hired.
*/

SELECT Company_Name, COUNT(FA.freelance_id) as Total_Count, Sector_Detail, Company_Website
FROM company_profile CP
LEFT JOIN job_status JS ON CP.company_id = JS.company_id
LEFT JOIN freelance_services FS ON FS.freelance_service_id = JS.freelance_service_id
LEFT JOIN freelance_account FA ON FA.freelance_id = FS.freelance_id
GROUP BY  company_name, Sector_detail, company_website
HAVING COUNT(FA.freelance_id) > 1
