-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Team" (
    "TeamID" int   NOT NULL,
    "Name" string   NOT NULL,
    "City" string   NOT NULL,
    CONSTRAINT "pk_Team" PRIMARY KEY (
        "TeamID"
     )
);

CREATE TABLE "Referees" (
    "RefereesID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "RefereesID"
     )
);

CREATE TABLE "Results" (
    "ResultsID" int   NOT NULL,
    "TeamID" int   NOT NULL,
    "MatchesID" int   NOT NULL,
    "Result" string   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "ResultsID"
     )
);

CREATE TABLE "Players" (
    "PlayersID" int   NOT NULL,
    "TeamID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Birthday" string   NOT NULL,
    "Height" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "PlayersID"
     )
);

CREATE TABLE "Matches" (
    "MatchesID" int   NOT NULL,
    "Home_TeamID" int   NOT NULL,
    "Away_TeamID" int   NOT NULL,
    "SeasonID" int   NOT NULL,
    "Head_Referee_ID" int   NOT NULL,
    "Assistant_1_Referee_ID" int   NOT NULL,
    "Assistant_2_ID" int   NOT NULL,
    "Location" string   NOT NULL,
    "Date" int   NOT NULL,
    "Start_Time" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "MatchesID"
     )
);

CREATE TABLE "Goals" (
    "GoalsID" int   NOT NULL,
    "Player_ID" int   NOT NULL,
    "MatchesID" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "GoalsID"
     )
);

CREATE TABLE "LineUps" (
    "LineUpsID" int   NOT NULL,
    "Player_ID" int   NOT NULL,
    "MatchesID" int   NOT NULL,
    "TeamID" int   NOT NULL,
    CONSTRAINT "pk_LineUps" PRIMARY KEY (
        "LineUpsID"
     )
);

CREATE TABLE "Season" (
    "SeasonID" int   NOT NULL,
    "Start_Date" int   NOT NULL,
    "End_date" int   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "SeasonID"
     )
);

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Team" ("TeamID");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_MatchesID" FOREIGN KEY("MatchesID")
REFERENCES "Matches" ("MatchesID");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Team" ("TeamID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Home_TeamID" FOREIGN KEY("Home_TeamID")
REFERENCES "Team" ("TeamID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Away_TeamID" FOREIGN KEY("Away_TeamID")
REFERENCES "Team" ("TeamID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_SeasonID" FOREIGN KEY("SeasonID")
REFERENCES "Season" ("SeasonID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Head_Referee_ID" FOREIGN KEY("Head_Referee_ID")
REFERENCES "Referees" ("RefereesID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Assistant_1_Referee_ID" FOREIGN KEY("Assistant_1_Referee_ID")
REFERENCES "Referees" ("RefereesID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Assistant_2_ID" FOREIGN KEY("Assistant_2_ID")
REFERENCES "Referees" ("RefereesID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_Player_ID" FOREIGN KEY("Player_ID")
REFERENCES "Players" ("PlayersID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_MatchesID" FOREIGN KEY("MatchesID")
REFERENCES "Matches" ("MatchesID");

ALTER TABLE "LineUps" ADD CONSTRAINT "fk_LineUps_Player_ID" FOREIGN KEY("Player_ID")
REFERENCES "Players" ("PlayersID");

ALTER TABLE "LineUps" ADD CONSTRAINT "fk_LineUps_MatchesID" FOREIGN KEY("MatchesID")
REFERENCES "Matches" ("MatchesID");

ALTER TABLE "LineUps" ADD CONSTRAINT "fk_LineUps_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Team" ("TeamID");

CREATE INDEX "idx_Team_Name"
ON "Team" ("Name");

