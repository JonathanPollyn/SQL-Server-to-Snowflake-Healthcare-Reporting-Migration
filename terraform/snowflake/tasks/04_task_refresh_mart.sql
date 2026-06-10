USE ROLE ACCOUNTADMIN;
USE WAREHOUSE WH_HEALTHCARE_ETL;
USE DATABASE HEALTHCARE_MIGRATION_DB;

CREATE OR REPLACE TASK TASK_REFRESH_MART_PATIENT_APPOINTMENTS
WAREHOUSE = WH_HEALTHCARE_ETL
SCHEDULE = '10 MINUTE'
AS
CREATE OR REPLACE TABLE MART.MART_PATIENT_APPOINTMENTS AS
SELECT
    a.appointment_id,
    p.patient_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    p.gender,
    p.city AS patient_city,
    p.state AS patient_state,
    pr.provider_id,
    pr.first_name || ' ' || pr.last_name AS provider_name,
    pr.specialty,
    pr.clinic_location,
    a.appointment_date,
    a.appointment_time,
    a.reason_for_visit,
    a.status AS appointment_status,
    a.created_at,
    a.updated_at,
    CURRENT_TIMESTAMP() AS load_dt
FROM STAGING.STG_APPOINTMENTS a
LEFT JOIN STAGING.STG_PATIENTS p
    ON a.patient_id = p.patient_id
LEFT JOIN STAGING.STG_PROVIDERS pr
    ON a.provider_id = pr.provider_id;