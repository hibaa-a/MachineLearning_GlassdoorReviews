DROP TABLE glassdoor;

CREATE TABLE glassdoor (
	firm VARCHAR (50),
	date_review DATE,
	job_title VARCHAR (80),
	current VARCHAR (50),
	location VARCHAR (80),
	overall_rating INT,
	work_life_balance FLOAT,
	culture_values FLOAT,
	diversity_inclusion FLOAT,
	career_opp FLOAT,
	comp_benefits FLOAT,
	senior_mgmt FLOAT,
	recommend VARCHAR (1),
	ceo_approv VARCHAR (1),
	outlook VARCHAR (1),
	headline VARCHAR (120),
	pros VARCHAR (18200),
	cons VARCHAR (8000)
	
);	

SELECT * FROM glassdoor ;

