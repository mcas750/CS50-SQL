-- Represent insurance policies information

PRAGMA foreign_key = ON;

CREATE TABLE "policies" (
    "id" INTEGER,
    "serial" TEXT NOT NULL,
    "number" TEXT NOT NULL UNIQUE,
    "price" NUMERIC NOT NULL,
    "contract_date" NUMERIC NOT NULL,
    "start_policy_date" TEXT NOT NULL,
    "end_policy_date" TEXT NOT NULL,
    "trailer" INTEGER DEFAULT 0 NOT NULL CHECK("trailer" BETWEEN 0 AND 1),
    "drivers" INTEGER DEFAULT 0 NOT NULL CHECK("drivers" BETWEEN 0 AND 1),
    "prolongation" TEXT,
    "insurant_i_id" INTEGER,
    "insurant_j_id" INTEGER,
    "car_id" INTEGER,
    "employee_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("insurant_i_id") REFERENCES "individuals"("id"),
    FOREIGN KEY("insurant_j_id") REFERENCES "juridicas"("id"),
    FOREIGN KEY("car_id") REFERENCES "cars"("id"),
    FOREIGN KEY("employee_id") REFERENCES "employees"("id")

);

-- Represent cars in the policies

CREATE TABLE "cars" (
    "id" INTEGER,
    "brand" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "vin" TEXT,
    "chassis" TEXT,
    "body" TEXT,
    "registration_number" TEXT,
    "sts" INTEGER NOT NULL UNIQUE,
    "pts" TEXT NOT NULL,
    "category" TEXT NOT NULL CHECK("category" IN ('A', 'B', 'C', 'D', 'E')),
    "state" TEXT NOT NULL,
    "power" NUMERIC NOT NULL,
    "actual" INTEGER DEFAULT 0 NOT NULL CHECK("actual" BETWEEN 0 AND 1),
    PRIMARY KEY("id")
);

-- Represent car crash information

CREATE TABLE "car_crash" (
    "id" INTEGER,
    "number" INTEGER NOT NULL,
    "date" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "type" TEXT NOT NULL CHECK("type" IN ('rollovers', 'head-on collision', 'rear-end collision', 'side-impact accident')),
    "description" TEXT,
    "code" TEXT NOT NULL,
    "role" TEXT NOT NULL CHECK("role" IN ('victim', 'culprit')),
    "car_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("car_id") REFERENCES "cars"("id")
);

-- Represent insurance payments

CREATE TABLE "insurance_payments" (
    "id" INTEGER,
    "car_crash_id" INTEGER NOT NULL,
    "policy_id" INTEGER NOT NULL,
    "date" TEXT NOT NULL,
    "price" NUMERIC NOT NULL,
    "have_paid" INTEGER DEFAULT 0 NOT NULL CHECK("have_paid" BETWEEN 0 AND 1),
    PRIMARY KEY("id"),
    FOREIGN KEY("car_crash_id") REFERENCES "car_crash"("id"),
    FOREIGN KEY("policy_id") REFERENCES "policies"("id")
);

-- Represent employees

CREATE TABLE "employees" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "phone" TEXT NOT NULL UNIQUE CHECK("phone" GLOB '*[0-9]*'),
    "email" TEXT NOT NULL UNIQUE CHECK("email" LIKE '%@%'),
    PRIMARY KEY("id")
);

-- Represent juridicas

CREATE TABLE "juridicas" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "inn" INTEGER NOT NULL UNIQUE,
    "phone" TEXT NOT NULL UNIQUE CHECK("phone" GLOB '*[0-9]*'),
    "email" TEXT NOT NULL UNIQUE CHECK("email" LIKE '%@%'),
    "street" TEXT,
    "city" TEXT,
    "state" TEXT,
    PRIMARY KEY("id")
);

-- Represent individuals

CREATE TABLE "individuals" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "passport" INTEGER NOT NULL UNIQUE,
    "phone" TEXT NOT NULL UNIQUE CHECK("phone" GLOB '*[0-9]*'),
    "email" TEXT NOT NULL UNIQUE CHECK("email" LIKE '%@%'),
    "street" TEXT,
    "city" TEXT,
    "state" TEXT,
    PRIMARY KEY("id")
);

-- Represent owners

CREATE TABLE "owners" (
    "policy_id" INTEGER NOT NULL,
    "owner_i_id" INTEGER,
    "owner_j_id" INTEGER,
    FOREIGN KEY("policy_id") REFERENCES "policies"("id"),
    FOREIGN KEY("owner_i_id") REFERENCES "individuals"("id"),
    FOREIGN KEY("owner_j_id") REFERENCES "juridicas"("id")
);

-- Represent drivers

CREATE TABLE "drivers"(
    "id" INTEGER,
    "individual_id" INTEGER,
    "vu_serial" TEXT NOT NULL,
    "vu_number" TEXT NOT NULL UNIQUE,
    "kbm" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("individual_id") REFERENCES "individuals"("id")
);

-- Represent driver on policy

CREATE TABLE "drivers_policy"(
    "policy_id" INTEGER,
    "driver_id" INTEGER,
    FOREIGN KEY("policy_id") REFERENCES "policies"("id"),
    FOREIGN KEY("driver_id") REFERENCES "drivers"("id")
);

--average insurance premium by car brand
CREATE VIEW "average_cost_car_insurance" AS
SELECT "cars"."brand", AVG("policies"."price") AS "Cost insurance" FROM "policies"
JOIN "cars" ON "cars"."id" = "policies"."car_id"
GROUP BY "cars"."brand";

--contacts a legal entity client
CREATE VIEW "contacts_juridicas" AS
SELECT CONCAT("policies"."serial", ' ', "policies"."number") AS 'Policies', "cars"."brand", "cars"."model", "juridicas"."name", "juridicas"."phone" FROM "policies"
LEFT JOIN "owners" ON "owners"."policy_id" = "policies"."id"
JOIN "cars" ON "cars"."id" = "policies"."car_id"
JOIN "juridicas" ON "juridicas"."id" = "owners"."owner_j_id"
WHERE "owners"."owner_j_id" IS NOT NULL AND "policies"."start_policy_date" LIKE '2024%';

--unpaid insurance compensation to a legal entity client
CREATE VIEW "unpaid_compensation" AS
SELECT "car_crash"."number" AS "Car crash number", "juridicas"."name", "juridicas"."phone", CONCAT("employees"."first_name", ' ', "employees"."last_name") AS 'Employee'
FROM "insurance_payments"
JOIN "policies" ON "policies"."id" = "insurance_payments"."policy_id"
JOIN "car_crash" ON "car_crash"."id" = "insurance_payments"."car_crash_id"
JOIN "juridicas" ON "juridicas"."id" = "policies"."insurant_j_id"
JOIN "employees" ON "employees"."id" = "policies"."employee_id"
WHERE "have_paid" = 0 AND "policies"."insurant_i_id" IS NULL;

--employees who issued policies
CREATE VIEW "total_sum_employee" AS
SELECT SUM("policies"."price") AS "total sum", CONCAT("employees"."first_name", ' ', "employees"."last_name") AS "Employee"
FROM "policies"
JOIN "employees" ON "employees"."id" = "policies"."employee_id"
GROUP BY "policies"."employee_id"
HAVING "total sum" > 80000;

CREATE INDEX "brand_model_car" ON "cars"("barnd", "model");
CREATE INDEX "serial_number_policies" ON "policies"("serial", "number");
CREATE INDEX "number_juridicas" ON "juridicas"("inn");
CREATE INDEX "car_crash_number" ON "car_crash"("number");
CREATE INDEX "individuals_name" ON "individuals"("first_name", "last_name");
CREATE INDEX "kbm_info" ON "drivers"("vu_serial", "vu_number");

--check if there  is a policy or not
CREATE TRIGGER check_policy
BEFORE INSERT ON "drivers_policy"
FOR EACH ROW
WHEN NEW.policy_id NOT IN (SELECT "id" FROM "policies")
BEGIN
    SELECT RAISE(ABORT, 'The policy does not exist');
END;
--check if there  is a policy or not
CREATE TRIGGER check_owner
BEFORE INSERT ON "owners"
FOR EACH ROW
WHEN NEW.policy_id NOT IN (SELECT "id" FROM "policies")
BEGIN
    SELECT RAISE(ABORT, 'The owner does not exist');
END;

--after add new policy in "policies" table, adding id policy in "drivers_policy" table
CREATE TRIGGER "insert_new_policy"
AFTER INSERT ON "policies"
BEGIN
    INSERT INTO "drivers_policy"("policy_id")
    VALUES (NEW.id);
END
