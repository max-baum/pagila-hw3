/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */


SELECT DISTINCT A2.first_name || ' ' || A2.last_name AS "Actor Name"
FROM film_actor FA1
JOIN actor A1 ON FA1.actor_id=A1.actor_id
JOIN film_actor FA2 ON FA1.film_id=FA2.film_id
JOIN actor A2 ON FA2.actor_id=A2.actor_id
WHERE A1.first_name='RUSSELL' AND A1.last_name='BACALL' AND NOT (A2.first_name='RUSSELL' AND A2.last_name='BACALL')
ORDER BY "Actor Name";
