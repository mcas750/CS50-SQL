SELECT "districts"."name" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
ORDER BY "expenditures"."pupils" ASC LIMIT 1;
