/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMAN,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */



SELECT title
FROM (SELECT F2.title, COUNT(FA2.actor_id) as count_actors
    FROM film_actor FA
    JOIN film F ON F.film_id = FA.film_id
    JOIN film_actor FA2 ON FA.actor_id = FA2.actor_id
    JOIN film F2 ON F2.film_id = FA2.film_id
    WHERE F.title = 'AMERICAN CIRCUS' OR F.title = 'ACADEMY DINOSAUR' OR F.title = 'AGENT TRUMAN'
    GROUP BY F2.title
    HAVING COUNT(FA2.actor_id) >= 3
) AS sq
ORDER BY title;

