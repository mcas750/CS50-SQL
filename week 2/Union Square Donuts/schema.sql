CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type_unit" TEXT NOT NULL CHECK("type_unit" IN ('pounds','grams')),
    "price_unit" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "is_gluten_free" BOOLEAN NOT NULL,
    "price_donut" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "composition_donuts" (
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "composition_orders" (
    "order_id" INTEGER UNIQUE,
    "donut_id" INTEGER NOT NULL,
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "customer_id" INTEGER NOT NULL,
    "date_order" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "type_order" TEXT NOT NULL CHECK("type_order" IN ('online', 'store')),
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);
