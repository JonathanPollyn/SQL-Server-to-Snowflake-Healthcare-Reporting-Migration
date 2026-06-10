# Architecture Design

## High-Level Architecture

The project follows a modern cloud data engineering pattern:

SQL Server Source Database  
- CSV Data Export  
- AWS S3 Landing Zone  
- Snowflake RAW Layer  
- Snowflake STAGING Layer  
- Snowflake MART Layer  
- Power BI Reporting

## Why This Architecture

The source SQL database represents an operational clinical system. Instead of reporting directly from the source system, the data is exported and loaded into Snowflake, where it can be transformed, modeled, secured, and optimized for analytics.

## Architecture Layers

### Source Layer
The source layer contains the original SQL Server clinical database tables.

### Landing Layer
AWS S3 is used as a cloud landing zone for exported CSV files.

### RAW Layer
The RAW schema stores data as close to the source format as possible.

### STAGING Layer
The STAGING schema cleans, standardizes, and prepares the data.

### MART Layer
The MART schema contains business-ready reporting tables for Power BI.

### Reporting Layer
Power BI connects to Snowflake MART tables for healthcare analytics reporting.