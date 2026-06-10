# Snowflake Architecture

## Warehouse

WH_HEALTHCARE_ETL

Purpose:
Dedicated compute for ingestion and transformation workloads.

## Database

HEALTHCARE_MIGRATION_DB

## Schemas

RAW
STAGING
MART
AUDIT

## Design Rationale

The architecture separates source data, transformed data, reporting models, and operational auditing to improve governance and maintainability.