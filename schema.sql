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
	
DROP TABLE "data";

SELECT state, sid FROM data WHERE state = 'California'; 

ALTER TABLE data
	DROP COLUMN position, 
	DROP COLUMN created_meta,
	DROP COLUMN meta,
	DROP COLUMN updated_meta;
	
SELECT * FROM data;

SELECT state, cause_name, SUM(deaths) 
FROM data 
GROUP BY state, cause_name
ORDER BY SUM(deaths), cause_name;
