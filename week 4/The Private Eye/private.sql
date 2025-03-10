--create CSV
--download csv in table
--create view with join table from csv
CREATE TABLE "position" (
    "id" INTEGER,
    "pos" INTEGER,
    "length" INTEGER
);

--.import --csv position.csv position
INSERT INTO "position" ("id", "pos", "length")
VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);


CREATE VIEW "message" AS
SELECT substr("sentence", "pos", "length") AS "phrase" FROM "sentences"
JOIN "position" ON "position"."id" = "sentences"."id";
