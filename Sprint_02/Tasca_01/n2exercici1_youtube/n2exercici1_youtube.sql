-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema n2exercici1_youtube
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `n2exercici1_youtube` ;

-- -----------------------------------------------------
-- Schema n2exercici1_youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `n2exercici1_youtube` DEFAULT CHARACTER SET utf8 ;
USE `n2exercici1_youtube` ;

-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`PAIS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`PAIS` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`PAIS` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`ADREÇA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`ADREÇA` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`ADREÇA` (
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
    REFERENCES `n2exercici1_youtube`.`PAIS` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`PROVEIDOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`PROVEIDOR` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`PROVEIDOR` (
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
    REFERENCES `n2exercici1_youtube`.`ADREÇA` (`id_adreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`CLIENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`CLIENT` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`CLIENT` (
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
    REFERENCES `n2exercici1_youtube`.`CLIENT` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENT_ADREÇA1`
    FOREIGN KEY (`id_adreça`)
    REFERENCES `n2exercici1_youtube`.`ADREÇA` (`id_adreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`EMPLEAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`EMPLEAT` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`EMPLEAT` (
  `id_empleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `id_adreça` INT NOT NULL,
  PRIMARY KEY (`id_empleat`, `id_adreça`),
  INDEX `fk_EMPLEAT_ADREÇA1_idx` (`id_adreça` ASC) ,
  CONSTRAINT `fk_EMPLEAT_ADREÇA1`
    FOREIGN KEY (`id_adreça`)
    REFERENCES `n2exercici1_youtube`.`ADREÇA` (`id_adreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`VENDA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`VENDA` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`VENDA` (
  `id_venda` INT NOT NULL AUTO_INCREMENT,
  `preu` DOUBLE NOT NULL,
  `id_client` INT NOT NULL,
  `id_empleat` INT NOT NULL,
  PRIMARY KEY (`id_venda`, `id_client`, `id_empleat`),
  INDEX `fk_VENDA_CLIENT1_idx` (`id_client` ASC) ,
  INDEX `fk_VENDA_EMPLEAT1_idx` (`id_empleat` ASC) ,
  CONSTRAINT `fk_VENDA_CLIENT1`
    FOREIGN KEY (`id_client`)
    REFERENCES `n2exercici1_youtube`.`CLIENT` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENDA_EMPLEAT1`
    FOREIGN KEY (`id_empleat`)
    REFERENCES `n2exercici1_youtube`.`EMPLEAT` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`MARCA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`MARCA` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`MARCA` (
  `id_marca` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `id_proveidor` INT NOT NULL,
  PRIMARY KEY (`id_marca`, `id_proveidor`),
  INDEX `fk_MARCA_PROVEIDOR1_idx` (`id_proveidor` ASC) ,
  CONSTRAINT `fk_MARCA_PROVEIDOR1`
    FOREIGN KEY (`id_proveidor`)
    REFERENCES `n2exercici1_youtube`.`PROVEIDOR` (`id_proveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`ULLERA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`ULLERA` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`ULLERA` (
  `id_ullera` INT NOT NULL AUTO_INCREMENT,
  `graduacio_izq` VARCHAR(45) NULL,
  `graduacio_der` VARCHAR(45) NULL,
  `muntura` ENUM('flotant', 'pasta', 'metalica') NOT NULL,
  `color_muntura` VARCHAR(45) NOT NULL,
  `color_vidre` VARCHAR(45) NOT NULL,
  `preu` DOUBLE NULL,
  `id_venda` INT NOT NULL,
  `id_marca` INT NOT NULL,
  `id_proveidor` INT NOT NULL,
  PRIMARY KEY (`id_ullera`, `id_marca`, `id_proveidor`, `id_venda`),
  INDEX `fk_ULLERA_VENDA1_idx` (`id_venda` ASC) ,
  INDEX `fk_ULLERA_MARCA2_idx` (`id_marca` ASC, `id_proveidor` ASC) ,
  CONSTRAINT `fk_ULLERA_VENDA1`
    FOREIGN KEY (`id_venda`)
    REFERENCES `n2exercici1_youtube`.`VENDA` (`id_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ULLERA_MARCA2`
    FOREIGN KEY (`id_marca` , `id_proveidor`)
    REFERENCES `n2exercici1_youtube`.`MARCA` (`id_marca` , `id_proveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`USUARI`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`USUARI` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`USUARI` (
  `id_usuari` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `naixament` DATE NOT NULL,
  `sexe` ENUM('M', 'H') NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `codi_postal` INT NOT NULL,
  PRIMARY KEY (`id_usuari`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`VIDEO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`VIDEO` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`VIDEO` (
  `id_video` INT NOT NULL,
  `titol` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(200) NULL,
  `grandaria` INT NOT NULL,
  `nom_arxiu` VARCHAR(45) NOT NULL,
  `durada` VARCHAR(45) NOT NULL,
  `thumbnail` BLOB NOT NULL,
  `num_reproduccions` INT NOT NULL,
  `num_likes` INT NOT NULL,
  `num_dislikes` INT NOT NULL,
  `estat` ENUM('public', 'ocult', 'privat') NULL,
  PRIMARY KEY (`id_video`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`ETIQUETA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`ETIQUETA` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`ETIQUETA` (
  `id_etiqueta` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `id_video` INT NOT NULL,
  PRIMARY KEY (`id_etiqueta`, `id_video`),
  INDEX `fk_ETIQUETA_VIDEO1_idx` (`id_video` ASC) ,
  CONSTRAINT `fk_ETIQUETA_VIDEO1`
    FOREIGN KEY (`id_video`)
    REFERENCES `n2exercici1_youtube`.`VIDEO` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`CANAL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`CANAL` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`CANAL` (
  `id_canal` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(200) NULL,
  `data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuari` INT NOT NULL,
  PRIMARY KEY (`id_canal`, `id_usuari`),
  INDEX `fk_CANAL_USUARI1_idx` (`id_usuari` ASC) ,
  CONSTRAINT `fk_CANAL_USUARI1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `n2exercici1_youtube`.`USUARI` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`REVIEW_VIDEO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`REVIEW_VIDEO` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`REVIEW_VIDEO` (
  `id_usuari` INT NOT NULL,
  `id_video` INT NOT NULL,
  `opinion` ENUM('LIKE', 'DISLIKE') NOT NULL,
  `date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuari`, `id_video`),
  INDEX `fk_USUARI_has_VIDEO_VIDEO1_idx` (`id_video` ASC) ,
  INDEX `fk_USUARI_has_VIDEO_USUARI1_idx` (`id_usuari` ASC) ,
  CONSTRAINT `fk_USUARI_has_VIDEO_USUARI1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `n2exercici1_youtube`.`USUARI` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARI_has_VIDEO_VIDEO1`
    FOREIGN KEY (`id_video`)
    REFERENCES `n2exercici1_youtube`.`VIDEO` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`SUBSCRIPCIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`SUBSCRIPCIO` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`SUBSCRIPCIO` (
  `id_canal` INT NOT NULL,
  `id_usuari` INT NOT NULL,
  PRIMARY KEY (`id_canal`, `id_usuari`),
  INDEX `fk_CANAL_has_USUARI_USUARI1_idx` (`id_usuari` ASC) ,
  INDEX `fk_CANAL_has_USUARI_CANAL1_idx` (`id_canal` ASC) ,
  CONSTRAINT `fk_CANAL_has_USUARI_CANAL1`
    FOREIGN KEY (`id_canal`)
    REFERENCES `n2exercici1_youtube`.`CANAL` (`id_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CANAL_has_USUARI_USUARI1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `n2exercici1_youtube`.`USUARI` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`COMENTARI`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`COMENTARI` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`COMENTARI` (
  `id_comentari` INT NOT NULL,
  `text` VARCHAR(200) NOT NULL,
  `data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuari` INT NOT NULL,
  `id_video` INT NOT NULL,
  PRIMARY KEY (`id_comentari`, `id_usuari`, `id_video`),
  INDEX `fk_COMENTARI_USUARI1_idx` (`id_usuari` ASC) ,
  INDEX `fk_COMENTARI_VIDEO1_idx` (`id_video` ASC) ,
  CONSTRAINT `fk_COMENTARI_USUARI1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `n2exercici1_youtube`.`USUARI` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMENTARI_VIDEO1`
    FOREIGN KEY (`id_video`)
    REFERENCES `n2exercici1_youtube`.`VIDEO` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`PUBLICACIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`PUBLICACIO` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`PUBLICACIO` (
  `id_usuari` INT NOT NULL,
  `id_video` INT NOT NULL,
  `data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuari`, `id_video`),
  INDEX `fk_USUARI_has_VIDEO_VIDEO2_idx` (`id_video` ASC) ,
  INDEX `fk_USUARI_has_VIDEO_USUARI2_idx` (`id_usuari` ASC) ,
  CONSTRAINT `fk_USUARI_has_VIDEO_USUARI2`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `n2exercici1_youtube`.`USUARI` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARI_has_VIDEO_VIDEO2`
    FOREIGN KEY (`id_video`)
    REFERENCES `n2exercici1_youtube`.`VIDEO` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`PLAYLIST`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`PLAYLIST` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`PLAYLIST` (
  `id_playlist` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `estat` ENUM('publica', 'privada') NOT NULL,
  `id_usuari` INT NOT NULL,
  PRIMARY KEY (`id_playlist`, `id_usuari`),
  INDEX `fk_PLAYLIST_USUARI1_idx` (`id_usuari` ASC) ,
  CONSTRAINT `fk_PLAYLIST_USUARI1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `n2exercici1_youtube`.`USUARI` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`PLAYLIST_has_VIDEO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`PLAYLIST_has_VIDEO` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`PLAYLIST_has_VIDEO` (
  `id_playlist` INT NOT NULL,
  `id_videa` INT NOT NULL,
  PRIMARY KEY (`id_playlist`, `id_videa`),
  INDEX `fk_PLAYLIST_has_VIDEO_VIDEO1_idx` (`id_videa` ASC) ,
  INDEX `fk_PLAYLIST_has_VIDEO_PLAYLIST1_idx` (`id_playlist` ASC) ,
  CONSTRAINT `fk_PLAYLIST_has_VIDEO_PLAYLIST1`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `n2exercici1_youtube`.`PLAYLIST` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLAYLIST_has_VIDEO_VIDEO1`
    FOREIGN KEY (`id_videa`)
    REFERENCES `n2exercici1_youtube`.`VIDEO` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`REVIEW_COMMENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1_youtube`.`REVIEW_COMMENT` ;

CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`REVIEW_COMMENT` (
  `id_usuari` INT NOT NULL,
  `id_comentari` INT NOT NULL,
  `opinio` ENUM('LIKE', 'DISLIKE') NOT NULL,
  `data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuari`, `id_comentari`),
  INDEX `fk_USUARI_has_COMENTARI_COMENTARI1_idx` (`id_comentari` ASC) ,
  INDEX `fk_USUARI_has_COMENTARI_USUARI1_idx` (`id_usuari` ASC) ,
  CONSTRAINT `fk_USUARI_has_COMENTARI_USUARI1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `n2exercici1_youtube`.`USUARI` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARI_has_COMENTARI_COMENTARI1`
    FOREIGN KEY (`id_comentari`)
    REFERENCES `n2exercici1_youtube`.`COMENTARI` (`id_comentari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

