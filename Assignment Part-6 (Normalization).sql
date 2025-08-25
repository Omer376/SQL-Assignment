#Q1)1. First Normal Form (1NF):
 -- a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.

#ANS:-
-- 1. First Normal Form (1NF)
-- Rule: A table is in 1NF if it has no repeating groups or multivalued attributes. 
--       Each cell must hold only a single value (atomicity).

-- a. Identify a table in Sakila that violates 1NF:
-- Example: The 'film' table.
-- Problem: The 'special_features' column in 'film' contains multiple values 
--          (like 'Trailers,Deleted Scenes,Behind the Scenes') in a single cell. 
--          This violates 1NF because it stores multivalued attributes.

-- b. How to normalize it to 1NF:
-- Step 1: Remove the multivalued column (special_features) from the 'film' table.
-- Step 2: Create a new table 'film_special_features' to store one feature per row.
-- Step 3: Establish a relationship with 'film_id'.

#Q2)2. Second Normal Form (2NF):
-- a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
-- If it violates 2NF, expplain the steps to normalize it.

#ANS:-
-- 2. Second Normal Form (2NF)
-- Rule: A table is in 2NF if:
--   (1) It is already in 1NF.
--   (2) Every non-key attribute is fully dependent on the whole primary key 
--       (no partial dependency on part of a composite key).
-- a. Choose a table in Sakila:
-- Example: The 'film_actor' table.
-- Columns: film_id (PK), actor_id (PK), last_update
-- b. Determine if it is in 2NF:
--   - Primary Key = (film_id, actor_id) [composite key].
--   - The non-key column 'last_update' depends on BOTH film_id and actor_id.
--   - There is NO partial dependency (it doesn’t depend on only film_id or actor_id).
--   => So 'film_actor' IS already in 2NF.
-- Another Example: Consider the 'rental' table.
-- Columns: rental_id (PK), rental_date, inventory_id (FK), customer_id (FK), return_date, staff_id, last_update
--   - PK = rental_id (single column).
--   - All non-key attributes depend fully on rental_id.
--   => So 'rental' is also already in 2NF.
-- Let's take a hypothetical violation case:
-- Suppose we had a table 'film_category_extra':
--   film_id, category_id, category_name
--   (PK = film_id + category_id)
-- Problem: 'category_name' depends only on 'category_id' (part of the composite key),
--          not on the whole (film_id, category_id).
--          => This violates 2NF (partial dependency).
-- c. How to normalize to 2NF:
-- Step 1: Remove partial dependency by splitting the table.
-- Step 2: Keep only attributes fully dependent on the composite key in one table.
-- Step 3: Move the partially dependent attributes to another table.
-- Example Fix:
-- Table 1: film_category (film_id, category_id) -- composite PK
-- Table 2: category (category_id, category_name) -- PK = category_id
-- Now:
--   film_category maps films to categories.
--   category stores category details.
--   => 2NF achieved (no partial dependency).



#Q3)3. Third Normal Form (3NF):
 -- a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
 -- present and outline the steps to normalize the table to 3NF.

#ANS:-
-- 3. Third Normal Form (3NF)
-- Rule: A table is in 3NF if:
--   (1) It is already in 2NF.
--   (2) There are NO transitive dependencies 
--       (i.e., non-key attributes should NOT depend on other non-key attributes).
-- a. Choose a table in Sakila:
-- Example: The 'address' table.
-- Columns: address_id (PK), address, address2, district, city_id (FK), postal_code, phone, last_update
-- b. Check for 3NF:
--   - PK = address_id.
--   - Non-key attributes: address, district, city_id, postal_code, phone.
--   - Problem: city_id → city → country_id.
--              Meaning: postal_code, district, etc. are tied to city_id,
--              but city_id itself determines country_id (through 'city' table).
--   => This is a TRANSITIVE DEPENDENCY (non-key attribute depends on another non-key).
-- So the 'address' table violates 3NF.
-- c. How to normalize to 3NF:
-- Step 1: Identify the transitive dependency (address → city_id → country_id).
-- Step 2: Move the transitive attribute to a separate table.
-- Step 3: Keep only attributes directly dependent on the primary key.
-- Example Fix:
-- Table 1: address(address_id, address, address2, district, city_id, postal_code, phone, last_update)
-- Table 2: city(city_id, city, country_id, last_update)
-- Table 3: country(country_id, country, last_update)
-- Now:
--   - 'address' depends only on address_id.
--   - 'city' depends only on city_id.
--   - 'country' depends only on country_id.
--   => No transitive dependencies remain. 3NF achieved.


#Q4)malization Process:
-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial 
-- unnormalized form up to at least 2NF.

#ANS:-

-- Normalization Process Example
-- We will take the 'film' table from Sakila.

-- film table (original structure):
-- film(film_id, title, description, release_year, language_id, original_language_id,
--      rental_duration, rental_rate, length, replacement_cost, rating,
--      special_features, last_update)

-- ---------------------------------------------------------
-- STEP 1: Unnormalized Form (UNF)
-- Problem in UNF:
--   - The 'special_features' column stores MULTIPLE values in a single field (e.g., "Trailers, Deleted Scenes, Behind the Scenes").
--   - Repeating groups violate 1NF.

-- ---------------------------------------------------------
-- STEP 2: First Normal Form (1NF)
-- Rule: Each attribute must contain atomic (indivisible) values.
-- Fix:
--   - Remove multi-valued attribute 'special_features'.
--   - Create a separate table to store features.

-- New structure:
-- film(film_id, title, description, release_year, language_id, original_language_id,
--      rental_duration, rental_rate, length, replacement_cost, rating, last_update)
-- film_special_features(film_id, feature)

-- Now each 'feature' is stored as a single row → 1NF achieved.

-- ---------------------------------------------------------
-- STEP 3: Second Normal Form (2NF)
-- Rule: Table must be in 1NF and have NO partial dependency 
--       (i.e., no non-key attribute depends on part of a composite primary key).

-- Problem:
--   - In 'film_actor' table (many-to-many relationship), PK = (film_id, actor_id).
--   - If we stored attributes like actor_name inside it, 
--     then actor_name would depend only on actor_id, not the whole composite key.

-- Fix:
--   - Keep only (film_id, actor_id) in 'film_actor'.
--   - Move actor details to a separate 'actor' table.

-- New structure:
-- film_actor(film_id, actor_id)
-- actor(actor_id, first_name, last_name, last_update)

-- Now every non-key attribute fully depends on the WHOLE primary key → 2NF achieved.
