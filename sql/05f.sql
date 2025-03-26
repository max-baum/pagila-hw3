/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */


SELECT F2.title
FROM film_category FC1
JOIN film F1 on FC1.film_id=F1.film_id
JOIN film_category FC2 ON FC1.category_id=FC2.category_id
JOIN film F2 ON FC2.film_id=F2.film_id
WHERE F1.title = 'AMERICAN CIRCUS'
GROUP BY F2.title
HAVING COUNT(FC2.category_id) >= 2
INTERSECT
SELECT title
FROM (SELECT F2.title, COUNT(FA2.actor_id) as count_actors
    FROM film_actor FA
    JOIN film F ON F.film_id = FA.film_id
    JOIN film_actor FA2 ON FA.actor_id = FA2.actor_id
    JOIN film F2 ON F2.film_id = FA2.film_id
    WHERE F.title = 'AMERICAN CIRCUS'
    GROUP BY F2.title
    HAVING COUNT(FA2.actor_id) >= 1
) AS sq
ORDER BY title;

