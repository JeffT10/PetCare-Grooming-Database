# PetCare Grooming Co. — Relational Database Design

## Project Overview

This coursework project designs a relational database for a hypothetical pet grooming salon transitioning from paper forms and basic spreadsheets to centralized recordkeeping.

**Portfolio note:** The SQL scripts in this repository are a reconstructed implementation based on the project design document, not necessarily the original submitted scripts. All sample data is fictional.

## Objectives

* Organize owner, pet, groomer, service, appointment, payment, product, and sales records.
* Use primary keys, foreign keys, constraints, and associative tables to support relational integrity.
* Write SQL queries for operational reporting and exception review.

## Database Tables

The schema contains 11 tables:

| Table                 | Purpose                                       |
| --------------------- | --------------------------------------------- |
| `Owners`              | Owner contact information                     |
| `Pets`                | Pet details linked to an owner                |
| `Groomers`            | Groomer contact information and specialties   |
| `Services`            | Service descriptions, prices, and durations   |
| `Appointments`        | Appointment scheduling and status             |
| `AppointmentServices` | Services associated with appointments         |
| `Payments`            | Payments recorded for appointments            |
| `Products`            | Retail inventory                              |
| `Sales`               | Retail sales linked to owners                 |
| `SaleDetails`         | Products and quantities included in each sale |
| `GroomerServices`     | Services each groomer is qualified to perform |

Associative tables resolve many-to-many relationships between appointments and services, sales and products, and groomers and services.

## Repository Files

* `sql/schema.sql` — creates tables and relational constraints.
* `sql/sample_data.sql` — fictional test data.
* `sql/queries.sql` — five reporting and data-review queries.
* `documentation/data_dictionary.md` — table descriptions.
* `documentation/relationships.md` — entity relationship diagram.

## Example SQL Queries

1. Total recorded payment revenue by groomer.
2. Pets with special medical notes.
3. Most recent appointment for each owner and pet.
4. Owners with individual payments above $50.
5. Appointments with no payment record.

## How to Run the Project

Use MySQL 8.0 or a compatible client.

1. Run `sql/schema.sql`.
2. Run `sql/sample_data.sql`.
3. Run individual statements in `sql/queries.sql`.

## Design Considerations and Limitations

* Primary and foreign keys link related records; composite keys prevent duplicate pairs in associative tables.
* `Payments.AppointmentID` is unique, representing at most one payment record per appointment.
* Appointments can exist without a payment record so an exception query can flag records for review.
* This is a coursework/portfolio design, not a deployed production system. It does not include a user interface, user authentication, automated appointment conflict prevention, or production security controls.

## Skills Demonstrated

Relational Database Design · MySQL · SQL Joins · Aggregation · Filtering · Data Integrity Constraints · Data Retrieval · Operational Reporting · Exception Reporting
