# Database Normalization Report

## Objective
The goal is to apply normalization principles to ensure the database schema is in **Third Normal Form (3NF)**. This involves eliminating redundancy, ensuring dependencies are logical, and maintaining data integrity.

---

## Step 1: First Normal Form (1NF)
**Rule:**
- All attributes must be atomic (no repeating groups or arrays).
- Each record is unique.

**Check:**
- All attributes (names, emails, dates, prices, roles, etc.) are atomic.
- No multi-valued or composite attributes exist.
- Every table has a primary key.

✅ Schema satisfies **1NF**.

---

## Step 2: Second Normal Form (2NF)
**Rule:**
- Must first satisfy 1NF.
- All non-key attributes must depend on the **whole primary key** (no partial dependency).

**Check:**
- All tables use a **single-column primary key** (UUIDs).
- No table has composite keys.
- Therefore, no partial dependencies exist.

✅ Schema satisfies **2NF**.

---

## Step 3: Third Normal Form (3NF)
**Rule:**
- Must first satisfy 2NF.
- No transitive dependencies (non-key attributes must not depend on other non-key attributes).

**Check:**
- **User Table**:
    - `role` is an ENUM, no transitive dependency.
    - All attributes depend only on `user_id`.
- **Property Table**:
    - Attributes like `name`, `description`, `location`, `pricepernight` all depend directly on `property_id`.
    - No transitive dependencies.
- **Booking Table**:
    - `total_price` could potentially be derived from `pricepernight × number_of_nights`.
    - Keeping `total_price` is acceptable for performance but technically introduces a functional dependency on `property.pricepernight` and booking dates.
    - To strictly maintain 3NF, we should calculate `total_price` dynamically instead of storing it.
- **Payment Table**:
    - All attributes depend only on `payment_id`.
- **Review Table**:
    - All attributes depend only on `review_id`.
- **Message Table**:
    - All attributes depend only on `message_id`.

⚠️ **Potential violation**: `total_price` in **Booking** is a derived attribute (transitive dependency).

---

## Normalization Adjustment
- **Remove `total_price` from Booking** to ensure full compliance with 3NF.
- Instead, compute it as:

`total_price = DATEDIFF(end_date, start_date) * property.pricepernight`


This eliminates redundancy and ensures prices remain consistent if property rates change.

---

## Final Schema Compliance
- All tables are in **3NF** after removing `total_price` from the Booking table.
- If performance is a concern, `total_price` may still be stored as a **denormalized field** with clear documentation that it’s a cached/calculated value.

---


✅ **Conclusion**:  
The database schema satisfies **Third Normal Form (3NF)** after removing the redundant `total_price` attribute from **Booking**.
