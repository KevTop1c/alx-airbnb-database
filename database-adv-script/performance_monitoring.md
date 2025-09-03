# Database Performance Monitoring Report

## Objective
Continuously monitor and refine query performance by analyzing execution plans and adjusting schema design.

## Queries Tested
1. **Bookings with user and property info (status = confirmed)**
2. **Properties with average rating > 4**
3. **Payments within a date range**

## Observations
- **Bookings query**: Performed sequential scan on `status`, slowing down filtering.
- **Review aggregation**: Grouping and filtering without an index on `property_id`.
- **Payment query**: Full table scan when filtering by `payment_date`.

## Actions Taken
- Added index: `idx_booking_status` (on Booking.status)
- Added composite index: `idx_review_property_rating` (on Review.property_id, rating)
- Added index: `idx_payment_date` (on Payment.payment_date)

## Results
| Query                    | Before | After |
|--------------------------|--------|-------|
| Bookings (status filter) | ~120ms | ~25ms |
| Reviews (avg rating)     | ~200ms | ~60ms |
| Payments (date range)    | ~95ms  | ~20ms |

## Conclusion
Targeted indexing significantly improved query performance.

### Future Steps
- Implement partitioning for very large tables (`Booking`, `Payment`) by date.
- Create materialized views for frequently queried aggregates (e.g., average ratings).
- Schedule periodic reviews with `EXPLAIN ANALYZE` to detect new bottlenecks.
