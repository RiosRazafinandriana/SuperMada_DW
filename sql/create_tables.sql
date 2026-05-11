CREATE TABLE produits (
    id_produit      VARCHAR(10)  PRIMARY KEY,
    nom             VARCHAR(100) NOT NULL,
    sous_categorie  VARCHAR(50)  NOT NULL,
    categorie       VARCHAR(50)  NOT NULL,
    marque          VARCHAR(50)  NOT NULL,
    fournisseur     VARCHAR(100) NOT NULL
);


CREATE TABLE magasins (
    id_magasin  VARCHAR(10)  PRIMARY KEY,
    nom         VARCHAR(100) NOT NULL,
    ville       VARCHAR(50)  NOT NULL,
    region      VARCHAR(50)  NOT NULL,
    surface_m2  INTEGER      NOT NULL CHECK (surface_m2 > 0)
);


CREATE TABLE clients (
    id_client           VARCHAR(10)  PRIMARY KEY,
    age                 SMALLINT     NOT NULL CHECK(age >= 0 AND age <= 150), 
    sexe                CHAR(1)      NOT NULL CHECK (sexe IN ('M', 'F','I')),
    ville               VARCHAR(50)  NOT NULL,
    categorie_fidelite  VARCHAR(20)  NOT NULL CHECK (categorie_fidelite IN ('Bronze', 'Silver', 'Gold', 'Platinum', 'Inconnue'))
);


CREATE TABLE ventes (
    id_transaction  INTEGER      PRIMARY KEY,
    date            DATE         NOT NULL,
    id_produit      VARCHAR(10)  NOT NULL,
    id_magasin      VARCHAR(10)  NOT NULL,
    id_client       VARCHAR(10)  NOT NULL,
    quantite        SMALLINT     NOT NULL CHECK (quantite > 0),
    prix_unitaire   NUMERIC(12,2) NOT NULL CHECK (prix_unitaire > 0),

    CONSTRAINT fk_ventes_produit  FOREIGN KEY (id_produit)  REFERENCES produits (id_produit),
    CONSTRAINT fk_ventes_magasin  FOREIGN KEY (id_magasin)  REFERENCES magasins (id_magasin),
    CONSTRAINT fk_ventes_client   FOREIGN KEY (id_client)   REFERENCES clients  (id_client),
    CONSTRAINT fk_ventes_date FOREIGN KEY (date) REFERENCES dim_date (id_date)
);

CREATE TABLE date (
    id_date     DATE         PRIMARY KEY,
    annee       INT          NOT NULL,
    mois        INT          NOT NULL CHECK (mois BETWEEN 1 AND 12),
    jour        INT          NOT NULL CHECK (jour BETWEEN 1 AND 31),
    trimestre   INT          NOT NULL CHECK (trimestre BETWEEN 1 AND 4),
    nom_mois    VARCHAR(20)  NOT NULL,
    nom_jour    VARCHAR(20)  NOT NULL
);
