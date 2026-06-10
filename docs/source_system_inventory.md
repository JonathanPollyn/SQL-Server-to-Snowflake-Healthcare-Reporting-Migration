# Source System Inventory

## Overview

This document contains the inventory of source SQL Server tables used for migration into Snowflake.

The source system represents a synthetic healthcare clinical database.

---

# Source Tables

| Table Name | Purpose | Expected Target Layer |
|---|---|---|
| PATIENTS | Stores patient demographic information | RAW |
| PROVIDERS | Stores provider information | RAW |
| APPOINTMENTS | Stores appointment scheduling data | RAW |
| OUTPATIENT_VISIT | Stores outpatient visit records | RAW |
| INPATIENT_STAYS | Stores inpatient admission records | RAW |
| DIAGNOSES | Stores diagnosis information | RAW |
| VITAL_SIGNS | Stores patient vital measurements | RAW |
| LAB_RESULTS | Stores laboratory test results | RAW |
| MEDICATION | Stores prescribed medications | RAW |
| PHARMACY | Stores pharmacy fulfillment data | RAW |
| INSURANCE | Stores insurance and payer information | RAW |

---

# Migration Strategy

The migration will follow a layered architecture:

1. Source SQL Server database
2. CSV extraction
3. AWS S3 landing zone
4. Snowflake RAW ingestion
5. STAGING transformations
6. MART reporting models
7. Power BI dashboards


## Initial RAW Tables Created

The first migration batch includes:

- PATIENTS
- PROVIDERS
- APPOINTMENTS

These tables were created in the Snowflake RAW schema to preserve the source structure from SQL Server with minimal transformation.