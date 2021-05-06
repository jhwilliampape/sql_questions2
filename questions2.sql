
-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE district = 'Texas';
-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE amount >= 6.99;
-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);
-- 4. List all customers that live in Nepal (use the city table)
SELECT customer.first_name,customer.last_name,city
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE city = 'Nepal';
-- 5. Which staff member had the most transactions?
SELECT staff.first_name,staff.last_name
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff_id
ORDER BY COUNT(payment_id) DESC
LIMIT 1;
-- 6. How many movies of each rating are there?
SELECT rating
FROM film
GROUP BY COUNT(rating);
-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	WHERE amount > 6.99
);