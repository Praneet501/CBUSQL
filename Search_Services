/*
Functionality: Search Freelance Services
Description: Search available active services in nearby location for verified freelances
*/


SELECT 
SS.service_name,
SS.service_description, 
FS.price,	
FS.email, 
FS.contact_number, 
FS.is_avaiable, 
FS.service_location, 
FS.rating

FROM freelance_services FS
INNER JOIN SERVICE SS ON SS.service_id = FS.service_id
LEFT JOIN job_status JS ON JS.freelance_service_id = JS.freelance_service_id
  
WHERE (SS.job_title like '%search_input%' 	
OR  SS.service_description = '%search_input%')
AND FS.service_location = 'location_name'
AND FS.is_available = 1
AND FS.background_verified = 1
AND JS.in_progress = FALSE  ;
