SELECT "players"."first_name", "players"."last_name", "salaries"."salary" FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
WHERE "salaries"."year" = 2001
ORDER BY "salary" ASC, "first_name" ASC, "last_name" ASC, "player_id" ASC
LIMIT 50;
