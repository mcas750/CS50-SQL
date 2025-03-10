SELECT "english_title", "artist", "contrast" AS "Contrast Value" FROM "views"
WHERE "contrast" >= 0.5
ORDER BY "english_title" ASC;
