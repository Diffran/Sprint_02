INSERT INTO PROVINCIA (nom) VALUES 
('Barcelona'),
('Girona'),
('Madrid');

INSERT INTO LOCALITAT (nom, id_provincia) VALUES 
('Barcelona', 1), 
('Figueres', 2), 
('Hospitalet de Llobregat', 1),
('Madrid', 3); 


INSERT INTO ADREÇA (carrer, numero, pis, porta, codi_postal, id_localitat) VALUES 
('Carrer Major', 123, 1, 1, 08001, 1),
('Rambla Catalunya', 456, 2, 2, 08002, 1),
('Avinguda Diagonal', 789, 3, 3, 08003, 1), 
('Carrer del Sol', 10, 1, 4, 17001, 2),
('Carrer de la Mar', 20, 2, 5, 17002, 2), 
('Plaça de la Vila', 30, 3, 6, 17003, 2), 
('Avinguda del Mar', 40, 4, 7, 17004, 2), 
('Gran Via', 100, 1, 8, 08901, 3),
('Carrer Sant Antoni', 200, 2, 9, 08902, 3), 
('Carrer Granada', 300, 3, 10, 08903, 3), 
('Carrer de la Paz', 50, 1, 11, 28001, 4), 
('Paseo del Prado', 60, 2, 12, 28002, 4), 
('Calle Mayor', 70, 3, 13, 28003, 4),
('Plaza de España', 80, 4, 14, 28004, 4),
('Carrer dels Encants', 25, 2, 5, 08005, 1), 
('Avinguda Paral·lel', 70, 1, 3, 08006, 1), 
('Carrer de la Llacuna', 15, 3, 7, 08007, 1), 
('Paseo de la Castellana', 120, 1, 1, 28005, 4), 
('Calle Alcalá', 130, 2, 2, 28006, 4), 
('Calle Serrano', 140, 3, 3, 28007, 4), 
('Carrer de Balmes', 55, 4, 2, 08008, 1), 
('Avinguda Diagonal', 200, 1, 1, 08009, 1),
('Rambla de Catalunya', 100, 3, 5, 08010, 1),
('Carrer de Valencia', 123, 2, 3, 08005, 1),
('Plaça de lAjuntament', 10, 1, 2, 08006, 1);


INSERT INTO BOTIGA (nom, id_adreça) VALUES 
('Pizzería Bella Napoli', 1), -- Barcelona Ciudad
('La Pizzería Italiana', 4), -- Figueres
('Pizzería Don Giovanni', 8), -- Hospitalet de Llobregat
('Pizzería La Romana', 11); --  Madrid Ciudad

-- Insertar empleados en cada tienda
INSERT INTO EMPLEAT (nom, cognoms, NIF, telefon, posicio, id_botiga, id_adreça) VALUES 
('Carlos', 'García', '12345678A', 612345678, 'cuiner', 1, 2), -- Barcelona Ciudad
('Marta', 'López', '87654321B', 623456789, 'repartidor', 1, 3), -- Barcelona Ciudad
('Juan', 'Martínez', '23456789C', 634567890, 'cuiner', 2, 5), -- Figueres
('Laura', 'Pérez', '98765432D', 645678901, 'cuiner', 3, 9), -- Hospitalet de Llobregat
('Pedro', 'Gómez', '34567890E', 656789012, 'cuiner', 4, 12), -- Madrid Ciudad
('Ana', 'Rodríguez', '56789012F', 667890123, 'repartidor', 4, 13), -- Madrid Ciudad
('Sergio', 'Hernández', '89012345G', 678901234, 'repartidor', 1, 15); -- Barcelona Ciudad


INSERT INTO CLIENT (nom, cogoms, telefon, id_adreça) VALUES 
('María', 'García', 600123456, 6), 
('Antonio', 'López', 601234567, 7), 
('Elena', 'Martínez', 602345678, 10),
('Manuel', 'Pérez', 603456789, 14), -- MAD
('Laura', 'Gómez', 604567890, 16), -- BCN
('David', 'Rodríguez', 605678901, 17),
('Ana', 'Sánchez', 606789012, 18), -- MAD
('Pedro', 'Martín', 607890123, 19), 
('Carmen', 'Gutiérrez', 608901234, 20), 
('Daniel', 'Ruiz', 609012345, 21), -- BCN
('Sara', 'Hernández', 610123456, 22),
('Javier', 'Díaz', 611234567, 23),
('Luis', 'Fernández', 612345678, 24), 
('Lucía', 'González', 613456789, 25); 

INSERT INTO BEGUDA (id_beguda) VALUES 
(1),
(2),
(3);

INSERT INTO PRODUCTE (`nom`, `descripcio`, `imatge`, `preu`, `id_beguda`, `id_pizza`, `id_hamburguesa`) VALUES 
('Pizza Margarita', 'Deliciosa pizza con salsa de tomate, mozzarella y albahaca fresca', NULL, 8.99, NULL, NULL, NULL),
('Hamburguesa Clásica', 'Jugosa hamburguesa con carne de res, lechuga, tomate y queso cheddar', NULL, 6.49, NULL, NULL, NULL),
('Coca-Cola', 'Refresco de cola refrescante', NULL, 1.99, 1, NULL, NULL),
('Agua Mineral', 'Agua mineral natural en botella', NULL, 0.99, 2, NULL, NULL),
('Pizza Hawaiana', 'Pizza con salsa de tomate, mozzarella, jamón y piña', NULL, 9.49, NULL, NULL, NULL),
('Hamburguesa BBQ', 'Hamburguesa con salsa barbacoa, cebolla caramelizada y queso ahumado', NULL, 7.99, NULL, NULL, NULL),
('Sprite', 'Refresco de lima-limón', NULL, 1.99, 3, NULL, NULL),
('Té Helado', 'Refresco de té helado con sabor a limón', NULL, 2.49, NULL, NULL, NULL),
('Pizza Vegetariana', 'Pizza con salsa de tomate, mozzarella y una variedad de vegetales frescos', NULL, 10.99, NULL, NULL, NULL),
('Hamburguesa Vegana', 'Hamburguesa de quinoa y lentejas con aguacate y rúcula', NULL, 8.99, NULL, NULL, NULL);





INSERT INTO COMANDA (data, tipus, quantitat_pizza, quantitat_hamburguesa, quantitat_beguda, preu_total, id_botiga, id_client) VALUES 
('2021-03-15 12:30:00', 'domicili', 0, 1, 3, 32.95, 2, 1), 
('2021-07-20 18:45:00', 'domicili', 1, 0, 2, 15.99, 2, 2), 
('2022-02-10 20:15:00', 'botiga', 3, 2, 1, 29.99, 3, 3),    
('2022-04-05 19:00:00', 'domicili', 2, 1, 3, 32.95, 4, 4), 
('2022-08-12 13:20:00', 'domicili', 1, 0, 2, 15.99, 1, 5), 
('2023-01-25 14:00:00', 'botiga', 3, 2, 1, 29.99, 1, 6),    
('2023-03-30 19:30:00', 'domicili', 2, 1, 3, 32.95, 4, 7), 
('2023-06-08 17:10:00', 'domicili', 1, 0, 2, 15.99, 4, 8), 
('2021-09-14 18:00:00', 'botiga', 3, 2, 1, 29.99, 4, 9),    
('2021-11-20 12:45:00', 'domicili', 2, 1, 3, 32.95, 1, 10),
('2022-06-05 20:30:00', 'domicili', 1, 0, 2, 15.99, 1, 11),
('2022-09-18 19:15:00', 'botiga', 3, 2, 1, 29.99, 1, 12),   
('2023-02-25 13:50:00', 'domicili', 2, 1, 3, 32.95, 1, 13),
('2023-05-10 17:30:00', 'domicili', 1, 0, 2, 15.99, 1, 14),
('2022-02-10 18:30:00', 'botiga', 1, 2, 1, 25.99, 1, 10),
('2022-08-05 20:00:00', 'domicili', 3, 0, 2, 28.95, 2, 10);



INSERT INTO LINEA_COMANDA (id_comanda, id_producte) VALUES
(5,3), 
(1,4),  
(2,7),   
(5,4),    
(6,8),
(7,10), 
(2,3),    
(8,7), 
(9,1),
(10,2),    
(11,4),   
(11,6),    
(3,2), 
(12,4), 
(13,4), 
(13,9);    


INSERT INTO REPARTO (lliurament, id_comanda, id_empleat) VALUES
('2023-04-15 13:30:00', 3, 6),
('2023-04-16 11:45:00', 6, 6),
('2023-04-17 14:20:00', 7, 2),
('2023-04-18 17:00:00', 9, 7),
('2023-04-19 12:15:00', 10, 2),
('2023-04-20 10:30:00', 11, 2),
('2023-04-21 09:45:00', 12, 2),
('2023-04-22 16:20:00', 14, 7),
('2023-04-23 13:50:00', 15, 7),
('2023-04-24 15:00:00', 16, 2);












