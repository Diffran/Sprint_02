-- Llista el total de factures d'un client/a en un període determinat.
SELECT * FROM VENDA WHERE id_client = 1 AND data BETWEEN '2021-01-01 00:00:00' AND '2022-12-31 23:59:59';

-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT  e.id_empleat,e.nom, m.id_marca, m.nom  FROM marca m
JOIN ullera u ON u.id_marca = m.id_marca 
JOIN venda v ON u.id_ullera = v.id_ullera
JOIN empleat e ON v.id_empleat = e.id_empleat
WHERE v.id_empleat = 1 AND YEAR(v.data) = 2022;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT DISTINCT p.* FROM proveidor p
INNER JOIN marca m on m.id_proveidor= p.id_proveidor
INNER JOIN ullera u on u.id_marca = m.id_marca
RIGHT JOIN venda v on v.id_ullera = u.id_ullera
