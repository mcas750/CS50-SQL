--addition data


--Add a new employees
INSERT INTO "employees"("first_name", "last_name", "city", "phone", "email")
VALUES
("James", "Smith", "Cincinnati", "8967273325", "JamesSmith@mail.com"),
("Mary", "Johnson", "Cincinnati", "8948920920", "MaryJohnson@mail.com"),
("Michael", "Williams", "Chicago", "8943988996", "MichaelWilliams@mail.com"),
("Patricia", "Brown", "Chicago", "8936157420", "PatriciaBrown@mail.com"),
("Robert", "Miller", "Seattle", "8978116504", "RobertMiller@mail.com");


--Add a new juridicas
INSERT INTO "juridicas"("name", "inn", "phone", "email", "street", "city", "state")
VALUES
("Belo Corp", "15490115", "8913527762", "Belo@mail.com", "313 Sycamore St", "Cincinnati", "OH"),
("Cardinal Health Inc", "37344327", "8986453697", "CardinalHealth@mail.com", "1806 Freeman Ave", "Cincinnati", "OH"),
("DTE Energy Co", "29768604", "8993715179", "DTEEnergy@mail.com", "435 E Court St", "Cincinnati", "OH"),
("VCD Energy Co", "29342378", "8996516734", "VCDEnergy@mail.com", "412 E Court St", "Cincinnati", "OH");


--Add a new individuals
INSERT INTO "individuals"("first_name", "last_name", "passport", "phone", "email", "street", "city", "state")
VALUES
("Matthew", "Wilson", "62064245", "84516681177", "MatthewWilson@mail.com", "2119 S Homan Ave", "Chicago", "IL"),
("Sandra", "Anderson", "70858510", "73238462590", "SandraAnderson@mail.com", "9234 S Merrill Ave", "Chicago", "IL"),
("Anthony", "Moore", "49483234", "77536667198", "AnthonyMoore@mail.com", "4946 N Sayre Ave", "Chicago", "IL"),
("Betty", "Lee", "73087051", "79241506693", "BettyLee@mail.com", "3725 E Prospect St", "Seattle", "WA"),
("Mark", "Harris", "60734489", "23499296476", "MarkHarris@mail.com", "2418 8th Ave W", "Seattle", "WA"),
("Margaret", "Wilson", "62089212", "84346654375", "MargaretWilson@mail.com", "2119 S Homan Ave", "Chicago", "IL"),
("Betty", "Harris", "60436734", "23499295556", "BettyHarris@mail.com", "2418 8th Ave W", "Seattle", "WA"),
("Brian", "Allen", "44809408", "17519755841", "BrianAllen@mail.com", "1422 Walnut St", "Cincinnati", "OH"),
("Melissa", "Wright", "95210624", "52801199320", "MelissaWright@mail.com", "539 Milton St", "Cincinnati", "OH"),
("Timothy", "Scott", "10042985", "20201979404", "TimothyScott@mail.com", "287 Bodmann Ave", "Cincinnati", "OH"),
("Deborah", "Rivera", "55066229", "52275680859", "DeborahRivera@mail.com", "163 Kinsey Ave", "Cincinnati", "OH");


--Add a information about cars
INSERT INTO "cars"("brand", "model", "vin", "chassis", "body", "registration_number", "sts", "pts", "category", "state", "power", "actual")
VALUES
("Volkswagen", "Golf", "KF9T6NIH381KETV8R", null, null, "189FAT", "1774800108", "JW10630389", "B", "WA", "150", "1"),
("Skoda", "Rapid", "N09S5EMTVDQQY7JZA", null, null, "WWA502", "6215860118", "KR42609291", "B", "WA", "100", "1"),
("Mercedes-Benz", "E-class", "4REIYFJCX956803AT", null, null, "323VIY", "6334801941", "NS83181574", "B", "IL", "200", "1"),
("Mitsubishi", "Outlander", null, "IQTTW58XGVGJIK0NJ", null, "038KAX", "7744272055", "BE93021852", "B", "IL", "170", "1"),
("BMW", "X6", null, "CYMD0V9HD4E5G2ZPE", null, "IXE511", "1946782616", "EH29986753", "B", "IL", "340", "1"),
("Hyundai", "Santa Fe", null, null, "63CIS69QI4YKJI51Z", "TXY278", "1270905080", "YJ22867025", "B", "OH", "190", "1"),
("Porsche", "Cayenne", null, null, "T55FL8PLZSG81CR2M", "208LNE", "7041846109", "VQ43044602", "B", "OH", "400", "1"),
("Lexus", "RX", "7J2JERKAJ6ISBDW22", null, null, "ANW569", "4851554183", "QN45438515", "B", "OH", "250", "1");


--Add a information about policies
INSERT INTO "policies"("serial", "number", "price", "contract_date", "start_policy_date", "end_policy_date", "trailer", "drivers", "prolongation", "insurant_i_id", "insurant_j_id", "car_id", "employee_id")
VALUES
("NM","408256","29859","2025-01-10","2025-01-13","2026-01-12",0,0,null,2,null,5,4),
("NM","98412","14880.5","2024-09-13","2024-09-13","2025-09-12",0,0,null,1,null,4,4),
("NM","171217","75618.56","2025-02-01","2025-02-02","2026-02-02",0,0,null,3,null,3,3),
("NM","646058","40255.2","2025-01-15","2025-01-15","2026-01-14",1,0,null,4,null,2,5),
("YY","96336","33177","2024-12-23","2024-12-25","2025-12-24",0,1,"IU435634",null,3,6,2),
("OS","719445","39581.34","2023-05-05","2023-05-10","2024-05-09",0,0,null,5,null,1,5),
("OS","120022","20994","2024-10-10","2024-10-11","2025-10-10",0,1,null,null,2,7,2),
("KW","783755","22544.89","2024-11-21","2024-11-23","2025-11-22",1,1,null,null,1,8,1),
("IU","435634","35177","2023-12-23","2023-12-25","2024-12-24",0,1,null,null,3,6,2),
("OS","657294","43281.34","2022-05-05","2022-05-10","2023-05-09",0,0,"OS719445",5,null,1,5);


--Add a information about car crash
INSERT INTO "car_crash"("number", "date", "state", "city", "type", "description", "code", "role", "car_id")
VALUES
(544216714526388, "2024-08-12", "OH", "Toledo", "rollovers", "culprit running a red light", "102,112,122,132", "victim", 6),
(538631706195278, "2024-12-05", "OH", "Cincinnati", "head-on collision", "did not give way", "222,212", "victim", 8),
(789233953590770, "2023-11-30", "WA", "Seattle", "rear-end collision", "", "242", "culprit", 1),
(757765038645036, "2025-01-23", "IL", "Chicago", "side-impact accident", "", "191,221,101", "victim", 4);

--Update description car crash
UPDATE "car_crash"
SET "description" = 'did not give way'
WHERE "number" = 789233953590770;


--Add a information about insurance payments
INSERT INTO "insurance_payments"("car_crash_id", "policy_id", "date", "price", "have_paid")
VALUES
("1", "5", "2024-09-22", "90670.4", 1),
("2", "8", "2025-01-25", "112980", 0),
("3", "6", "2024-02-03", "3456.6", 1),
("4", "2", "2025-02-13", "150789", 0);

--Update payment status
UPDATE "insurance_payments"
SET "have_paid" = 1
WHERE "policy_id" = 2;


--Add a information about owners car
INSERT INTO "owners"("policy_id", "owner_i_id", "owner_j_id")
VALUES
("1", "2", null),
("2", "1", null),
("2", "6", null),
("3", "3", null),
("4", "4", null),
("5", null, "3"),
("5", null, "4"),
("6", "5", null),
("6", "7", null),
("7", null, "2"),
("8", null, "1"),
("9", null, "3");


--Add a information about drivers
INSERT INTO "drivers"("individual_id", "vu_serial", "vu_number", "kbm")
VALUES
("1", "QZT", "12776", "0.5"),
("2", "VAF", "23172", "0.5"),
("3", "VAF", "39497", "0.6"),
("4", "LHY", "21127", "1"),
("5", "VDM", "87801", "1"),
("7", "JTF", "57038", "1"),
("8", "RXG", "28972", "0.5"),
("9", "VIO", "57130", "0.5"),
("10", "VDM", "04425", "0.5"),
("11", "QWI", "78283", "0.5");


--Add a information about drivers allowed to drive the car
INSERT INTO "drivers_policy"("policy_id", "driver_id")
VALUES
("1", "2"),
("2", "1"),
("3", "3"),
("4", "4"),
("5", "8"),
("6", "5"),
("6", "7"),
("7", "9"),
("8", "10"),
("9", "8");

--who is not taking out insurance for the first time
SELECT "name", "phone", "email" FROM "juridicas"
WHERE "id" IN (
    SELECT "insurant_j_id" FROM "policies"
    WHERE "prolongation" NOT NULL
    GROUP BY "car_id" AND "insurant_j_id"
)
UNION
SELECT CONCAT("first_name",' ', "last_name"), "phone", "email" FROM "individuals"
WHERE "id" IN (
    SELECT "insurant_i_id" FROM "policies"
    WHERE "prolongation" NOT NULL
    GROUP BY "car_id" AND "insurant_i_id"
);

--get a list of those who were in an accident and drivers
SELECT CONCAT("cars"."brand", ' ', "cars"."model") AS "Cars", CONCAT("individuals"."first_name", ' ', "individuals"."last_name") AS "Driver" FROM "car_crash"
JOIN "policies" ON "policies"."car_id" = "car_crash"."car_id"
JOIN "drivers_policy" ON "drivers_policy"."policy_id" = "policies"."id"
JOIN "drivers" ON "drivers"."id" = "drivers_policy"."driver_id"
JOIN "cars" ON "cars"."id" = "car_crash"."car_id"
JOIN "individuals" ON "individuals"."id" = "drivers"."individual_id"
WHERE "policies"."prolongation" IS NULL;
--получить КБМ тех кто был в ДТП
SELECT CONCAT("individuals"."first_name", ' ', "individuals"."last_name") AS "Driver", "drivers"."kbm" FROM "cars"
JOIN "policies" ON "policies"."car_id" = "cars"."id"
JOIN "drivers_policy" ON "drivers_policy"."policy_id" = "policies"."id"
JOIN "drivers" ON "drivers"."id" = "drivers_policy"."driver_id"
JOIN "individuals" ON "individuals"."id" = "drivers"."individual_id"
WHERE "cars"."id" NOT IN (
    SELECT "car_id" FROM "car_crash"
);

--get the make and model and names of the owners, the insured, the amount of insurance and the amount of damage
SELECT
    CONCAT("cars"."brand", ' ', "cars"."model") AS "Car",
    "juridicas"."name" AS 'Owner',
    IIF("owners"."owner_j_id" = "policies"."insurant_j_id", "juridicas"."name", NULL) AS 'Insurant',
    "policies"."price" AS "Insurant price",
    "insurance_payments"."price" AS "Car crash price"
FROM "car_crash"
JOIN "policies" ON "policies"."car_id" = "car_crash"."car_id"
JOIN "owners" ON "owners"."policy_id" = "policies"."id"
JOIN "juridicas" ON "juridicas"."id" = "owners"."owner_j_id"
JOIN "insurance_payments" ON "insurance_payments"."car_crash_id" = "car_crash"."id"
JOIN "cars" ON "cars"."id" = "car_crash"."car_id"
JOIN "drivers_policy" ON "drivers_policy"."policy_id" = "policies"."id"
WHERE "car_crash"."date" BETWEEN "policies"."start_policy_date" AND "policies"."end_policy_date"
UNION
SELECT
    CONCAT("cars"."brand", ' ', "cars"."model") AS "Car",
    CONCAT("individuals"."first_name", ' ', "individuals"."last_name")  AS 'Owner',
    IIF("owners"."owner_i_id" = "policies"."insurant_i_id", CONCAT("individuals"."first_name", ' ', "individuals"."last_name"), NULL) AS 'Insurant',
    "policies"."price" AS "Insurant price",
    "insurance_payments"."price" AS "Car crash price"
FROM "car_crash"
JOIN "policies" ON "policies"."car_id" = "car_crash"."car_id"
JOIN "owners" ON "owners"."policy_id" = "policies"."id"
JOIN "individuals" ON "individuals"."id" = "owners"."owner_i_id"
JOIN "insurance_payments" ON "insurance_payments"."car_crash_id" = "car_crash"."id"
JOIN "cars" ON "cars"."id" = "car_crash"."car_id"
JOIN "drivers_policy" ON "drivers_policy"."policy_id" = "policies"."id"
WHERE "car_crash"."date" BETWEEN "policies"."start_policy_date" AND "policies"."end_policy_date";

--which state issued the most insurance by amount
SELECT SUM("policies"."price") AS 'Total price', CONCAT("employees"."first_name", ' ', "employees"."last_name") AS 'Employee', "employees"."city", "cars"."state" FROM "policies"
JOIN "employees" ON "employees"."id" = "policies"."employee_id"
JOIN "cars" ON "cars"."id" = "policies"."car_id"
GROUP BY "employee_id"
HAVING SUM("policies"."price") > 50000
ORDER BY SUM("price") DESC;

--good or bad drivers
SELECT CONCAT("individuals"."first_name", ' ', "individuals"."last_name") AS "Driver", "drivers"."vu_serial", "drivers"."vu_number", "drivers"."kbm",
CASE
    WHEN "kbm" <= 0.7 THEN 'Good driver'
END AS "good_driver",
CASE
    WHEN "kbm" >= 0.7 THEN 'Bad driver'
END AS "bad_driver"
FROM "drivers"
JOIN "individuals" ON "individuals"."id" = "drivers"."individual_id";

--average cost on state
WITH "average_on_state" AS (
    SELECT "cars"."state", COUNT("cars"."state") AS "Count", AVG("policies"."price") FROM "cars"
    JOIN "policies" ON "policies"."car_id" = "cars"."id"
    GROUP BY "cars"."state"
)
SELECT * FROM "average_on_state";
