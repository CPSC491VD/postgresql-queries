-- Query to create destination table (to store results from API for now)
CREATE TABLE crime_data (
    crime_date DATE,
    district VARCHAR(3),
    block VARCHAR(50),
    description VARCHAR(100),
    location_description VARCHAR(100),
    updated_on DATE,
    community_area INT,
    iucr VARCHAR(4),
    ward INT,
    case_number VARCHAR(10),
    year_of INT,
    domestic BOOLEAN,
    fbi_code VARCHAR(3),
    beat INT,
    primary_type VARCHAR(50),
    arrest BOOLEAN,
    id SERIAL PRIMARY KEY,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    insert_date DATE
);

-- Query to hold IUCR data (will be used later for creating fact, dimension tables)
CREATE TABLE iucr (
    iucr VARCHAR(255) UNIQUE NOT NULL,
    primary_description VARCHAR(255) NOT NULL,
    secondary_description VARCHAR(255) NOT NULL,
    index_code VARCHAR(255) NOT NULL,
    active BOOLEAN NOT NULL
);

CREATE TABLE crime_fact_table (
	id VARCHAR,
	datetime_id INT,
	description VARCHAR,
	location_id INT,
	community_area INT,
	iucr VARCHAR,
	case_number VARCHAR,
	domestic BOOLEAN,
	primary_type VARCHAR(50),
	arrest BOOLEAN
);

CREATE TABLE crime_date_dimension (
	datetime_id INT,
	month INT,
	day INT,
	year INT,
	hour INT,
	crime_date DATE
);

CREATE TABLE crime_location_dimension (
	location_id INT primary key,
	latitude FLOAT,
	longitude FLOAT,
	location_description VARCHAR,
	block VARCHAR
)
