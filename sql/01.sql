/*
 * Compute the number of customers who live outside of the US.
 *
 * NOTE:
 * It is possible to solve this problem with the "cheesy" query
 * ```
 * SELECT 563 AS count;
 * ```
 * Although this type of query will pass the test case for your homework,
 * it will not score you any points on your midterm/final exams.
 * I therefore strongly recommend that you solve this query "properly".
 *
 * Your goal should be to have your queries remain correct even if the data in the database changes arbitrarily.
 */


SELECT COUNT(DISTINCT customer_id) as count
FROM customer Cu, address A, city Ci, country Co
WHERE Cu.address_id=A.address_id AND A.city_id=Ci.city_id AND Ci.country_id=Co.country_id AND NOT Co.country='United States';
