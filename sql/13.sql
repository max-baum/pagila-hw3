/*
 * Management wants to create a "best sellers" list for each actor.
 *
 * Write a SQL query that:
 * For each actor, reports the three films that the actor starred in that have brought in the most revenue for the company.
 * (The revenue is the sum of all payments associated with that film.)
 *
 * HINT:
 * For correct output, you will have to rank the films for each actor.
 * My solution uses the `rank` window function.
 */

/** SELECT fa.actor_id, a.first_name, a.last_name, r.film_id, r.title, rank, amt as revenue
FROM (SELECT DISTINCT actor_id FROM film_actor fa) as fa
JOIN LATERAL (
    SELECT fa1.film_id, f.title, ROW_NUMBER() OVER (ORDER BY SUM(p.amount) DESC) AS rank, SUM(p.amount) as amt 
    FROM film_actor fa1
    JOIN film f ON fa1.film_id=f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental ren ON i.inventory_id = ren.inventory_id
    JOIN payment p ON ren.rental_id = p.rental_id
    WHERE fa.actor_id = fa1.actor_id
    GROUP BY fa1.film_id, f.title
    ORDER BY amt DESC
    LIMIT 3
) r ON TRUE
JOIN actor a ON fa.actor_id=a.actor_id
ORDER BY fa.actor_id; **/

WITH ranked_films AS (
    SELECT 
        fa.actor_id, 
        f.film_id, 
        f.title, 
        SUM(p.amount) AS revenue,
        ROW_NUMBER() OVER (PARTITION BY fa.actor_id ORDER BY SUM(p.amount) DESC) AS rank
    FROM film_actor fa
    JOIN film f ON fa.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN payment p ON r.rental_id = p.rental_id
    GROUP BY fa.actor_id, f.film_id, f.title
)
SELECT 
    rf.actor_id, 
    a.first_name, 
    a.last_name, 
    rf.film_id, 
    rf.title, 
    rf.rank, 
    rf.revenue
FROM ranked_films rf
JOIN actor a ON rf.actor_id = a.actor_id
WHERE rf.rank <= 3
ORDER BY rf.actor_id, rf.rank;
