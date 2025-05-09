CREATE TABLE "utilisateurs" (
  "id" SERIAL PRIMARY KEY,
  "photo" BYTEA,
  "biographie" varchar(160),
  "lien" varchar(255),
  "prenom" varchar(20),
  "nom" varchar(20),
  "email" varchar(50),
  "mot_de_passe" varchar(255),
  "id_localisation" int
);

CREATE TABLE "localisations" (
  "id" SERIAL PRIMARY KEY,
  "pays" varchar(50),
  "ville" varchar(50),
  "adresse" varchar(50)
);

CREATE TABLE "historiques" (
  "id" SERIAL PRIMARY KEY,
  "nombre_de_tentative" int,
  "detail_de_connexion" varchar(100),
  "id_utilisateur" int
);

CREATE TABLE "publications" (
  "id" SERIAL PRIMARY KEY,
  "texte" varchar(280),
  "id_utilisateur" int
);

CREATE TABLE "médias" (
  "id" SERIAL PRIMARY KEY,
  "photo" BYTEA,
  "video" BYTEA,
  "id_publication" int
);

CREATE TABLE "likes" (
  "id" SERIAL PRIMARY KEY,
  "id_publication" int
);

CREATE TABLE "retweets" (
  "id" SERIAL PRIMARY KEY,
  "id_publication" int
);

CREATE TABLE "commentaires" (
  "id" SERIAL PRIMARY KEY,
  "id_publication" int,
  "message" varchar(280),
  "date_commentaire" date
);

CREATE TABLE "followers" (
  "id" SERIAL PRIMARY KEY,
  "id_utilisateur" int
);

CREATE TABLE "followings" (
  "id" SERIAL PRIMARY KEY,
  "id_utilisateur" int
);

ALTER TABLE "utilisateurs" ADD FOREIGN KEY ("id_localisation") REFERENCES "localisations" ("id");

ALTER TABLE "historiques" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateurs" ("id");

ALTER TABLE "publications" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateurs" ("id");

ALTER TABLE "médias" ADD FOREIGN KEY ("id_publication") REFERENCES "publications" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("id_publication") REFERENCES "publications" ("id");

ALTER TABLE "retweets" ADD FOREIGN KEY ("id_publication") REFERENCES "publications" ("id");

ALTER TABLE "commentaires" ADD FOREIGN KEY ("id_publication") REFERENCES "publications" ("id");

ALTER TABLE "followers" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateurs" ("id");

ALTER TABLE "followings" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateurs" ("id");
