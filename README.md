# JonathanPollyn-SQL-Server-to-Snowflake-Healthcare-Reporting-Migration

## Project Overview
This project presents a production-grade migration of healthcare data from a relational SQL database to Stolake, enabling advanced analytics and reporting.
The source system comprises a synthetic clinical database containing patient encounters, provider information, appointments, inpatient stays, outpatient visits, diagnoses, laboratory results, medication records, pharmacy transactions, insurance details, and vital signs.

The primary objectives are to migrate the source data to Snowflake, construct analytics-ready tables, automate data transformation workflows, and integrate the final reporting layer with Power BI.

## Business Objective
Healthcare organizations frequently modernize legacy relational databases by migrating reporting workloads to cloud data platforms such as Snowflake. This project simulates the modernization process exclusively with synthetic healthcare data.

## Project Goals
- Migrate relational healthcare data into Snowflake.
- Utilize AWS S3 as the designated cloud landing zone.
- Develop RAW, STAGING, and MART data layers within Snowflake.
- Validate row counts between source and target systems.
- Create healthcare analytics tables optimized for reporting.
- Develop Power BI dashboards tailored for business users.
- Implement security measures, role-based access control (RBAC), and documentation best practices.
