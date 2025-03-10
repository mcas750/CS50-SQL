SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN (
    SELECT "performances"."player_id" FROM "performances"
    JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
    WHERE "salaries"."year" = 2001 AND "performances"."RBI" > 0
    ORDER BY ("salaries"."salary" / "performances"."RBI")
    LIMIT 10
) AND "id" IN (
    SELECT "performances"."player_id" FROM "performances"
    JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
    WHERE "salaries"."year" = 2001 AND "performances"."H" > 0
    ORDER BY ("salaries"."salary" / "performances"."H")
    LIMIT 10
)
ORDER BY "last_name";
