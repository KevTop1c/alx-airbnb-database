# Database Schema – ALX Airbnb Clone

This folder contains the database schema definition for the **Airbnb Clone Project**.

## Files
- **schema.sql** → SQL script that creates all tables, constraints, and indexes.

## Entities
1. **User**
    - Stores user details (guest, host, admin).
    - Email is unique and indexed.

2. **Property**
    - Represents properties listed by hosts.
    - Linked to `User` through `host_id`.

3. **Booking**
    - Represents bookings made by guests.
    - References `Property` and `User`.

4. **Payment**
    - Tracks payments for bookings.
    - References `Booking`.

5. **Review**
    - Stores reviews left by users for properties.
    - References `Property` and `User`.

6. **Message**
    - Messaging between users (guests ↔ hosts).
    - References `User` for sender and recipient.

## Normalization
- Database design is in **Third Normal Form (3NF)**.
- Removed derived data (e.g., `total_price` from Booking).
- Enforced referential integrity via foreign keys.
