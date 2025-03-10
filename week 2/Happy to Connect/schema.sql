CREATE TABLE "users" (
    "id" INTEGER,
    "username" TEXT NOT NULL UNIQUE,
    "first_name" TEXT,
    "last_name" TEXT,
    "password" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

CREATE TABLE "friends" (
    "user_one_id" INTEGER,
    "user_two_id" INTEGER,
    FOREIGN KEY("user_one_id") REFERENCES "users"("id"),
    FOREIGN KEY("user_two_id") REFERENCES "users"("id")
);

CREATE TABLE "schools_universities" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT,
    "location" TEXT,
    "year_founded" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "learning" (
    "user_id" INTEGER,
    "school_university_id" INTEGER,
    "start_date" TEXT NOT NULL,
    "end_date" TEXT,
    "type_degree" TEXT,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_university_id") REFERENCES "schools_universities"("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "workers" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" TEXT NOT NULL,
    "end_date" TEXT,
    "job_title" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
