
-- *** The Lost Letter ***
--find data about address arrival
SELECT "address", "type" FROM "addresses" WHERE "id" = (
    --find ID address arrival on from_address_id and "type" or "contents" letter from packages table
    SELECT "to_address_id" FROM "packages" WHERE "contents" LIKE '%congratulatory%' AND "from_address_id" = (
        --find ID address derival
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
    )
);

-- *** The Devious Delivery ***
--display data about content and type delivery address
-- using table "scans" as "main" table because there is connecting data there
SELECT "addresses"."type" AS "Address type", "packages"."contents" AS "Contents" FROM "scans"
--using LEFT JOIN to get address
LEFT JOIN "addresses" ON "addresses"."id" = "scans"."address_id"
--using RIGHT JOIN to get contents package
RIGHT JOIN "packages" ON "packages"."id" = "scans"."package_id"
--we know that the parcel is lost therefore using "Drop" and not arrival address therefore using IS NULL
WHERE "scans"."action" = 'Drop' AND "scans"."package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
);

-- *** The Forgotten Gift ***
-- display data about content and name who has the forgotten gift
-- using table "scans" as "main" table because there is connecting data there
SELECT "packages"."contents" AS "Content", "drivers"."name" AS "Who has the Forgotton Gift" FROM "scans"
--using LEFT JOIN to get contents package
LEFT JOIN "packages" ON "packages"."id" = "scans"."package_id"
--using RIGHT JOIN to get name driver
RIGHT JOIN "drivers" ON "drivers"."id" = "scans"."driver_id"
--we know derrival and arrival addresses therefore we find id package and other information from scans table
WHERE "scans"."package_id" = (
    SELECT "id" FROM "packages" WHERE "to_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
    ) AND "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    )
)
--get lost mark time on operation with package
ORDER BY "timestamp" DESC LIMIT 1;
