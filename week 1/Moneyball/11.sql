--SELECT * FROM "performances" LIMIT 10;
SELECT "players"."first_name", "players"."last_name", ("salaries"."salary" / "performances"."H") AS "dollars per hit" FROM "performances"
JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
JOIN "players" ON "players"."id" = "performances"."player_id"
WHERE "salaries"."year" = 2001 AND "performances"."H" > 0
ORDER BY "dollars per hit", "players"."first_name", "players"."last_name"
LIMIT 10;
