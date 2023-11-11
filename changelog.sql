-- liquibase formatted sql
--changeset vu_diep:$(now)
CREATE TABLE IF NOT EXISTS iucr (
    iucr VARCHAR(255) UNIQUE NOT NULL,
    primary_description VARCHAR(255) NOT NULL,
    secondary_description VARCHAR(255) NOT NULL,
    index_code VARCHAR(255) NOT NULL,
    active BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS crime_fact_table (
	id VARCHAR,
	datetime_id INT,
	description VARCHAR,
	location_id INT,
	community_area INT,
	iucr VARCHAR,
	case_number VARCHAR,
	domestic BOOLEAN,
	fbi_code VARCHAR,
	primary_type VARCHAR(50),
	arrest BOOLEAN
);

CREATE TABLE IF NOT EXISTS crime_date_dimension (
	datetime_id INT,
	_month INT,
	_day INT,
	_year INT,
	_hour INT,
	crime_date DATE
);

CREATE TABLE IF NOT EXISTS crime_location_dimension (
	location_id INT primary key,
	latitude FLOAT,
	longitude FLOAT,
	location_description VARCHAR,
	block VARCHAR
);

CREATE TABLE IF NOT EXISTS fbi_code (
	id VARCHAR UNIQUE,
	description VARCHAR,
	crime_against VARCHAR
);


CREATE TABLE IF NOT EXISTS tbl_analytics AS (
SELECT 
f.id,
d.crime_date,
f.description,
l.latitude,
l.longitude,
l.location_description,
i.primary_description,
f.case_number,
fbi.description AS fbi_code_description,
f.primary_type,
f.arrest
FROM crime_fact_table f
JOIN crime_date_dimension d ON f.datetime_id = d.datetime_id
JOIN crime_location_dimension l ON l.location_id = f.location_id
JOIN fbi_code fbi ON fbi.id = f.fbi_code 
JOIN iucr i ON i.iucr = f.iucr 
);