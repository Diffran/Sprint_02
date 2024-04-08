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


-- -----------------------------------------------------
-- Data for table `n1exercici1_optica`.`PAIS`
-- -----------------------------------------------------
START TRANSACTION;
USE `n1exercici1_optica`;
INSERT INTO `n1exercici1_optica`.`PAIS` (`id_pais`, `nom`) VALUES (1, 'ESPANYA');
INSERT INTO `n1exercici1_optica`.`PAIS` (`id_pais`, `nom`) VALUES (2 , 'FRANÇA');
INSERT INTO `n1exercici1_optica`.`PAIS` (`id_pais`, `nom`) VALUES (3, 'PORTUGAL');

COMMIT;


-- -----------------------------------------------------
-- Data for table `n1exercici1_optica`.`ADREÇA`
-- -----------------------------------------------------
START TRANSACTION;
USE `n1exercici1_optica`;
INSERT INTO `n1exercici1_optica`.`ADREÇA` (`id_adreça`, `carrer`, `numero`, `piso`, `puerta`, `ciudad`, `codi_postal`, `id_pais`) VALUES (1, 'carrer 1', 1, 1, 1, 'BARCELONA', 08025, 1);
INSERT INTO `n1exercici1_optica`.`ADREÇA` (`id_adreça`, `carrer`, `numero`, `piso`, `puerta`, `ciudad`, `codi_postal`, `id_pais`) VALUES (2, 'carrer2', 2, 2, 2, 'PARIS', 15466, 2);
INSERT INTO `n1exercici1_optica`.`ADREÇA` (`id_adreça`, `carrer`, `numero`, `piso`, `puerta`, `ciudad`, `codi_postal`, `id_pais`) VALUES (3, 'carrer3', 3, 3, 3, 'MADRID', 33333, 1);
INSERT INTO `n1exercici1_optica`.`ADREÇA` (`id_adreça`, `carrer`, `numero`, `piso`, `puerta`, `ciudad`, `codi_postal`, `id_pais`) VALUES (4, 'carrer4', 4, 4, 4, 'LISBOA', 44444, 3);
INSERT INTO `n1exercici1_optica`.`ADREÇA` (`id_adreça`, `carrer`, `numero`, `piso`, `puerta`, `ciudad`, `codi_postal`, `id_pais`) VALUES (5, 'carrer5', 5, 5, 5, 'BARCELONA', 55555, 1);
INSERT INTO `n1exercici1_optica`.`ADREÇA` (`id_adreça`, `carrer`, `numero`, `piso`, `puerta`, `ciudad`, `codi_postal`, `id_pais`) VALUES (6, 'carrer6', 6, 6, 6, 'BARCELONA', 66666, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `n1exercici1_optica`.`PROVEIDOR`
-- -----------------------------------------------------
START TRANSACTION;
USE `n1exercici1_optica`;
INSERT INTO `n1exercici1_optica`.`PROVEIDOR` (`id_proveidor`, `nom`, `Telefon`, `Fax`, `NIF`, `id_adreça`) VALUES (1, 'PROVEIDOR_1', 1234567, 1123456, '1324567D', 1);
INSERT INTO `n1exercici1_optica`.`PROVEIDOR` (`id_proveidor`, `nom`, `Telefon`, `Fax`, `NIF`, `id_adreça`) VALUES (2, 'PROVEIDOR_2', 5647892, 3264785, '4685452P', 2);
INSERT INTO `n1exercici1_optica`.`PROVEIDOR` (`id_proveidor`, `nom`, `Telefon`, `Fax`, `NIF`, `id_adreça`) VALUES (3, 'PROVEIDOR_3', 4567896, 5864852, '4123764L', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `n1exercici1_optica`.`CLIENT`
-- -----------------------------------------------------
START TRANSACTION;
USE `n1exercici1_optica`;
INSERT INTO `n1exercici1_optica`.`CLIENT` (`id_client`, `nom`, `telefon`, `correu_electronic`, `data_registre`, `client_recomana`, `id_adreça`) VALUES (1, 'Jose', 4564789, 'fhjdhf@jkf.com', NULL, NULL, 4);
INSERT INTO `n1exercici1_optica`.`CLIENT` (`id_client`, `nom`, `telefon`, `correu_electronic`, `data_registre`, `client_recomana`, `id_adreça`) VALUES (2, 'Martina', 4546556, 'fdas@gmail.com', NULL, 1, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `n1exercici1_optica`.`EMPLEAT`
-- -----------------------------------------------------
START TRANSACTION;
USE `n1exercici1_optica`;
INSERT INTO `n1exercici1_optica`.`EMPLEAT` (`id_empleat`, `nom`, `id_adreça`) VALUES (1, 'Ramon', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `n1exercici1_optica`.`VENDA`
-- -----------------------------------------------------
START TRANSACTION;
USE `n1exercici1_optica`;
INSERT INTO `n1exercici1_optica`.`VENDA` (`id_venda`, `preu`, `id_client`, `id_empleat`) VALUES (1, 67, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `n1exercici1_optica`.`MARCA`
-- -----------------------------------------------------
START TRANSACTION;
USE `n1exercici1_optica`;
INSERT INTO `n1exercici1_optica`.`MARCA` (`id_marca`, `nom`, `id_proveidor`) VALUES (1, 'rayban', 1);
INSERT INTO `n1exercici1_optica`.`MARCA` (`id_marca`, `nom`, `id_proveidor`) VALUES (2, 'tous', 1);
INSERT INTO `n1exercici1_optica`.`MARCA` (`id_marca`, `nom`, `id_proveidor`) VALUES (3, 'BG', 2);
INSERT INTO `n1exercici1_optica`.`MARCA` (`id_marca`, `nom`, `id_proveidor`) VALUES (4, 'XX', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `n1exercici1_optica`.`ULLERA`
-- -----------------------------------------------------
START TRANSACTION;
USE `n1exercici1_optica`;
INSERT INTO `n1exercici1_optica`.`ULLERA` (`id_ullera`, `graduacio_izq`, `graduacio_der`, `muntura`, `color_muntura`, `color_vidre_der`, `color_vidre_izq`, `preu`, `id_venda`, `id_marca`, `id_proveidor`) VALUES (1, '3', '1', 'flotant', 'verd', 'no', 'no', 67, 1, 2, 1);

COMMIT;

