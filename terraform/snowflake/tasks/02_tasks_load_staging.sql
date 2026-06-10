USE ROLE ACCOUNTADMIN;
USE WAREHOUSE WH_HEALTHCARE_ETL;
USE DATABASE HEALTHCARE_MIGRATION_DB;

CREATE OR REPLACE TASK TASK_LOAD_STG_PATIENTS
WAREHOUSE = WH_HEALTHCARE_ETL
SCHEDULE = '5 MINUTE'
WHEN SYSTEM$STREAM_HAS_DATA('STR_PATIENTS')
AS
INSERT INTO STAGING.STG_PATIENTS (
    patient_id,
    first_name,
    last_name,
    date_of_birth,
    gender,
    phone_number,
    email,
    city,
    state,
    zip_code,
    insurance_id
)
SELECT
    patient_id,
    TRIM(first_name),
    TRIM(last_name),
    date_of_birth,
    UPPER(gender),
    phone_number,
    LOWER(email),
    city,
    state,
    zip_code,
    insurance_id
FROM STR_PATIENTS
WHERE METADATA$ACTION = 'INSERT';

ALTER TASK TASK_LOAD_STG_PATIENTS RESUME;

SHOW TASKS;

SHOW TASKS LIKE 'TASK_LOAD_STG_PATIENTS';