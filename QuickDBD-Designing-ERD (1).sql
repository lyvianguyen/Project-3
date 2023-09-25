-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Kkyc3h
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Project 3

CREATE TABLE "data" (
    "sid" VARCHAR(300)   NOT NULL,
    "position" BIGINT   NOT NULL,
    "created_at" BIGINT   NOT NULL,
    "created_meta" VARCHAR(10)   NULL,
    "updated_at" BIGINT   NOT NULL,
    "updated_meta" VARCHAR(10)   NULL,
    "meta" VARCHAR(50)   NULL,
    "year" INT   NOT NULL,
    "113_cause_name" VARCHAR(300)   NOT NULL,
    "cause_name" VARCHAR(150)   NOT NULL,
    "state" VARCHAR(100)   NOT NULL,
    "deaths" BIGINT   NOT NULL,
    "age_adjusted_death_rate" FLOAT   NOT NULL
);

