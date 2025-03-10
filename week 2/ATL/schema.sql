CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "checkins"(
    "passenger_id" INTEGER NOT NULL,
    "datetime_check" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER NOT NULL,
    FOREIGN KEY("flight_id") REFERENCES "flights"("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "number_flight" TEXT NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "code_airport_from" TEXT NOT NULL,
    "code_airport_to" TEXT NOT NULL,
    "datetime_departure" NUMERIC NOT NULL,
    "datetime_arrival" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
