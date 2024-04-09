
-- ----------------------------------------------------
-- Inserts de les dades ...
-- ------------------------------------------------------
-- TAULA PAIS
INSERT INTO `PAIS` (`nom`) VALUES ('España');
INSERT INTO `PAIS` (`nom`) VALUES ('Francia');
INSERT INTO `PAIS` (`nom`) VALUES ('Italia');
INSERT INTO `PAIS` (`nom`) VALUES ('Alemania');
INSERT INTO `PAIS` (`nom`) VALUES ('Reino Unido');

-- TAULA ADREÇA
INSERT INTO ADREÇA (carrer, numero, piso, puerta, ciudad, codi_postal, id_pais) 
VALUES 
('Calle de la Rosa', 123, 2, 4, 'Barcelona', 08001, 1),
('Avenue des Champs-Élysées', 456, NULL, NULL, 'Paris', 75008, 2), 
('Via della Conciliazione', 789, 5, 2, 'Roma', 00193, 3), 
('Alexanderplatz', 10, NULL, NULL, 'Berlin', 10178, 4), 
('Baker Street', 221, NULL, NULL, 'London', '56452', 5), 
('Carrer de Balmes', 200, 3, 2, 'Barcelona', 08006, 1),
('Avinguda Diagonal', 300, 1, 5, 'Barcelona', 08017, 1),
('Calle Gran Vía', 150, 4, 3, 'Madrid', 28013, 1),
('Passeig de Gràcia', 100, 5, 10, 'Barcelona', 08008, 1),
('Carrer del Rosselló', 80, 2, 1, 'Barcelona', 08029, 1),
('Calle Serrano', 50, NULL, NULL, 'Madrid', 28001, 1),
('Rambla de Catalunya', 120, 1, 7, 'Barcelona', 08008, 1),
('Carrer de la Diputació', 180, 6, 2, 'Barcelona', 08011, 1),
('Carrer del Bruc', 80, 2, 3, 'Barcelona', 08009, 1),
('Calle Mayor', 120, 1, 2, 'Madrid', 28013, 1),
('Avinguda Paral·lel', 150, NULL, NULL, 'Barcelona', 08015, 1),
('Carrer de la Marina', 100, 4, 5, 'Barcelona', 08005, 1),
('Paseo del Prado', 50, 3, 7, 'Madrid', 28014, 1);

-- TAULA PROVEIDOR
INSERT INTO PROVEIDOR (nom, Telefon, Fax, NIF, id_adreça)
VALUES 
('Vidrios Ópticos S.A.', 932587419, 932587420, '1234567A', 2),
('Óptica Visión Perfecta', 910256374, 910256375, '9876543B',3),
('Elegancia Visual SL', 917398245, 917398246, '7654321C', 4),
('Moda Óptica Express', 935846271, 935846272, '0987654D', 5);

-- TAULA EMPLEAT
INSERT INTO EMPLEAT (nom, id_adreça)
VALUES 
('Juan Martínez', 1),
('María García', 6),
('Pedro López', 7);

-- TAULA CLIENT
INSERT INTO CLIENT (nom, telefon, correu_electronic, id_adreça)
VALUES 
('Laura Martínez', 612345678, 'laura@example.com', 8),
('Carlos García', 623456789, 'carlos@example.com', 9),
('Ana López', 634567890, 'ana@example.com', 10),
('David Rodríguez', 645678901, 'david@example.com', 11),
('Sara Fernández', 656789012, 'sara@example.com', 12),
('Javier Pérez', 667890123, 'javier@example.com', 13),
('Lucía Gómez', 678901234, 'lucia@example.com', 14),
('Marta Sánchez', 689012345, 'marta@example.com', 15),
('Marcos Vázquez', 690123456, 'marcos@example.com', 16),
('Elena Martín', 601234567, 'elena@example.com', 17),
('Hugo Ruiz', 611345678, 'hugo@example.com', 18);

-- TAULA MARCA
INSERT INTO MARCA (nom, id_proveidor)
VALUES 
('Ray-Ban', 1),
('Oakley', 2),
('Gucci', 1),
('Prada', 4),
('Versace', 4),
('Dior', 3),
('Tom Ford', 4);

-- TAULA ULLERA
INSERT INTO ULLERA (graduacio_izq, graduacio_der, muntura, color_muntura, color_vidre,  preu, id_venda, id_marca)
VALUES 
('0.50', '0.50', 'flotant', 'negre', 'transparent', 150.00, null,2),
('1.00', '1.00', 'pasta', 'blanc', 'gris',  200.00, null, 1),
('-0.75', '-0.75', 'metalica', 'plata', 'marró',  180.00, null,4),
('-1.25', '-1.25', 'flotant', 'blau', 'verd',  220.00, null,5),
('-2.00', '-2.00', 'pasta', 'marró', 'marró',  250.00, null,2),
('0.75', '0.75', 'metalica', 'negre', 'transparent',  190.00, null,3),
('-1.50', '-1.50', 'flotant', 'rosa', 'transparent',  230.00, null,6),
('-2.25', '-2.25', 'pasta', 'negre', 'negre',  270.00, null, 7),
('-0.50', '-0.50', 'metalica', 'plata', 'transparent',  200.00, null, 7),
('1.50', '1.50', 'flotant', 'gris', 'vermell',  240.00, null, 3),
('-1.75', '-1.75', 'flotant', 'platejat', 'blau',  260.00, null, 2),
('-0.25', '-0.25', 'pasta', 'verd', 'verd', 70, null, 4),
('-1.00', '-1.00', 'metalica', 'negre', 'gris', 120,  null, 5),
('0.25', '0.25', 'flotant', 'blanc', 'transparent',  200.00, null,1),
('-2.50', '-2.50', 'pasta', 'marró', 'marró',  270.00, null, 6),
('-1.00', '-1.00', 'metalica', 'plata', 'blau',  240.00, null, 3),
('0.50', '0.50', 'flotant', 'negre', 'negre', 220.00, null,2),
('-2.00', '-2.00', 'pasta', 'gris', 'gris',  260.00, null, 1),
('-0.75', '-0.75', 'metalica', 'plata', 'transparent', 200.00, null, 4),
('-1.50', '-1.50', 'flotant', 'negre', 'negre',  230.00, null, 5),
('1.25', '1.25', 'metalica', 'plata', 'marró',  180.00, null, 3),
('-1.25', '-1.25', 'flotant', 'blau', 'verd',  220.00, null, 1),
('-2.00', '-2.00', 'pasta', 'marró', 'marró',  250.00, null, 2),
('0.75', '0.75', 'metalica', 'negre', 'transparent',  190.00, null, 3),
('-1.50', '-1.50', 'flotant', 'rosa', 'transparent',  230.00, null, 1);

-- TAULA VENDA
INSERT INTO `VENDA` (`data`, `id_client`, `id_empleat`) VALUES 
('2021-05-10 08:30:00', 1, 3),
('2021-09-20 14:45:00', 2, 1),
('2022-02-15 10:00:00', 3, 1),
('2022-06-30 16:20:00', 4, 1),
('2023-01-05 09:15:00', 5, 3),
('2023-07-12 11:30:00', 6, 2),
('2021-03-18 11:00:00',7,2),
('2022-08-25 15:40:00',8,3),
('2022-11-10 09:55:00',9,1),
('2023-04-30 12:20:00',11, 3),
('2023-10-15 17:00:00',1,1),
('2021-07-05 13:15:00',1,2),
('2022-01-20 10:30:00',1,1),
('2022-09-12 14:00:00',2,3),
('2023-03-08 16:45:00',1,2);
