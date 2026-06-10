USE DATABASE HEALTHCARE_MIGRATION_DB;
USE SCHEMA STAGING;

CREATE OR REPLACE TABLE STG_PATIENTS AS
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

CREATE OR REPLACE TABLE STG_PROVIDERS AS
SELECT
    provider_id,
    TRIM(first_name) AS first_name,
    TRIM(last_name) AS last_name,
    specialty,
    license_number,
    LOWER(email) AS email,
    clinic_location,
    load_dt
FROM HEALTHCARE_MIGRATION_DB.RAW.PROVIDERS;

CREATE OR REPLACE TABLE STG_APPOINTMENTS AS
SELECT
    appointment_id,
    patient_id,
    provider_id,
    appointment_date,
    appointment_time,
    reason_for_visit,
    UPPER(status) AS status,
    created_at,
    updated_at,
    load_dt
FROM HEALTHCARE_MIGRATION_DB.RAW.APPOINTMENTS;

SELECT COUNT(*) FROM STAGING.STG_PATIENTS;
SELECT COUNT(*) FROM STAGING.STG_PROVIDERS;
SELECT COUNT(*) FROM STAGING.STG_APPOINTMENTS;