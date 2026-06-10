USE DATABASE HEALTHCARE_MIGRATION_DB;
USE SCHEMA STAGING;

CREATE OR REPLACE TABLE STG_PATIENTS (
    patient_id NUMBER,
    first_name STRING,
    last_name STRING,
    date_of_birth DATE,
    gender STRING,
    phone_number STRING,
    email STRING,
    city STRING,
    state STRING,
    zip_code STRING,
    insurance_id NUMBER,
    load_dt TIMESTAMP_NTZ
);

INSERT INTO STG_PATIENTS
SELECT
    patient_id,
    TRIM(first_name) AS first_name,
    TRIM(last_name) AS last_name,
    date_of_birth,
    UPPER(gender) AS gender,
    phone_number,
    LOWER(email) AS email,
    city,
    state,
    zip_code,
    insurance_id,
    load_dt
FROM HEALTHCARE_MIGRATION_DB.RAW.PATIENTS;