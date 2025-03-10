SELECT "districts"."name", "schools"."name", "staff_evaluations"."exemplary", "staff_evaluations"."proficient" FROM "districts"
JOIN "schools" ON "schools"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE "schools"."id" IN (SELECT "school_id" FROM "graduation_rates" WHERE "graduated" = 100);
-- proficient best when exemplary
