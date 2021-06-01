-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Region" (
    "RegionID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "RegionID"
     )
);

CREATE TABLE "Post" (
    "PostID" int   NOT NULL,
    "UsersID" int   NOT NULL,
    "RegionID" int   NOT NULL,
    "CategoriesID" int   NOT NULL,
    "Title" string   NOT NULL,
    "Text" string   NOT NULL,
    "Location" string   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "PostID"
     )
);

CREATE TABLE "Users" (
    "UsersID" int   NOT NULL,
    "RegionID" int   NOT NULL,
    "User_name" string   NOT NULL,
    "Password" string   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "UsersID"
     ),
    CONSTRAINT "uc_Users_Password" UNIQUE (
        "Password"
    )
);

CREATE TABLE "Categories" (
    "CategoriesID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "CategoriesID"
     )
);

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_UsersID" FOREIGN KEY("UsersID")
REFERENCES "Users" ("UsersID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Region" ("RegionID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_CategoriesID" FOREIGN KEY("CategoriesID")
REFERENCES "Categories" ("CategoriesID");

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Region" ("RegionID");

CREATE INDEX "idx_Region_Name"
ON "Region" ("Name");

