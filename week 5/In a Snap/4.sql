SELECT "username" FROM "users"
JOIN (
    SELECT "to_user_id", COUNT("to_user_id") AS "received"
    FROM "messages"
    GROUP BY "to_user_id"
) AS "popular_user"
ON "users"."id" = "popular_user"."to_user_id"
ORDER BY "received" DESC, "username" ASC
LIMIT 1;
