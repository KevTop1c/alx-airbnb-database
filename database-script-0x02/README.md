# Seed Data – ALX Airbnb Clone Database

This folder contains SQL scripts to populate the **Airbnb Clone Database** with sample data for testing and development purposes.

## File
- **seed_data.sql** → Inserts sample data into all tables: `User`, `Property`, `Booking`, `Payment`, `Review`, `Message`.

## Sample Data Overview
1. **Users**
    - Multiple users with roles: `guest` and `host`.
    - Includes sample emails and hashed passwords (placeholder values).

2. **Properties**
    - Properties listed by hosts.
    - Includes property name, description, location, and price per night.

3. **Bookings**
    - Bookings made by guests for specific properties.
    - Status values: `pending`, `confirmed`.

4. **Payments**
    - Payment records linked to bookings.
    - Includes amount and payment method (`credit_card`, `paypal`).

5. **Reviews**
    - User reviews for properties.
    - Includes rating (1–5) and comments.

6. **Messages**
    - Messages between users (guests and hosts).
    - Simulates realistic communication.
