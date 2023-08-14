-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema boxing_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema boxing_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `boxing_db` DEFAULT CHARACTER SET utf8 ;
USE `boxing_db` ;

-- -----------------------------------------------------
-- Table `boxing_db`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boxing_db`.`country` (
  `countryID` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NULL,
  PRIMARY KEY (`countryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boxing_db`.`stance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boxing_db`.`stance` (
  `stanceID` INT NOT NULL AUTO_INCREMENT,
  `stance_name` VARCHAR(45) NULL,
  PRIMARY KEY (`stanceID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boxing_db`.`fighter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boxing_db`.`fighter` (
  `fighterID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `stanceID` INT NULL,
  `age_2022` INT NULL,
  `height` FLOAT NULL,
  `reach` FLOAT NULL,
  `countryID` INT NULL,
  PRIMARY KEY (`fighterID`),
  INDEX `countryID_idx` (`countryID` ASC) VISIBLE,
  INDEX `stanceID_idx` (`stanceID` ASC) VISIBLE,
  CONSTRAINT `countryID`
    FOREIGN KEY (`countryID`)
    REFERENCES `boxing_db`.`country` (`countryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `stanceID`
    FOREIGN KEY (`stanceID`)
    REFERENCES `boxing_db`.`stance` (`stanceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boxing_db`.`fighter_record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boxing_db`.`fighter_record` (
  `fighterID` INT NOT NULL,
  `wins` INT NULL,
  `losses` INT NULL,
  `draws` INT NULL,
  `ko_rate` FLOAT NULL,
  PRIMARY KEY (`fighterID`),
  CONSTRAINT `fighterID`
    FOREIGN KEY (`fighterID`)
    REFERENCES `boxing_db`.`fighter` (`fighterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boxing_db`.`win_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boxing_db`.`win_type` (
  `win_typeID` INT NOT NULL AUTO_INCREMENT,
  `win_type_name` VARCHAR(45) NULL,
  PRIMARY KEY (`win_typeID`),
  UNIQUE INDEX `win_type_name_UNIQUE` (`win_type_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boxing_db`.`fight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boxing_db`.`fight` (
  `fighterID_op1` INT NOT NULL,
  `fighterID_op2` INT NOT NULL,
  `date` DATE NOT NULL,
  `fighterID_winner` INT NULL,
  `round` INT NULL,
  `win_typeID` INT NULL,
  `op_1_punch_power` INT NULL,
  `op_2_punch_power` INT NULL,
  `op_1_punch_resistance` FLOAT NULL,
  `op_2_punch_resistance` FLOAT NULL,
  `op_1_durability` INT NULL,
  `op_2_durability` INT NULL,
  `op_1_round_KO_percentage` FLOAT NULL,
  `op_2_round_KO_percentage` FLOAT NULL,
  `op_1_been_KOed_percentage` FLOAT NULL,
  `op_2_been_KOed_percentage` FLOAT NULL,
  `op_1_avg_weight` FLOAT NULL,
  `op_2_avg_weight` FLOAT NULL,
  `op_1_age_at_fight` INT NULL,
  `op_2_age_at_fight` INT NULL,
  PRIMARY KEY (`fighterID_op1`, `fighterID_op2`, `date`),
  INDEX `fighterID_op2_idx` (`fighterID_op2` ASC) VISIBLE,
  INDEX `fighterID_winner_idx` (`fighterID_winner` ASC) VISIBLE,
  INDEX `win_typeID_idx` (`win_typeID` ASC) VISIBLE,
  CONSTRAINT `fighterID_op1`
    FOREIGN KEY (`fighterID_op1`)
    REFERENCES `boxing_db`.`fighter` (`fighterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fighterID_op2`
    FOREIGN KEY (`fighterID_op2`)
    REFERENCES `boxing_db`.`fighter` (`fighterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fighterID_winner`
    FOREIGN KEY (`fighterID_winner`)
    REFERENCES `boxing_db`.`fighter` (`fighterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `win_typeID`
    FOREIGN KEY (`win_typeID`)
    REFERENCES `boxing_db`.`win_type` (`win_typeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
