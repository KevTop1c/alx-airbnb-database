-- Seed data for ALX Airbnb Clone Database (MySQL)

-- ====================
-- Users
-- ====================
INSERT INTO `User` (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (UUID(), 'Alice', 'Johnson', 'alice@example.com', 'hash1', '555-1111', 'guest'),
    (UUID(), 'Bob', 'Smith', 'bob@example.com', 'hash2', '555-2222', 'host'),
    (UUID(), 'Charlie', 'Brown', 'charlie@example.com', 'hash3', '555-3333', 'guest'),
    (UUID(), 'Dana', 'White', 'dana@example.com', 'hash4', '555-4444', 'host');

-- ====================
-- Properties
-- ====================
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
SELECT UUID(), user_id, 'Cozy Apartment', 'A nice cozy apartment downtown.', 'New York, NY', 120.00
FROM `User` WHERE email='bob@example.com';

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
SELECT UUID(), user_id, 'Beach House', 'Beautiful beach house with ocean view.', 'Miami, FL', 250.00
FROM `User` WHERE email='dana@example.com';

-- ====================
-- Bookings
-- ====================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
SELECT UUID(), p.property_id, u.user_id, '2025-09-01', '2025-09-05', 'confirmed'
FROM Property p
         JOIN `User` u ON u.email='alice@example.com'
WHERE p.name='Cozy Apartment';

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
SELECT UUID(), p.property_id, u.user_id, '2025-09-10', '2025-09-15', 'pending'
FROM Property p
         JOIN `User` u ON u.email='charlie@example.com'
WHERE p.name='Beach House';

-- ====================
-- Payments
-- ====================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
SELECT UUID(), b.booking_id, 120.00*4, 'credit_card'
FROM Booking b
         JOIN `User` u ON u.email='alice@example.com'
WHERE b.status='confirmed';

INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
SELECT UUID(), b.booking_id, 250.00*5, 'paypal'
FROM Booking b
         JOIN `User` u ON u.email='charlie@example.com'
WHERE b.status='pending';

-- ====================
-- Reviews
-- ====================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
SELECT UUID(), p.property_id, u.user_id, 5, 'Amazing stay, highly recommend!'
FROM Property p
         JOIN `User` u ON u.email='alice@example.com'
WHERE p.name='Cozy Apartment';

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
SELECT UUID(), p.property_id, u.user_id, 4, 'Beautiful house, great location.'
FROM Property p
         JOIN `User` u ON u.email='charlie@example.com'
WHERE p.name='Beach House';

-- ====================
-- Messages
-- ====================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
SELECT UUID(), u1.user_id, u2.user_id, 'Hi, I am interested in booking your property.'
FROM `User` u1, `User` u2
WHERE u1.email='alice@example.com' AND u2.email='bob@example.com';

INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
SELECT UUID(), u1.user_id, u2.user_id, 'Hello, your stay is confirmed. Looking forward to hosting!'
FROM `User` u1, `User` u2
WHERE u1.email='bob@example.com' AND u2.email='alice@example.com';
