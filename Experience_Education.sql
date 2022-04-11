/*
Name : Freelancer having experience or Education
Functionality : Get list of Freelancer having  experience or Education for Background verification for Students
*/
	
SELECT COUNT(EX.freelance_Id) as Experienced, COUNT(ED.freelance_Id) as Education,  US.user_type FROM freelance_account FA
	LEFT JOIN user_type US ON US.user_type_id = FA.user_type_id
	LEFT JOIN education ED ON ED.freelance_Id = FA.freelance_Id
	LEFT JOIN experience EX ON EX.freelance_Id = FA.freelance_Id
		WHERE (Ed.education_id IS NOT NULL OR EX.experience_id IS NOT NULL)
		GROUP BY US.user_type												
        HAVING US.user_type = 'Student'
