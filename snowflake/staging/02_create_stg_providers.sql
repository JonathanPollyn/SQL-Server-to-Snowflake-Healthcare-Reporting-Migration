CREATE OR REPLACE TABLE STG_PROVIDERS (
    provider_id NUMBER,
    first_name STRING,
    last_name STRING,
    specialty STRING,
    license_number STRING,
    phone_number STRING,
    email STRING,
    clinic_location STRING,
    load_dt TIMESTAMP_NTZ
);

INSERT INTO STG_PROVIDERS
SELECT
    provider_id,
    TRIM(first_name) AS first_name,
    TRIM(last_name) AS last_name,
    specialty,
    license_number,
    phone_number,
    LOWER(email) AS email,
    clinic_location,
    load_dt
FROM HEALTHCARE_MIGRATION_DB.RAW.PROVIDERS;