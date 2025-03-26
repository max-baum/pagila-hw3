/* 
 * In the previous query, the actors could come from any combination of movies.
 * Unfortunately, you've found that if the actors all come from only 1 or 2 of the movies,
 * then there is not enough diversity in the acting talent.
 *
 * Write a SQL query that lists all of the movies where:
 * at least 1 actor was also in AMERICAN CIRCUS,
 * at least 1 actor was also in ACADEMY DINOSAUR,
 * and at least 1 actor was also in AGENT TRUMAN.
 *
 * HINT:
 * There are many ways to solve this problem,
 * but I personally found the INTERSECT operator to make a convenient solution.
 */

SELECT title 
FROM film
WHERE film_id IN (
SELECT FA4.film_id FROM film_actor FA1, film F1, film_actor FA4 WHERE FA1.film_id=F1.film_id AND F1.title='AMERICAN CIRCUS' AND FA4.actor_id=FA1.actor_id
INTERSECT 
SELECT FA5.film_id FROM film_actor FA2, film F2, film_actor FA5 WHERE FA2.film_id=F2.film_id AND F2.title='ACADEMY DINOSAUR' AND FA5.actor_id=FA2.actor_id
INTERSECT
SELECT FA6.film_id FROM film_actor FA3, film F3, FILM_actor FA6 WHERE FA3.film_id=F3.film_id AND F3.title='AGENT TRUMAN' AND FA6.actor_id=FA3.actor_id
)
ORDER BY title;
