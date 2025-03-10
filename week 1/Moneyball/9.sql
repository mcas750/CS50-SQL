SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS "Average salary" FROM "salaries"
JOIN "teams" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
GROUP BY "team_id"
ORDER BY "Average salary"
LIMIT 5;
