/*
Functionality: Payment Received by Each Freelancer Till Date
Description: Get Payment Received by Each Freelancer Till Date
*/

SELECT FA.freelance_id, FA.first_name, FA.last_name, SUM(FS.price) AS Payment_Received
FROM freelance_account FA
INNER JOIN freelance_services FS ON FA.freelance_Id = FS.freelance_Id
GROUP BY FA.freelance_id, FA.first_name, FA.last_name
