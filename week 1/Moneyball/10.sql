SELECT "players"."first_name" AS "first_name", "players"."last_name" AS "last_name", "salaries"."salary" AS "salary", "performances"."year" AS "year", "performances"."HR" AS "HR" FROM "performances"
JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
JOIN "players" ON "players"."id" = "performances"."player_id"
ORDER BY "players"."id", "performances"."year" DESC, "performances"."HR" DESC, "salaries"."salary" DESC;
