SELECT "title", "topic", "air_date" FROM "episodes"
WHERE ("air_date" LIKE '2018%' OR "air_date" LIKE '2022%') AND "topic" IS NOT NULL;
