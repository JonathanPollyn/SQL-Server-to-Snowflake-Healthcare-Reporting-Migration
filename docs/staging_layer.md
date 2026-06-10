# STAGING Layer

## Purpose

The STAGING layer standardizes and cleans source data loaded into RAW tables.

## Transformations

### PATIENTS

- Trim text fields
- Standardize email casing
- Standardize gender values

### PROVIDERS

- Trim text fields
- Standardize email casing

### APPOINTMENTS

- Standardize status values

## Design Principle

The STAGING layer isolates data quality and cleansing logic from the reporting layer.