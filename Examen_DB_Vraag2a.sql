-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `idpatient` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL,
  `sex` ENUM('Male', 'Female') NULL,
  `age_diagnosis` INT NULL,
  `syndrome` VARCHAR(45) NULL,
  `syndrome_info` TEXT NULL,
  PRIMARY KEY (`idpatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gene` (
  `idgene` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` CHAR(2) NULL,
  `gene_info` TEXT NULL,
  PRIMARY KEY (`idgene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mutation` (
  `idmutation` INT UNSIGNED NOT NULL,
  `patient` INT UNSIGNED NULL,
  `Gene` INT UNSIGNED NULL,
  PRIMARY KEY (`idmutation`),
  INDEX `patient_idx` (`patient` ASC),
  INDEX `gene_idx` (`Gene` ASC),
  CONSTRAINT `patient`
    FOREIGN KEY (`patient`)
    REFERENCES `mydb`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `gene`
    FOREIGN KEY (`Gene`)
    REFERENCES `mydb`.`gene` (`idgene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
