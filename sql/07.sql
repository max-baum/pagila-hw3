/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */


SELECT DISTINCT A1.first_name || ' ' || A1.last_name as "Actor Name"
FROM film_actor FA3
JOIN film_actor FA4 ON FA3.film_id=FA4.film_id
JOIN actor A1 on FA4.actor_id=A1.actor_id
WHERE FA3.actor_id IN
(SELECT DISTINCT FA2.actor_id
FROM film_actor FA1
JOIN film_actor FA2 on FA1.film_id=FA2.film_id
WHERE FA1.actor_id = (SELECT actor_id FROM actor A WHERE first_name='RUSSELL' AND last_name='BACALL')) AND NOT
FA4.actor_id IN 
(SELECT DISTINCT FA2.actor_id
FROM film_actor FA1
JOIN film_actor FA2 on FA1.film_id=FA2.film_id
WHERE FA1.actor_id = (SELECT actor_id FROM actor A WHERE first_name='RUSSELL' AND last_name='BACALL'))
ORDER BY "Actor Name";
