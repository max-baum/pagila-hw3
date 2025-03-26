/*
 * Find every documentary film that is rated G.
 * Report the title and the actors.
 *
 * HINT:
 * Getting the formatting right on this query can be tricky.
 * You are welcome to try to manually get the correct formatting.
 * But there is also a view in the database that contains the correct formatting,
 * and you can SELECT from that VIEW instead of constructing the entire query manually.
 */

SELECT title, REGEXP_REPLACE(INITCAP(lower(actors)), '(\w)\s+(\w)', '\1\2', 'g') as actors
FROM film_list
WHERE category='Documentary' AND rating='G';
