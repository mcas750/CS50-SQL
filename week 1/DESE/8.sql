SELECT "districts"."name" AS "District name", "expenditures"."pupils" AS "Count" FROM "expenditures"
JOIN "districts" ON "districts"."id" = "expenditures"."district_id";
