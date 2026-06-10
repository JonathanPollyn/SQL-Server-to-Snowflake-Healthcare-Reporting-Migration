# Issue: Invalid UTF-8 Characters During Snowflake Load

## Problem

The SSIS-generated patient export contained non-UTF8 characters, causing Snowflake COPY INTO operations to fail.

Example:

François

generated UTF8 validation errors during ingestion.

## Resolution

The Snowflake file format was updated with:

REPLACE_INVALID_CHARACTERS = TRUE

This allowed ingestion to proceed while preserving the overall load process.

## Long-Term Improvement

Configure SSIS Flat File Destinations to export UTF-8 encoded files using Code Page 65001.