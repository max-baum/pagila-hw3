/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */


SELECT title
FROM (SELECT F2.title, COUNT(FA2.actor_id) as count_actors
    FROM film_actor FA
    JOIN film F ON F.film_id = FA.film_id
    JOIN film_actor FA2 ON FA.actor_id = FA2.actor_id
    JOIN film F2 ON F2.film_id = FA2.film_id
    WHERE F.title = 'AMERICAN CIRCUS'
    GROUP BY F2.title
    HAVING COUNT(FA2.actor_id) >= 2
) AS sq
ORDER BY title;
