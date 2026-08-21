-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_events
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_events
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_events` DEFAULT CHARACTER SET utf8 ;
USE `db_events` ;

-- -----------------------------------------------------
-- Table `db_events`.`tbl_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_events`.`tbl_user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NULL,
  `user_email` VARCHAR(255) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_events`.`tbl_conference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_events`.`tbl_conference` (
  `id_conference` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `address` VARCHAR(255) NULL,
  PRIMARY KEY (`id_conference`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_events`.`tbl_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_events`.`tbl_session` (
  `session_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `start_date` DATE NULL,
  `start_time` TIME NULL,
  `tbl_conference_id_conference` INT NOT NULL,
  PRIMARY KEY (`session_id`),
  INDEX `fk_tbl_session_tbl_conference1_idx` (`tbl_conference_id_conference` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_session_tbl_conference1`
    FOREIGN KEY (`tbl_conference_id_conference`)
    REFERENCES `db_events`.`tbl_conference` (`id_conference`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_events`.`tbl_subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_events`.`tbl_subscription` (
  `subscribed_user_id` INT NOT NULL,
  `session_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `level` INT NULL,
  `unique_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`subscribed_user_id`, `session_id`),
  INDEX `fk_tbl_subscription_tbl_user_idx` (`subscribed_user_id` ASC) VISIBLE,
  INDEX `fk_tbl_subscription_tbl_session1_idx` (`session_id` ASC) VISIBLE,
  UNIQUE INDEX `unique_id_UNIQUE` (`unique_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_subscription_tbl_user`
    FOREIGN KEY (`subscribed_user_id`)
    REFERENCES `db_events`.`tbl_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_subscription_tbl_session1`
    FOREIGN KEY (`session_id`)
    REFERENCES `db_events`.`tbl_session` (`session_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
