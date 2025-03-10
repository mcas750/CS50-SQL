SELECT "city", COUNT("city") AS "Count schools in city" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING COUNT("city") <= 3
ORDER BY COUNT("city") DESC, "city" ASC;
