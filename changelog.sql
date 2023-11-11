-- liquibase formatted sql
--changeset vu_diep:$(now)
CREATE TABLE IF NOT EXISTS iucr (
    iucr VARCHAR(255) UNIQUE NOT NULL,
    primary_description VARCHAR(255) NOT NULL,
    secondary_description VARCHAR(255) NOT NULL,
    index_code VARCHAR(255) NOT NULL,
    active BOOLEAN NOT NULL
);
--changeset vu_diep:$(now)
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

--changeset vu_diep:$(now)
CREATE TABLE IF NOT EXISTS crime_date_dimension (
	datetime_id INT,
	_month INT,
	_day INT,
	_year INT,
	_hour INT,
	crime_date DATE
);

--changeset vu_diep:$(now)
CREATE TABLE IF NOT EXISTS crime_location_dimension (
	location_id INT primary key,
	latitude FLOAT,
	longitude FLOAT,
	location_description VARCHAR,
	block VARCHAR
);

--changeset vu_diep:$(now)
CREATE TABLE IF NOT EXISTS fbi_code (
	id VARCHAR UNIQUE,
	description VARCHAR,
	crime_against VARCHAR
);
