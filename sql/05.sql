/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT F2.title
FROM film_actor FA
JOIN film F ON F.film_id = FA.film_id
JOIN film_actor FA2 ON FA.actor_id = FA2.actor_id
JOIN film F2 ON F2.film_id = FA2.film_id
WHERE F.title = 'AMERICAN CIRCUS'
ORDER BY F2.title;
