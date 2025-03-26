/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */

SELECT A.first_name, A.last_name
FROM actor A
JOIN film_actor FA ON A.actor_id = FA.actor_id
JOIN film_category FC ON FA.film_id = FC.film_id
JOIN category C ON FC.category_id = C.category_id
GROUP BY A.actor_id, A.first_name, A.last_name
HAVING 
    COUNT(CASE WHEN C.name = 'Children' THEN 1 END) > 0
    AND COUNT(CASE WHEN C.name = 'Horror' THEN 1 END) = 0
ORDER BY A.last_name, A.first_name;
