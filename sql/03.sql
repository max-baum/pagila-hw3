/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT Co.country, SUM(amount) as total_payments
FROM payment P, customer Cu, address A, city Ci, country Co
WHERE P.customer_id=Cu.customer_id AND Cu.address_id=A.address_id AND A.city_id=Ci.city_id AND Ci.country_id=Co.country_id
GROUP BY Co.country
ORDER BY total_payments DESC, Co.country;
