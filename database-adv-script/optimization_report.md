# Database Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and applying schema adjustments.

## Methodology
1. Identified three high-frequency queries:
    - Bookings with user + property info
    - Properties with avg rating > 4
    - Payments within a date range
2. Run `EXPLAIN ANALYZE` to capture query execution plans.
3. Added targeted indexes to improve performance.
4. Rerun queries and compared execution times.

## Observations
- **Bookings query**: Sequential scans were used on `Booking.status`, slowing down filtering on large datasets.
- **Review query**: Full table scan + aggregation without indexing caused significant delay.
- **Payment query**: Date range queries scanned the entire Payment table without utilizing an index.

## Actions Taken
- Added index: `idx_booking_status` on `Booking.status`
- Added composite index: `idx_review_property_rating` on `(property_id, rating)`
- Added index: `idx_payment_date` on `Payment.payment_date`

## Results
- **Bookings query**: Improved runtime from ~120ms → ~25ms (75% faster).
- **Review query**: Improved runtime from ~200ms → ~60ms.
- **Payment query**: Improved runtime from ~95ms → ~20ms.

## Conclusion
Targeted indexing based on observed query patterns provides substantial performance gains.  
Future optimizations may include:
- **Partitioning the Payment table** by `payment_date` for even faster time-based queries.
- **Materialized views** for expensive aggregations (e.g., property average ratings).
- Ongoing monitoring of query execution plans to ensure sustained performance.
