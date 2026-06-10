USE DATABASE HEALTHCARE_MIGRATION_DB;
USE SCHEMA MART;

CREATE OR REPLACE TABLE MART_PATIENT_APPOINTMENTS (
    appointment_id NUMBER,
    patient_id NUMBER,
    patient_name STRING,
    gender STRING,
    patient_city STRING,
    patient_state STRING,
    provider_id NUMBER,
    provider_name STRING,
    specialty STRING,
    clinic_location STRING,
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit STRING,
    appointment_status STRING,
    created_at TIMESTAMP_NTZ,
    updated_at TIMESTAMP_NTZ,
    load_dt TIMESTAMP_NTZ
);

INSERT INTO MART_PATIENT_APPOINTMENTS
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
FROM HEALTHCARE_MIGRATION_DB.STAGING.STG_APPOINTMENTS a
LEFT JOIN HEALTHCARE_MIGRATION_DB.STAGING.STG_PATIENTS p
    ON a.patient_id = p.patient_id
LEFT JOIN HEALTHCARE_MIGRATION_DB.STAGING.STG_PROVIDERS pr
    ON a.provider_id = pr.provider_id;


SELECT COUNT(*) FROM MART.MART_PATIENT_APPOINTMENTS;

SELECT *
FROM MART.MART_PATIENT_APPOINTMENTS
LIMIT 10;

/* This mart supports Power BI reporting for
appointments by provider
appointments by specialty
completed vs no-show appointments
patient visit trends
clinic location analysis*/