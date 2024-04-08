-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema n1exercici1_optica
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `n1exercici1_optica` ;

-- -----------------------------------------------------
-- Schema n1exercici1_optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `n1exercici1_optica` DEFAULT CHARACTER SET utf8 ;
USE `n1exercici1_optica` ;

-- -----------------------------------------------------
-- Table `n1exercici1_optica`.`PAIS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici1_optica`.`PAIS` ;

CREATE TABLE IF NOT EXISTS `n1exercici1_optica`.`PAIS` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici1_optica`.`ADREÇA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici1_optica`.`ADREÇA` ;

CREATE TABLE IF NOT EXISTS `n1exercici1_optica`.`ADREÇA` (
  `id_adreça` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `piso` INT NULL,
  `puerta` INT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codi_postal` INT NOT NULL,
  `id_pais` INT NOT NULL,
  PRIMARY KEY (`id_adreça`, `id_pais`),
  INDEX `fk_ADREÇA_PAIS1_idx` (`id_pais` ASC) ,
  CONSTRAINT `fk_ADREÇA_PAIS1`
    FOREIGN KEY (`id_pais`)
    REFERENCES `n1exercici1_optica`.`PAIS` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici1_optica`.`PROVEIDOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici1_optica`.`PROVEIDOR` ;

CREATE TABLE IF NOT EXISTS `n1exercici1_optica`.`PROVEIDOR` (
  `id_proveidor` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `Telefon` INT NOT NULL,
  `Fax` INT NOT NULL,
  `NIF` VARCHAR(8) NOT NULL,
  `id_adreça` INT NOT NULL,
  PRIMARY KEY (`id_proveidor`, `id_adreça`),
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) ,
  INDEX `fk_PROVE{IDOR_ADREÇA_idx` (`id_adreça` ASC) ,
  CONSTRAINT `fk_PROVE{IDOR_ADREÇA`
    FOREIGN KEY (`id_adreça`)
    REFERENCES `n1exercici1_optica`.`ADREÇA` (`id_adreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici1_optica`.`CLIENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici1_optica`.`CLIENT` ;

CREATE TABLE IF NOT EXISTS `n1exercici1_optica`.`CLIENT` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `correu_electronic` VARCHAR(45) NOT NULL,
  `data_registre` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `client_recomana` INT NULL,
  `id_adreça` INT NOT NULL,
  PRIMARY KEY (`id_client`, `id_adreça`),
  INDEX `fk_CLIENT_CLIENT1_idx` (`client_recomana` ASC) ,
  INDEX `fk_CLIENT_ADREÇA1_idx` (`id_adreça` ASC) ,
  CONSTRAINT `fk_CLIENT_CLIENT1`
    FOREIGN KEY (`client_recomana`)
    REFERENCES `n1exercici1_optica`.`CLIENT` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENT_ADREÇA1`
    FOREIGN KEY (`id_adreça`)
    REFERENCES `n1exercici1_optica`.`ADREÇA` (`id_adreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici1_optica`.`EMPLEAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici1_optica`.`EMPLEAT` ;

CREATE TABLE IF NOT EXISTS `n1exercici1_optica`.`EMPLEAT` (
  `id_empleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `id_adreça` INT NOT NULL,
  PRIMARY KEY (`id_empleat`, `id_adreça`),
  INDEX `fk_EMPLEAT_ADREÇA1_idx` (`id_adreça` ASC) ,
  CONSTRAINT `fk_EMPLEAT_ADREÇA1`
    FOREIGN KEY (`id_adreça`)
    REFERENCES `n1exercici1_optica`.`ADREÇA` (`id_adreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici1_optica`.`VENDA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici1_optica`.`VENDA` ;

CREATE TABLE IF NOT EXISTS `n1exercici1_optica`.`VENDA` (
  `id_venda` INT NOT NULL AUTO_INCREMENT,
  `preu` DOUBLE NOT NULL,
  `id_client` INT NOT NULL,
  `id_empleat` INT NOT NULL,
  PRIMARY KEY (`id_venda`, `id_client`, `id_empleat`),
  INDEX `fk_VENDA_CLIENT1_idx` (`id_client` ASC) ,
  INDEX `fk_VENDA_EMPLEAT1_idx` (`id_empleat` ASC) ,
  CONSTRAINT `fk_VENDA_CLIENT1`
    FOREIGN KEY (`id_client`)
    REFERENCES `n1exercici1_optica`.`CLIENT` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENDA_EMPLEAT1`
    FOREIGN KEY (`id_empleat`)
    REFERENCES `n1exercici1_optica`.`EMPLEAT` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici1_optica`.`MARCA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici1_optica`.`MARCA` ;

CREATE TABLE IF NOT EXISTS `n1exercici1_optica`.`MARCA` (
  `id_marca` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `id_proveidor` INT NOT NULL,
  PRIMARY KEY (`id_marca`, `id_proveidor`),
  INDEX `fk_MARCA_PROVEIDOR1_idx` (`id_proveidor` ASC) ,
  CONSTRAINT `fk_MARCA_PROVEIDOR1`
    FOREIGN KEY (`id_proveidor`)
    REFERENCES `n1exercici1_optica`.`PROVEIDOR` (`id_proveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici1_optica`.`ULLERA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici1_optica`.`ULLERA` ;

CREATE TABLE IF NOT EXISTS `n1exercici1_optica`.`ULLERA` (
  `id_ullera` INT NOT NULL AUTO_INCREMENT,
  `graduacio_izq` VARCHAR(45) NULL,
  `graduacio_der` VARCHAR(45) NULL,
  `muntura` ENUM('flotant', 'pasta', 'metalica') NOT NULL,
  `color_muntura` VARCHAR(45) NOT NULL,
  `color_vidre_der` VARCHAR(45) NOT NULL,
  `color_vidre_izq` VARCHAR(45) NOT NULL,
  `preu` DOUBLE NULL,
  `id_venda` INT NOT NULL,
  `id_marca` INT NOT NULL,
  `id_proveidor` INT NOT NULL,
  PRIMARY KEY (`id_ullera`, `id_marca`, `id_proveidor`, `id_venda`),
  INDEX `fk_ULLERA_VENDA1_idx` (`id_venda` ASC) ,
  INDEX `fk_ULLERA_MARCA2_idx` (`id_marca` ASC, `id_proveidor` ASC) ,
  CONSTRAINT `fk_ULLERA_VENDA1`
    FOREIGN KEY (`id_venda`)
    REFERENCES `n1exercici1_optica`.`VENDA` (`id_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ULLERA_MARCA2`
    FOREIGN KEY (`id_marca` , `id_proveidor`)
    REFERENCES `n1exercici1_optica`.`MARCA` (`id_marca` , `id_proveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



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
('Baker Street', 221, NULL, NULL, 'London', 'NW1 6XE', 5), 
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
('Vidrios Ópticos S.A.', 932587419, 932587420, 'ES1234567A', 2),
('Óptica Visión Perfecta', 910256374, 910256375, 'ES9876543B',3),
('Elegancia Visual SL', 917398245, 917398246, 'ES7654321C', 4),
('Moda Óptica Express', 935846271, 935846272, 'ES0987654D', 5);

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
INSERT INTO ULLERA (graduacio_izq, graduacio_der, muntura, color_muntura, color_vidre_der, color_vidre_izq, preu, id_venda, id_marca, id_proveidor)
VALUES 
('0.50', '0.50', 'flotant', 'negre', 'transparent', 'transparent', 150.00, null,2),
('1.00', '1.00', 'pasta', 'blanc', 'gris', 'gris', 200.00, null, 1),
('-0.75', '-0.75', 'metalica', 'plata', 'marró', 'marró', 180.00, null,4),
('-1.25', '-1.25', 'flotant', 'blau', 'verd', 'verd', 220.00, null,5),
('-2.00', '-2.00', 'pasta', 'marró', 'marró', 'marró', 250.00, null,2),
('0.75', '0.75', 'metalica', 'negre', 'transparent', 'transparent', 190.00, null,3),
('-1.50', '-1.50', 'flotant', 'rosa', 'transparent', 'transparent', 230.00, null,6),
('-2.25', '-2.25', 'pasta', 'negre', 'negre', 'negre', 270.00, null, 7),
('-0.50', '-0.50', 'metalica', 'plata', 'transparent', 'transparent', 200.00, null, 7),
('1.50', '1.50', 'flotant', 'gris', 'vermell', 'vermell', 240.00, null, 2),
('-1.75', '-1.75', 'flotant', 'platejat', 'blau', 'blau', 260.00, null, 2),
('-0.25', '-0.25', 'pasta', 'verd', 'verd', 'verd', 190.00, null, 4),
('-1.00', '-1.00', 'metalica', 'negre', 'gris', 'gris', 230.00, null, 5),
('0.25', '0.25', 'flotant', 'blanc', 'transparent', 'transparent', 200.00, null,1),
('-2.50', '-2.50', 'pasta', 'marró', 'marró', 'marró', 270.00, null, 6),
('-1.00', '-1.00', 'metalica', 'plata', 'blau', 'blau', 240.00, null, 3),
('0.50', '0.50', 'flotant', 'negre', 'negre', 'negre', 220.00, null,2),
('-2.00', '-2.00', 'pasta', 'gris', 'gris', 'gris', 260.00, null, 1),
('-0.75', '-0.75', 'metalica', 'plata', 'transparent', 'transparent', 200.00, null, 4),
('-1.50', '-1.50', 'flotant', 'negre', 'negre', 'negre', 230.00, null, 5),
('1.25', '1.25', 'metalica', 'plata', 'marró', 'marró', 180.00, null, 2),
('-1.25', '-1.25', 'flotant', 'blau', 'verd', 'verd', 220.00, null, 1),
('-2.00', '-2.00', 'pasta', 'marró', 'marró', 'marró', 250.00, null, 5, 2),
('0.75', '0.75', 'metalica', 'negre', 'transparent', 'transparent', 190.00, null, 3),
('-1.50', '-1.50', 'flotant', 'rosa', 'transparent', 'transparent', 230.00, null, 1);

-- TAULA VENDA








