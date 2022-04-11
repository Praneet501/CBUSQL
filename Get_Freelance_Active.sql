/*
To get the details of the active Verified freelancer registered with the Company with specific category
*/

SELECT fc.freelance_id, fc.first_name, fc.last_name, fc.email, fs.job_title
FROM freelance_account as fc
INNER JOIN freelance_services as fs ON fc.freelance_id = fs.freelance_Id
INNER JOIN service as se ON se.service_id = fs.service_id
WHERE se.category = 'Electronic'
AND is_available = 1 AND background_verified = 1;
