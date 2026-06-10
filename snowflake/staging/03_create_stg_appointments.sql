CREATE OR REPLACE TABLE STG_APPOINTMENTS (
    appointment_id NUMBER,
    patient_id NUMBER,
    provider_id NUMBER,
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit STRING,
    status STRING,
    created_at TIMESTAMP_NTZ,
    updated_at TIMESTAMP_NTZ,
    load_dt TIMESTAMP_NTZ
);

INSERT INTO STG_APPOINTMENTS
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