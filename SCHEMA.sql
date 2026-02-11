-- =====================================================
-- Création de la base de données TIFOSI
-- =====================================================

DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi;
USE tifosi;

-- =====================================================
-- Création de l'utilisateur
-- =====================================================

DROP USER IF EXISTS 'tifosi'@'localhost';
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'Tifosi2026!';

GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

-- =====================================================
-- Table MARQUE
-- =====================================================

CREATE TABLE marque (
    id_marque INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- =====================================================
-- Table BOISSON
-- =====================================================

CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    
    CONSTRAINT fk_boisson_marque
        FOREIGN KEY (id_marque)
        REFERENCES marque(id_marque)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- =====================================================
-- Table MENU
-- =====================================================

CREATE TABLE menu (
    id_menu INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix >= 0)
);

-- =====================================================
-- Table FOCACCIA
-- =====================================================

CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix >= 0),
    id_menu INT NOT NULL,

    CONSTRAINT fk_focaccia_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu(id_menu)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- =====================================================
-- Table INGREDIENT
-- =====================================================

CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- =====================================================
-- Table COMPREND (relation focaccia / ingredient)
-- =====================================================

CREATE TABLE comprend (
    id_focaccia INT,
    id_ingredient INT,
    quantite INT NOT NULL CHECK (quantite > 0),

    PRIMARY KEY (id_focaccia, id_ingredient),

    CONSTRAINT fk_comprend_focaccia
        FOREIGN KEY (id_focaccia)
        REFERENCES focaccia(id_focaccia)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_comprend_ingredient
        FOREIGN KEY (id_ingredient)
        REFERENCES ingredient(id_ingredient)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- =====================================================
-- Table CLIENT
-- =====================================================

CREATE TABLE client (
    id_client INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT NOT NULL
);

-- =====================================================
-- Table ACHETE (relation client / menu)
-- =====================================================

CREATE TABLE achete (
    id_client INT,
    id_menu INT,
    date_achat DATE NOT NULL,

    PRIMARY KEY (id_client, id_menu, date_achat),

    CONSTRAINT fk_achete_client
        FOREIGN KEY (id_client)
        REFERENCES client(id_client)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_achete_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu(id_menu)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
