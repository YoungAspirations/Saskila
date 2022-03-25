USE Sakila;
Select * FROM actor;
SELECT * FROM actor
	WHERE first_name ='John';
SELECT * FROM actor
	WHERE last_name ='Neeson';
SELECT * FROM actor
	WHERE actor_id%10 = 0;
Select * FROM film
	WHERE film_id = 100;
Select * FROM film
	WHERE rating = 'R';
Select * FROM film
	WHERE rating != 'R';
Select * FROM film
	WHERE rating = 'R';
SELECT * FROM film ORDER BY length LIMIT 10;
SELECT title FROM film ORDER BY length LIMIT 10;
Select * FROM film
	WHERE special_features = 'Deleted Scenes';
Select last_name, COUNT(*) AS amount FROM actor 
	GROUP BY last_name HAVING amount = 1
	;
Select last_name, COUNT(*) AS amount FROM actor 
	GROUP BY last_name HAVING amount > 1
	;
SELECT actor_id, first_name, last_name, count(actor_id) as film_count
	FROM actor JOIN film_actor USING (actor_id)
	group by actor_id
	order by film_count desc
	limit 1;
Select * FROM rental
;

SELECT * FROM film JOIN inventory ON film.film_id = inventory.film_id WHERE store_id = 1 AND film.film_id = (
SELECT film_id FROM film WHERE title = "Academy Dinosaur"
);

SELECT * FROM inventory JOIN rental ON inventory.inventory_id = rental.inventory_id WHERE inventory.film_id = (
SELECT film_id FROM film WHERE title = "Academy Dinosaur"
);

SELECT AVG(film.length) from film;

SELECT film.length, film_category.category_id  GROUP BY film_category.category_id, avg(length);
	