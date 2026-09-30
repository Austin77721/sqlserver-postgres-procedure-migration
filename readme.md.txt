# SQL Server PIVOT to PostgreSQL Stored Procedure

## Business Scenario

A healthcare application requires a department-wise
patient visit summary for hospital management.

The report displays different visit types as columns.

## Business Requirements

- Filter visits by date range
- Include only completed visits
- Include only active departments
- Group results by department
- Display visit types as columns
- Calculate total visits

## SQL Server Implementation

SQL Server uses:

PIVOT
COUNT()
ISNULL()
DATEADD()

## PostgreSQL Implementation

PostgreSQL uses:

PL/pgSQL
REFCURSOR
FILTER
COUNT()
INTERVAL
COALESCE / Boolean logic

## Migration

SQL Server:

Rows
 ↓
PIVOT
 ↓
Columns

PostgreSQL:

Rows
 ↓
COUNT() FILTER
 ↓
Columns