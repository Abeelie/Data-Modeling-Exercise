-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Patient" (
    "PatientID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Insurance" string   NOT NULL,
    "Birthday" string   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "Visits" (
    "VisitsID" int   NOT NULL,
    "PatientsID" int   NOT NULL,
    "DoctorID" int   NOT NULL,
    "Date" varchar   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "VisitsID"
     )
);

CREATE TABLE "Doctor" (
    "DoctorID" int   NOT NULL,
    "Specialty" string   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "DoctorID"
     )
);

CREATE TABLE "Diagnosis" (
    "DiagnosisID" int   NOT NULL,
    "VisitsID" int   NOT NULL,
    "DiseaseID" int   NOT NULL,
    "Notes" string   NOT NULL,
    CONSTRAINT "pk_Diagnosis" PRIMARY KEY (
        "DiagnosisID"
     )
);

CREATE TABLE "Disease" (
    "DiseaseID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Description" string   NOT NULL,
    CONSTRAINT "pk_Disease" PRIMARY KEY (
        "DiseaseID"
     ),
    CONSTRAINT "uc_Disease_Name" UNIQUE (
        "Name"
    )
);

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_PatientsID" FOREIGN KEY("PatientsID")
REFERENCES "Patient" ("PatientID");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctor" ("DoctorID");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_VisitsID" FOREIGN KEY("VisitsID")
REFERENCES "Visits" ("VisitsID");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_DiseaseID" FOREIGN KEY("DiseaseID")
REFERENCES "Disease" ("DiseaseID");

CREATE INDEX "idx_Patient_Name"
ON "Patient" ("Name");

