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
  `color_vidre` VARCHAR(45) NOT NULL,
  `preu` DOUBLE NULL,
  `id_marca` INT NOT NULL,
  PRIMARY KEY (`id_ullera`, `id_marca`),
  INDEX `fk_ULLERA_MARCA2_idx` (`id_marca` ASC) ,
  CONSTRAINT `fk_ULLERA_MARCA2`
    FOREIGN KEY (`id_marca`)
    REFERENCES `n1exercici1_optica`.`MARCA` (`id_marca`)
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
  `preu_total` DOUBLE NULL,
  `data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `id_client` INT NOT NULL,
  `id_empleat` INT NOT NULL,
  `id_ullera` INT NOT NULL,
  PRIMARY KEY (`id_venda`, `id_client`, `id_empleat`, `id_ullera`),
  INDEX `fk_VENDA_CLIENT1_idx` (`id_client` ASC) ,
  INDEX `fk_VENDA_EMPLEAT1_idx` (`id_empleat` ASC) ,
  INDEX `fk_VENDA_ULLERA1_idx` (`id_ullera` ASC) ,
  CONSTRAINT `fk_VENDA_CLIENT1`
    FOREIGN KEY (`id_client`)
    REFERENCES `n1exercici1_optica`.`CLIENT` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENDA_EMPLEAT1`
    FOREIGN KEY (`id_empleat`)
    REFERENCES `n1exercici1_optica`.`EMPLEAT` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENDA_ULLERA1`
    FOREIGN KEY (`id_ullera`)
    REFERENCES `n1exercici1_optica`.`ULLERA` (`id_ullera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



