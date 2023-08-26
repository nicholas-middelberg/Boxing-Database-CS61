-- insert missing countries from fighters_all into country table
INSERT INTO country (country_name)
SELECT a.country FROM country c RIGHT JOIN
(SELECT country
FROM fighters_all
GROUP BY country
ORDER BY country) a
ON a.country = c. country_name
WHERE c.country_name IS NULL;