CREATE TABLE utilisateurs (
  id integer PRIMARY KEY,
  prenom varchar(20),
  nom varchar(20),
  email varchar(50),
  mot_de_passe varchar(255),
  date_inscription date,
  id_profil integer,
  id_localisation integer
);

CREATE TABLE profils (
  id integer PRIMARY KEY,
  photo BYTEA,
  biographie varchar(160),
  lien varchar(255)
);

CREATE TABLE localisations (
  id integer PRIMARY KEY,
  pays varchar(50),
  ville varchar(50),
  adresse varchar(50)
);

CREATE TABLE confidentialités (
  id integer PRIMARY KEY,
  etatDuProfils varchar(30),
  etatDuContenu varchar(30),
  id_profil integer
);

CREATE TABLE historiques (
  id integer PRIMARY KEY,
  nombreDeTentative integer,
  DétailDeConnexion varchar(100),
  id_utilisateur integer
);

CREATE TABLE publications (
  id integer PRIMARY KEY,
  messageDePublication varchar(280),
  id_utilisateur integer
);

CREATE TABLE médias (
  id integer PRIMARY KEY,
  photo BYTEA,
  video BYTEA,
  id_publication integer
);

CREATE TABLE mappings (
  id integer PRIMARY KEY,
  nbreAction integer,
  notificationDuMapping varchar(255)
);

CREATE TABLE publications_mappings (
  id_publication integer,
  id_mapping integer,
  primary key(id_publication,id_mapping)
);

CREATE TABLE likes (
  id integer PRIMARY KEY,
  id_utilisateur integer,
  date_like date
);

CREATE TABLE retweets (
  id integer PRIMARY KEY,
  date_retweet date
);

CREATE TABLE commentaires (
  id integer PRIMARY KEY,
  id_publication integer,
  message varchar(280),
  date_commentaire date
);

CREATE TABLE followers (
  id integer PRIMARY KEY,
  date_suivi date
);

CREATE TABLE followers_utilisateurs (
  id_utilisateur integer,
  id_follower integer,
  primary key(id_utilisateur,id_follower)
);

CREATE TABLE hashtags (
  id integer PRIMARY KEY,
  nom varchar(50) UNIQUE
);
CREATE TABLE utilisateurs_retweets (
  id_utilisateur integer,
  id_retweet integer,
  primary key(id_utilisateur,id_retweet)
);
CREATE TABLE publications_hashtags (
  id_publication integer,
  id_hashtag integer,
  primary key(id_publication,id_hashtag)
);

ALTER TABLE utilisateurs ADD FOREIGN KEY (id_profil) REFERENCES profils(id);

ALTER TABLE utilisateurs ADD FOREIGN KEY (id_localisation) REFERENCES localisations (id);

ALTER TABLE confidentialités ADD FOREIGN KEY (id_profil) REFERENCES profils(id);

ALTER TABLE historiques ADD FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id);

ALTER TABLE publications ADD FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id);

ALTER TABLE médias ADD FOREIGN KEY (id_publication) REFERENCES publications(id);

ALTER TABLE publications_mappings ADD FOREIGN KEY (id_publication) REFERENCES publications(id);

ALTER TABLE publications_mappings ADD FOREIGN KEY (id_mapping) REFERENCES mappings(id);

ALTER TABLE likes ADD FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id);

ALTER TABLE utilisateurs_retweets ADD FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id);

ALTER TABLE utilisateurs_retweets ADD FOREIGN KEY (id_retweet) REFERENCES retweets(id);

ALTER TABLE commentaires ADD FOREIGN KEY (id_publication) REFERENCES publications(id);

ALTER TABLE followers_utilisateurs ADD FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs("id");

ALTER TABLE followers_utilisateurs ADD FOREIGN KEY (id_follower) REFERENCES followers(id);

ALTER TABLE publications_hashtags ADD FOREIGN KEY (id_publication) REFERENCES publications(id);

ALTER TABLE publications_hashtags ADD FOREIGN KEY (id_hashtag) REFERENCES hashtags(id);
