-- =====================================================
-- REQUETE- 1
-- =====================================================

SELECT nom
FROM focaccia
ORDER BY nom ASC;

-- =====================================================
-- REQUETE- 2
-- =====================================================

SELECT COUNT(*) AS total_ingredients
FROM ingredient;

-- =====================================================
-- REQUETE- 3
-- =====================================================

SELECT AVG(prix) AS prix_moyen
FROM focaccia;

-- =====================================================
-- REQUETE- 4
-- =====================================================

SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;

-- =====================================================
-- REQUETE- 5
-- =====================================================

SELECT i.nom
FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia';

-- =====================================================
-- REQUETE- 6
-- =====================================================

SELECT f.nom, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.nom;

-- =====================================================
-- REQUETE- 7
-- =====================================================

SELECT f.nom
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.nom
ORDER BY COUNT(c.id_ingredient) DESC
LIMIT 1;

-- =====================================================
-- REQUETE- 8
-- =====================================================

SELECT f.nom
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';

-- =====================================================
-- REQUETE- 9
-- =====================================================

SELECT i.nom
FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_ingredient IS NULL;

-- =====================================================
-- REQUETE- 10
-- =====================================================

SELECT f.nom
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);

