# Partitioning Report for Booking Table

## Objective
Optimize queries on the Booking table by applying range partitioning on the `start_date` column.

## Method
- Implemented declarative partitioning by year (Booking_2023, Booking_2024, Booking_2025).
- Ran test queries filtering on date ranges before and after partitioning using EXPLAIN ANALYZE.

## Results
- **Before Partitioning**: Queries scanned the entire Booking table, resulting in high I/O cost and slower execution.
- **After Partitioning**: PostgreSQL applied partition pruning and only scanned the relevant partition (e.g., Booking_2024 for 2024 queries).
- Execution time reduced significantly (depending on dataset size).
- Insert operations automatically routed to correct partition without extra logic.

## Conclusion
Partitioning by date on the Booking table substantially improves query performance for date-range queries. This approach is especially beneficial as the dataset grows year over year.
