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
