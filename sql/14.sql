/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */



SELECT c1.name, r.title, r."total rentals"
FROM category c1
JOIN LATERAL (
    SELECT f.title, count(i.film_id) as "total rentals"
    FROM inventory i
    JOIN rental ren ON i.inventory_id = ren.inventory_id
    JOIN film_category fc1 ON i.film_id=fc1.film_id
    JOIN category cat ON fc1.category_id=cat.category_id
    JOIN film f ON i.film_id=f.film_id
    WHERE cat.name = c1.name
    GROUP BY f.title
    ORDER BY "total rentals" DESC, title DESC
    LIMIT 5
) r ON TRUE
ORDER BY c1.name ASC, r."total rentals" DESC, r.title ASC
