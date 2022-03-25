USE Sakila; 
Select * FROM actor; -- 1
SELECT * FROM actor 
	WHERE first_name ='John'; -- 2
SELECT * FROM actor
	WHERE last_name ='Neeson'; -- 3
SELECT * FROM actor
	WHERE actor_id%10 = 0; -- 4
Select * FROM film
	WHERE film_id = 100; -- 5
Select * FROM film
	WHERE rating = 'R'; -- 6
SELECT * FROM film ORDER BY length LIMIT 10; -- 7
SELECT title FROM film ORDER BY length LIMIT 10; -- 8
Select * FROM film
	WHERE special_features = 'Deleted Scenes'; -- 9
Select last_name, COUNT(*) AS amount FROM actor 
	GROUP BY last_name HAVING amount = 1
	; -- 10
Select last_name, COUNT(*) AS amount FROM actor 
	GROUP BY last_name HAVING amount > 1
	;  -- 11
SELECT actor_id, first_name, last_name, count(actor_id) as film_count
	FROM actor JOIN film_actor USING (actor_id)
	group by actor_id
	order by film_count desc
	limit 1; -- 12
Select * FROM rental
; -- 13

SELECT * FROM film JOIN inventory ON film.film_id = inventory.film_id WHERE store_id = 1 AND film.film_id = (
SELECT film_id FROM film WHERE title = "Academy Dinosaur"
); -- 14 

SELECT * FROM inventory JOIN rental ON inventory.inventory_id = rental.inventory_id WHERE inventory.film_id = (
SELECT film_id FROM film WHERE title = "Academy Dinosaur"
); -- 15

SELECT AVG(film.length) from film;  -- 16 

SELECT category.name, AVG(length)
FROM film f JOIN film_category USING (film_id) JOIN category USING (category_id)
GROUP BY category.name
HAVING avg(length) > (select avg(length) from film)
ORDER BY avg(length) desc; -- 17

SELECT COUNT(film_id), store_id FROM inventory
WHERE film_id=(SELECT film_id FROM film WHERE title='Bucket Brotherhood')
GROUP BY store_id; -- 24