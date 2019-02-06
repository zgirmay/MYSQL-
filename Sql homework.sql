SELECT first_name, last_name FROM actor;

SELECT 
	first_name, 
    last_name,
    concat(first_name, ' ', last_name) as FullName
FROM actor;

SELECT * FROM actor
WHERE first_name = 'Joe';

SELECT * FROM actor
WHERE last_name LIKE '%GEN%';

ALTER TABLE actor MODIFY first_name VARCHAR(20) AFTER last_name;
SELECT * FROM actor
WHERE last_name LIKE '%LI%';

SELECT country, country_id FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor
ADD COLUMN  Description BLOB(20) AFTER first_name;
SELECT * FROM actor;

ALTER TABLE actor
DROP COLUMN Description;
ALTER TABLE actor MODIFY last_name VARCHAR(20) AFTER first_name; 
SELECT * FROM actor;

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name; 

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*) >= 2; 

UPDATE actor
SET first_name = "Harpo" 
WHERE first_name = "Groucho" AND last_name = "Williams";

UPDATE actor
SET first_name = "Groucho" 
WHERE first_name = "Harpo" AND last_name = "Williams";

SHOW CREATE TABLE address;

SELECT * FROM address;
SELECT s.first_name, s.last_name, a.address
FROM staff s JOIN address a ON s.address_id = a.address_id;

SELECT * FROM payment;
SELECT s.first_name, s.last_name, SUM(p.amount) 
FROM staff s JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.first_name, s.last_name;

SELECT * FROM film_actor;
SELECT * FROM film;
SELECT f.title, COUNT(a.actor_id) 
FROM film f INNER JOIN film_actor a ON f.film_id = a.actor_id
GROUP BY f.title;

SELECT * FROM inventory;
SELECT * FROM film;
SELECT f.title, COUNT(i.inventory_id) 
FROM film f JOIN inventory i ON f.film_id = i.inventory_id
WHERE f.title = 'Hunchback Impossible';

SELECT * FROM customer;
SELECT * FROM payment;
SELECT c.first_name, c.last_name, SUM(p.amount) 
FROM customer c JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name;

SELECT * FROM film;
SELECT * FROM language;
SELECT title FROM film WHERE title LIKE'K%' OR title LIKE 'Q%'
AND language_id=(SELECT language_id FROM language WHERE name = 'English');

SELECT first_name, last_name
FROM actor WHERE actor_id IN
(
SELECT actor_id
FROM film_actor
WHERE film_id IN
(

SELECT film_id
FROM film
WHERE title = 'Alone Trip'
)

);

SELECT * FROM customer;
SELECT * FROM address;
SELECT c.first_name, c.last_name, c.email
FROM customer c JOIN address a ON c.address_id = a.address_id
JOIN city t ON a.city_id = t.city_id;
JOIN country r ON t.city_id = r.country_id;

SELECT * FROM film;
SELECT * FROM film_category;
SELECT title
FROM film f JOIN film_category c ON f.film_id = c.film_id
JOIN category g ON c.category_id = g.category_id;

SELECT * FROM film;
SELECT * FROM inventory;
SELECT * FROM rental; 
SELECT title, COUNT(f.film_id)
FROM film f JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY title ORDER BY COUNT(f.film_id) DESC;

SELECT * FROM payment;
SELECT * FROM staff;
SELECT store_id, SUM(p.amount)
FROM staff s JOIN payment p ON s.staff_id = p.staff_id
GROUP BY store_id;

SELECT * FROM store;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;
SELECT store_id, city, country
FROM store s JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id;
JOIN country r ON c.country_id = r.country_id;
