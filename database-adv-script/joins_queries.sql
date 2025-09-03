-- ====================
-- INNER JOIN
-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
-- ====================
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
         INNER JOIN "User" u
                    ON b.user_id = u.user_id;


-- ====================
-- LEFT JOIN
-- Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
-- ====================
SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
         LEFT JOIN Review r
                   ON p.property_id = r.property_id;
ORDER BY p.name ASC, r.rating DESC;


-- ====================
-- FULL OUTER JOIN
-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
-- ====================
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status
FROM "User" u
         FULL OUTER JOIN Booking b
                         ON u.user_id = b.user_id;