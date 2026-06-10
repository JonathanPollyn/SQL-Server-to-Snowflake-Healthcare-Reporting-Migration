USE ROLE ACCOUNTADMIN;
USE WAREHOUSE WH_HEALTHCARE_ETL;
USE DATABASE HEALTHCARE_MIGRATION_DB;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE PATIENTS (
    patient_id NUMBER,
    first_name STRING,
    last_name STRING,
    date_of_birth DATE,
    gender STRING,
    phone_number STRING,
    email STRING,
    address STRING,
    city STRING,
    state STRING,
    zip_code STRING,
    emergency_contact_name STRING,
    emergency_contact_phone STRING,
    insurance_id NUMBER,
    load_dt TIMESTAMP_NTZ
);

CREATE OR REPLACE TABLE PROVIDERS (
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

CREATE OR REPLACE TABLE APPOINTMENTS (
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