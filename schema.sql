--clearing out the "data" table
DROP TABLE "data";

--creating the "data" table
CREATE TABLE "data" (
	"sid" VARCHAR(300) NOT NULL,
	"id" UUID NOT NULL,
	"position" BIGINT NOT NULL,
	"created_at" BIGINT NOT NULL, 
	"created_meta" VARCHAR(10) NULL,
	"updated_at" BIGINT NOT NULL,
	"updated_meta" VARCHAR(10) NULL,
	"meta" VARCHAR(50) NULL,
	"year" INT NOT NULL,
	"113_cause_name" VARCHAR(300) NOT NULL,
	"cause_name" VARCHAR (150) NOT NULL,
	"state" VARCHAR(100) NOT NULL,
	"deaths" BIGINT NOT NULL,
	"age_adjusted_death_rate" FLOAT NOT NULL
	);

--determining whether we want to keep the sid column
SELECT state, sid FROM data WHERE state = 'California'; 

--altering the table to delete unnecessary columns 
ALTER TABLE data
	DROP COLUMN position, 
	DROP COLUMN created_meta,
	DROP COLUMN meta,
	DROP COLUMN updated_meta;

--selecting all of the data in our table
SELECT * FROM data;

--sum of deaths by detailed causes 
--sorted by highest number of deaths by state
SELECT state, cause_name, SUM(deaths) 
FROM data 
GROUP BY state, cause_name
ORDER BY SUM(deaths) DESC, cause_name;

--total number of deaths in our dataset grouped by cause_name
SELECT state, cause_name, SUM(deaths) 
FROM data
WHERE state != 'United States'
GROUP BY state, cause_name
ORDER BY SUM(deaths) DESC, state, cause_name;

--morality rate by per year 
SELECT cause_name, year,
SUM(deaths) AS total_deaths
FROM data
GROUP BY cause_name, year
ORDER BY year DESC;

--states with the most deaths regardless of cause
SELECT state, cause_name, SUM(deaths)
FROM data 
GROUP BY state, cause_name
ORDER BY SUM(deaths) DESC, cause_name;

--year with the highest age adjusted death rate
SELECT state, cause_name, age_adjusted_death_rate
FROM data
GROUP BY state, cause_name, age_adjusted_death_rate
ORDER BY age_adjusted_death_rate DESC, state;

-- grouped by ALL CAUSES, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'All causes'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by ALZHEIMER'S DISEASE, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'Alzheimer''s disease'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by ALZHEIMER'S DISEASE, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'Alzheimer''s disease'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by STROKE, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'Stroke'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by CLRD, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'CLRD'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by DIABETES, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'Diabetes'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by HEART DISEASE, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'Heart disease'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by INFLUENZA AND PNEUMONIA, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'Influenza and pneumonia'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by SUICIDE, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'Suicide'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by CANCER, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'Cancer'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;

-- grouped by KIDNEY DISEASE, broken down by states
SELECT cause_name, state, SUM(deaths)
FROM data
WHERE cause_name = 'Kidney disease'
GROUP BY cause_name, state
ORDER BY SUM(deaths) DESC, cause_name, state;
