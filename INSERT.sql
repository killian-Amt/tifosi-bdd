USE tifosi;

-- =====================================================
-- INSERT MARQUE
-- =====================================================

INSERT INTO marque (id_marque, nom) VALUES
(1, 'Coca-Cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- =====================================================
-- INSERT INGREDIENT
-- =====================================================

INSERT INTO ingredient (id_ingredient, nom) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base Crème'),
(7, 'Champignon'),
(8, 'Chèvre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon Cru'),
(13, 'Jambon Cuit'),
(14, 'Mozzarella'),
(15, 'Olive Noire'),
(16, 'Oeuf'),
(17, 'Oignon'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate Cerise');

-- =====================================================
-- INSERT MENU (1 focaccia = 1 menu)
-- =====================================================

INSERT INTO menu (id_menu, nom, prix) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

-- =====================================================
-- INSERT FOCACCIA
-- =====================================================

INSERT INTO focaccia (id_focaccia, nom, prix, id_menu) VALUES
(1, 'Mozaccia', 9.80, 1),
(2, 'Gorgonzollaccia', 10.80, 2),
(3, 'Raclaccia', 8.90, 3),
(4, 'Emmentalaccia', 9.80, 4),
(5, 'Tradizione', 8.90, 5),
(6, 'Hawaienne', 11.20, 6),
(7, 'Américaine', 10.80, 7),
(8, 'Paysanne', 12.80, 8);

-- =====================================================
-- INSERT BOISSON
-- =====================================================

INSERT INTO boisson (id_boisson, nom, id_marque) VALUES
(1, 'Coca-Cola Zéro', 1),
(2, 'Coca-Cola Original', 1),
(3, 'Fanta Citron', 1),
(4, 'Fanta Orange', 1),
(5, 'Capri-Sun', 4),
(6, 'Pepsi', 4),
(7, 'Pepsi Max Zéro', 4),
(8, 'Lipton Zéro Citron', 4),
(9, 'Lipton Peach', 4),
(10, 'Monster Energy Ultra Gold', 3),
(11, 'Monster Energy Ultra Blue', 3),
(12, 'Eau de source', 2);

-- =====================================================
-- INSERT COMPREND (relation focaccia / ingredient)
-- =====================================================

-- Mozaccia
INSERT INTO comprend VALUES
(1, 5, 1),  -- Base Tomate
(1, 14, 1), -- Mozzarella
(1, 9, 1),  -- Cresson
(1, 13, 1), -- Jambon Cuit
(1, 1, 1),  -- Ail
(1, 18, 1), -- Parmesan
(1, 20, 1), -- Poivre
(1, 15, 1); -- Olive Noire

-- Gorgonzollaccia
INSERT INTO comprend VALUES
(2, 5, 1),
(2, 11, 1),
(2, 9, 1),
(2, 12, 1),
(2, 18, 1),
(2, 20, 1),
(2, 15, 1);

-- Raclaccia
INSERT INTO comprend VALUES
(3, 5, 1),
(3, 22, 1),
(3, 9, 1),
(3, 4, 1),
(3, 17, 1),
(3, 18, 1),
(3, 20, 1);

-- Emmentalaccia
INSERT INTO comprend VALUES
(4, 6, 1),
(4, 10, 1),
(4, 9, 1),
(4, 13, 1),
(4, 18, 1),
(4, 20, 1),
(4, 15, 1);

-- Tradizione
INSERT INTO comprend VALUES
(5, 5, 1),
(5, 14, 1),
(5, 9, 1),
(5, 12, 1),
(5, 18, 1),
(5, 20, 1),
(5, 15, 1);

-- Hawaienne
INSERT INTO comprend VALUES
(6, 5, 1),
(6, 14, 1),
(6, 9, 1),
(6, 2, 1),
(6, 19, 1),
(6, 18, 1),
(6, 20, 1);

-- Américaine
INSERT INTO comprend VALUES
(7, 5, 1),
(7, 14, 1),
(7, 9, 1),
(7, 4, 1),
(7, 16, 1),
(7, 18, 1),
(7, 20, 1);

-- Paysanne
INSERT INTO comprend VALUES
(8, 6, 1),
(8, 8, 1),
(8, 9, 1),
(8, 21, 1),
(8, 17, 1),
(8, 18, 1),
(8, 20, 1);
