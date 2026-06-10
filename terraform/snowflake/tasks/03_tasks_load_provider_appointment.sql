USE ROLE ACCOUNTADMIN;
USE WAREHOUSE WH_HEALTHCARE_ETL;
USE DATABASE HEALTHCARE_MIGRATION_DB;

CREATE OR REPLACE TASK TASK_LOAD_STG_PROVIDERS
WAREHOUSE = WH_HEALTHCARE_ETL
SCHEDULE = '5 MINUTE'
WHEN SYSTEM$STREAM_HAS_DATA('STR_PROVIDERS')
AS
INSERT INTO STAGING.STG_PROVIDERS (
    provider_id,
    first_name,
    last_name,
    specialty,
    license_number,
    phone_number,
    email,
    clinic_location
)
SELECT
    provider_id,
    TRIM(first_name),
    TRIM(last_name),
    specialty,
    license_number,
    phone_number,
    LOWER(email),
    clinic_location
FROM STR_PROVIDERS
WHERE METADATA$ACTION = 'INSERT';


CREATE OR REPLACE TASK TASK_LOAD_STG_APPOINTMENTS
WAREHOUSE = WH_HEALTHCARE_ETL
SCHEDULE = '5 MINUTE'
WHEN SYSTEM$STREAM_HAS_DATA('STR_APPOINTMENTS')
AS
INSERT INTO STAGING.STG_APPOINTMENTS (
    appointment_id,
    patient_id,
    provider_id,
    appointment_date,
    appointment_time,
    reason_for_visit,
    status,
    created_at,
    updated_at
)
SELECT
    appointment_id,
    patient_id,
    provider_id,
    appointment_date,
    appointment_time,
    reason_for_visit,
    UPPER(status),
    created_at,
    updated_at
FROM STR_APPOINTMENTS
WHERE METADATA$ACTION = 'INSERT';