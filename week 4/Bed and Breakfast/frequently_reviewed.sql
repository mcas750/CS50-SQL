CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id" AS "id", "listings"."property_type" AS "property_type", "listings"."host_name" AS "host_name", COUNT("reviews"."id") AS "reviews" FROM "listings"
JOIN "reviews" ON "reviews"."listing_id" = "listings"."id"
GROUP BY "listings"."id"
ORDER BY COUNT("reviews"."id") DESC, "property_type" ASC, "host_name" ASC
LIMIT 100;
