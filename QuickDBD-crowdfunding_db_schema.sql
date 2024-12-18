-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/cu19XY
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Campaign" (
    "campaign_id" int   NOT NULL,
    "name" varchar(255)   NOT NULL,
    "description" text   NOT NULL,
    "goal" NOT   NULL,
    "pledged" NOT   NULL,
    "backers_count" int   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "outcome" varchar(50)   NOT NULL,
    "category_id" INT   NOT NULL,
    "subcategory_id" INT   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "campaign_id"
     )
);

CREATE TABLE "Category" (
    "category_id" int   NOT NULL,
    "category_name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     ),
    CONSTRAINT "uc_Category_category_name" UNIQUE (
        "category_name"
    )
);

CREATE TABLE "Subcategory" (
    "subcategory_id" int   NOT NULL,
    "subcategory_name" varchar(100)   NOT NULL,
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY (
        "subcategory_id"
     ),
    CONSTRAINT "uc_Subcategory_subcategory_name" UNIQUE (
        "subcategory_name"
    )
);

CREATE TABLE "Contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(100)   NOT NULL,
    "last_name" varchar(100)   NOT NULL,
    "email" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     ),
    CONSTRAINT "uc_Contacts_email" UNIQUE (
        "email"
    )
);

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Subcategory" ("subcategory_id");

ALTER TABLE "Subcategory" ADD CONSTRAINT "fk_Subcategory_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

