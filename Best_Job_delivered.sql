/*
Functionality: Get all Best Job delivered with rating review from lower to higher
*/

SELECT Rew.job_id, Rew.rating, Rew.comments   FROM 
reviews Rew
LEFT JOIN job_status JS ON JS.job_id = Rew.job_id
WHERE is_Deleted = 0
AND 'like' > 'dislike'
order by rating desc
