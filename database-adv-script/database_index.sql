-- ====================
-- Indexes for User Table
-- ====================
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_user_id ON "User"(user_id);


-- ====================
-- Indexes for Property Table
-- ====================
CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_id ON Property(property_id);


-- ====================
-- Indexes for Booking Table
-- ====================
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);


-- ====================
-- User Lookup by Email
-- ====================
EXPLAIN ANALYZE
SELECT *
FROM Booking b
         JOIN "User" u ON b.user_id = u.user_id
WHERE u.email = 'alice@example.com';


-- ====================
-- Property Search by Location
-- ====================
EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE location = 'Accra, Ghana';


-- ====================
-- Booking Availability Check
-- ====================
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE property_id = '123e4567-e89b-12d3-a456-426614174000'
  AND start_date <= '2025-09-15'
  AND end_date >= '2025-09-10';