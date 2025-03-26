/*
 * Compute the country with the most customers in it. 
 */

SELECT country
FROM (
    SELECT Co.country, COUNT(DISTINCT customer_id) as count
    FROM customer Cu, address A, city Ci, country Co
    WHERE Cu.address_id=A.address_id AND A.city_id=Ci.city_id AND Ci.country_id=Co.country_id
    GROUP BY Co.country
    ORDER BY count DESC) AS sq
LIMIT 1;
