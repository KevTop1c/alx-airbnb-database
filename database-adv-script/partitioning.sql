-- Step 1: Drop old table if exists (for demo purposes)
DROP TABLE IF EXISTS Booking CASCADE;


-- Step 2: Create partitioned table
CREATE TABLE Booking (
                         booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                         property_id UUID NOT NULL,
                         user_id UUID NOT NULL,
                         start_date DATE NOT NULL,
                         end_date DATE NOT NULL,
                         status VARCHAR(10) CHECK (status IN ('pending','confirmed','canceled')) NOT NULL,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                         CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
                         CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
)
    PARTITION BY RANGE (start_date);


-- Step 3: Create partitions (example: per year, you can do monthly too)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


-- Query to test (date range)
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
