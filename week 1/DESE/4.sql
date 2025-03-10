SELECT "city", COUNT("city") AS "Count schools in city" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY COUNT("city") DESC, "city" ASC
LIMIT 10;
