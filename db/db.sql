-- ************************************** "public"."class"

CREATE TABLE "public"."class"
(
 "id"         SERIAL NOT NULL PRIMARY KEY,
 "class_name" varchar(50) NOT NULL

);

-- ************************************** "public"."attendance"

CREATE TABLE "public"."attendance"
(
 "id"        SERIAL NOT NULL PRIMARY KEY,
 "raid_id"   int NOT NULL,
 "member_id" int NOT NULL,
 CONSTRAINT "FK_232" FOREIGN KEY ( "raid_id" ) REFERENCES "public"."raids" ( "id" ),
 CONSTRAINT "FK_235" FOREIGN KEY ( "member_id" ) REFERENCES "public"."members" ( "id" )
);

CREATE INDEX "fkIdx_232" ON "public"."attendance"
(
 "raid_id"
);

CREATE INDEX "fkIdx_235" ON "public"."attendance"
(
 "member_id"
);

-- ************************************** "public"."items"

CREATE TABLE "public"."items"
(
 "id"         SERIAL NOT NULL PRIMARY KEY,
 "item_name"  varchar(50) NOT NULL,
 "zone"       varchar(50) NOT NULL,
 "wowhead_id" int NOT NULL

);

-- ************************************** "public"."items_dropped"

CREATE TABLE "public"."items_dropped"
(
 "id"        SERIAL NOT NULL PRIMARY KEY,
 "raid_id"   int NOT NULL,
 "item_id"   int NOT NULL,
 "member_id" int NOT NULL,
 CONSTRAINT "FK_214" FOREIGN KEY ( "raid_id" ) REFERENCES "public"."raids" ( "id" ),
 CONSTRAINT "FK_217" FOREIGN KEY ( "item_id" ) REFERENCES "public"."items" ( "id" ),
 CONSTRAINT "FK_226" FOREIGN KEY ( "member_id" ) REFERENCES "public"."members" ( "id" )
);

CREATE INDEX "fkIdx_214" ON "public"."items_dropped"
(
 "raid_id"
);

CREATE INDEX "fkIdx_217" ON "public"."items_dropped"
(
 "item_id"
);

CREATE INDEX "fkIdx_226" ON "public"."items_dropped"
(
 "member_id"
);

-- ************************************** "public"."raids"

CREATE TABLE "public"."raids"
(
 "id"        SERIAL NOT NULL PRIMARY KEY,
 "raid_name" varchar(50) NOT NULL,
 "date"      date NOT NULL

);

-- ************************************** "public"."members"

CREATE TABLE "public"."members"
(
 "id"     SERIAL NOT NULL PRIMARY KEY,
 "name"   varchar(50) NOT NULL,
 "joined" date NOT NULL,
 "class"  int NOT NULL,
 "rank"   int NOT NULL,
 "show"   boolean NOT NULL,
 CONSTRAINT "FK_198" FOREIGN KEY ( "class" ) REFERENCES "public"."class" ( "id" ),
 CONSTRAINT "FK_201" FOREIGN KEY ( "rank" ) REFERENCES "public"."rank" ( "id" )
);

CREATE INDEX "fkIdx_198" ON "public"."members"
(
 "class"
);

CREATE INDEX "fkIdx_201" ON "public"."members"
(
 "rank"
);

-- ************************************** "public"."rank"

CREATE TABLE "public"."rank"
(
 "id"        SERIAL NOT NULL PRIMARY KEY,
 "rank_name" varchar(50) NOT NULL

);


INSERT INTO class (id, class_name)
VALUES  (DEFAULT, 'Druid'),
        (DEFAULT, 'Hunter'),
        (DEFAULT, 'Mage'),
        (DEFAULT, 'Paladin'),
        (DEFAULT, 'Priest'),
        (DEFAULT, 'Rogue'),
        (DEFAULT, 'Warlock'),
        (DEFAULT, 'Warrior');

INSERT INTO rank (id, rank_name)
VALUES  (DEFAULT, 'Raider'),
        (DEFAULT, 'Friend & Family'),
        (DEFAULT, 'Recruit'),
        (DEFAULT, 'Removed');

INSERT INTO members (id, name, joined, class, rank, show)
VALUES  (DEFAULT, 'Van', to_date('01 Oct 2019', 'DD Mon YYYY'), (SELECT id FROM class WHERE id=8), (SELECT id FROM rank WHERE id=2), TRUE); 

INSERT INTO items (id, item_name, zone, wowhead_id)
VALUES  (DEFAULT, 'Alcor''s Sunrazor', 'Molten Core', 14555);

INSERT INTO raids (id, raid_name, date)
VALUES  (DEFAULT, 'Test Raid', to_date('01 Oct 2019', 'DD Mon YYYY'));

INSERT INTO attendance (id, raid_id, member_id)
VALUES  (DEFAULT, (SELECT id FROM raids WHERE id=1), (SELECT id FROM members WHERE id=2));

INSERT INTO items_dropped (id, raid_id, item_id, member_id)
VALUES  (DEFAULT, (SELECT id FROM raids WHERE id=1), (SELECT id FROM items WHERE id=1), (SELECT id FROM members WHERE id=2));
        





















