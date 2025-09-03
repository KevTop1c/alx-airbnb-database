-- 1. Initial Query Analysis
-- -------------------------
-- Retrieve all bookings with user and property info
EXPLAIN ANALYZE
SELECT b.booking_id, u.first_name, u.last_name, p.name, b.start_date, b.end_date
FROM Booking b
         JOIN "User" u ON b.user_id = u.user_id
         JOIN Property p ON b.property_id = p.property_id
WHERE b.status = 'confirmed';

-- Find properties with average rating above 4
EXPLAIN ANALYZE
SELECT p.property_id, p.name, AVG(r.rating) as avg_rating
FROM Property p
         JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name
HAVING AVG(r.rating) > 4;

-- Get payments within a date range
EXPLAIN ANALYZE
SELECT payment_id, booking_id, amount
FROM Payment
WHERE payment_date BETWEEN '2024-01-01' AND '2024-12-31';


-- 2. Apply Indexes to Improve Performance
-- ---------------------------------------
-- Add index on Booking.status (frequent filter)
CREATE INDEX idx_booking_status ON Booking(status);

-- Add composite index for property reviews (joins + filter)
CREATE INDEX idx_review_property_rating ON Review(property_id, rating);

-- Add index for Payment.date (frequent range queries)
CREATE INDEX idx_payment_date ON Payment(payment_date);


-- 3. Rerun Queries After Indexing
-- -------------------------------
-- Booking query after optimization
EXPLAIN ANALYZE
SELECT b.booking_id, u.first_name, u.last_name, p.name, b.start_date, b.end_date
FROM Booking b
         JOIN "User" u ON b.user_id = u.user_id
         JOIN Property p ON b.property_id = p.property_id
WHERE b.status = 'confirmed';

-- Review aggregation after optimization
EXPLAIN ANALYZE
SELECT p.property_id, p.name, AVG(r.rating) as avg_rating
FROM Property p
         JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name
HAVING AVG(r.rating) > 4;

-- Payment query after optimization
EXPLAIN ANALYZE
SELECT payment_id, booking_id, amount
FROM Payment
WHERE payment_date BETWEEN '2024-01-01' AND '2024-12-31';