SELECT "first_name", "last_name", "birth_year" AS "Birth Year", "birth_country" AS "Country" FROM "players"
WHERE "birth_country" != 'USA' AND "birth_year" LIKE '2%'
ORDER BY "birth_year" DESC, "first_name" ASC, "last_name" ASC;
