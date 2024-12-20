CREATE TABLE "campaigns" (
  "cf_id" int PRIMARY KEY,
  "contact_id" int,
  "company_name" varchar(255),
  "description" text,
  "goal" decimal(10,2),
  "pledged" decimal(10,2),
  "outcome" varchar(50),
  "backers_count" int,
  "country" char(2),
  "currency" char(3),
  "launch_date" timestamp,
  "end_date" timestamp,
  "staff_pick" boolean,
  "spotlight" boolean,
  "category_id" varchar(10),
  "subcategory_id" varchar(10)
);
SELECT * FROM "campaigns"

CREATE TABLE "contacts" (
  "contact_id" int PRIMARY KEY,
  "first_name" varchar(100),
  "last_name" varchar(100),
  "email" varchar(255)
);

SELECT * FROM "contacts"

CREATE TABLE "categories" (
  "category_id" varchar(10) PRIMARY KEY,
  "category_name" varchar(100)
);

SELECT * FROM "categories"


CREATE TABLE "subcategories" (
  "subcategory_id" varchar(10) PRIMARY KEY,
  "subcategory_name" varchar(100)
);

SELECT * FROM "subcategories"

ALTER TABLE "campaigns" ADD FOREIGN KEY ("contact_id") REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaigns" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("category_id");

ALTER TABLE "campaigns" ADD FOREIGN KEY ("subcategory_id") REFERENCES "subcategories" ("subcategory_id");
