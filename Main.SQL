-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema JOB_PORTAL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema JOB_PORTAL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `JOB_PORTAL` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `JOB_PORTAL` ;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`user_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`user_type` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`user_type` (
  `user_type_id` INT NOT NULL,
  `user_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_type_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`freelance_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`freelance_account` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`freelance_account` (
  `user_account_id` INT NOT NULL,
  `user_type_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `gender` VARCHAR(45) NULL,
  `contact_number` INT NULL,
  PRIMARY KEY (`user_account_id`),
  CONSTRAINT `user_type_id`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `JOB_PORTAL`.`user_type` (`user_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `user_type_id_idx` ON `JOB_PORTAL`.`freelance_account` (`user_type_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`worker_data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`worker_data` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`worker_data` (
  `worker_data_id` INT NOT NULL,
  `user_account_id` INT NULL,
  `salary_per_hour` VARCHAR(45) NULL,
  `background_verified` BINARY(10) NULL,
  `is_available` BINARY(10) NULL,
  `service_location` VARCHAR(45) NULL,
  `job_title` VARCHAR(45) NULL,
  `service_description` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  `rating` DECIMAL(10) NULL,
  `discount` DECIMAL(10) NULL,
  PRIMARY KEY (`worker_data_id`),
  CONSTRAINT `user_account_id`
    FOREIGN KEY (`user_account_id`)
    REFERENCES `JOB_PORTAL`.`freelance_account` (`user_account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `user_account_id_idx` ON `JOB_PORTAL`.`worker_data` (`user_account_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`worker_skill_set`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`worker_skill_set` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`worker_skill_set` (
  `worker_skill_set_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  `skill_level` INT NULL,
  PRIMARY KEY (`worker_skill_set_id`, `skill_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`worker_education`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`worker_education` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`worker_education` (
  `worker_education_id` INT NOT NULL,
  `user_account_id` INT NULL,
  `university` VARCHAR(45) NULL,
  `degree_name` VARCHAR(45) NULL,
  `major_subject` VARCHAR(45) NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `cgpa` DECIMAL(20) NULL,
  PRIMARY KEY (`worker_education_id`),
  CONSTRAINT `user_account_id`
    FOREIGN KEY (`user_account_id`)
    REFERENCES `JOB_PORTAL`.`freelance_account` (`user_account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `user_account_id_idx` ON `JOB_PORTAL`.`worker_education` (`user_account_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`worker_experience`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`worker_experience` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`worker_experience` (
  `worker_experience_id` INT NOT NULL,
  `user_account_id` INT NULL,
  `current_job_title` VARCHAR(45) NULL,
  `total_experience` DECIMAL(25) NULL,
  `feedback_rating` DECIMAL NULL,
  `recent_start_date` DATE NULL,
  `recent_end_date` DATE NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`worker_experience_id`),
  CONSTRAINT `user_account_id`
    FOREIGN KEY (`user_account_id`)
    REFERENCES `JOB_PORTAL`.`freelance_account` (`user_account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `user_account_id_idx` ON `JOB_PORTAL`.`worker_experience` (`user_account_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`requirement_post_skill_set`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`requirement_post_skill_set` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`requirement_post_skill_set` (
  `skill_id` INT NOT NULL,
  `requirement_post_id` INT NOT NULL,
  `experience_level` VARCHAR(45) NULL,
  PRIMARY KEY (`skill_id`, `requirement_post_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`requirement_post_activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`requirement_post_activity` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`requirement_post_activity` (
  `requirement_post_activity_id` INT NOT NULL,
  `requirement _post_id` INT NOT NULL,
  `requirement_post_date` INT NULL,
  PRIMARY KEY (`requirement_post_activity_id`, `requirement _post_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`requirement_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`requirement_post` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`requirement_post` (
  `requirement_post_id` INT NOT NULL,
  `company_id` INT NULL,
  `job_description` VARCHAR(45) NULL,
  `job_location` VARCHAR(45) NULL,
  `skill_required` VARCHAR(45) NULL,
  `experience_required` VARCHAR(45) NULL,
  PRIMARY KEY (`requirement_post_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`company_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`company_profile` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`company_profile` (
  `company_id` INT NOT NULL,
  `company_name` VARCHAR(45) NULL,
  `company_description` VARCHAR(45) NULL,
  `sector_detail` VARCHAR(45) NULL,
  `company_website` VARCHAR(45) NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`job_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`job_status` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`job_status` (
  `job_id` INT NOT NULL,
  `worker_data_id` INT NULL,
  `company_id` INT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `time_period` INT NULL,
  `in_progress` VARCHAR(45) NULL,
  `payment_done` VARCHAR(45) NULL,
  PRIMARY KEY (`job_id`),
  CONSTRAINT `company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `JOB_PORTAL`.`company_profile` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `worker_data_id`
    FOREIGN KEY (`worker_data_id`)
    REFERENCES `JOB_PORTAL`.`worker_data` (`worker_data_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `company_id_idx` ON `JOB_PORTAL`.`job_status` (`company_id` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `worker_data_id_idx` ON `JOB_PORTAL`.`job_status` (`worker_data_id` ASC) VISIBLE;

SHOW WARNINGS;
USE `JOB_PORTAL` ;

-- -----------------------------------------------------
-- Placeholder table for view `JOB_PORTAL`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`view1` (`id` INT);
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `JOB_PORTAL`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JOB_PORTAL`.`view1`;
SHOW WARNINGS;
DROP VIEW IF EXISTS `JOB_PORTAL`.`view1` ;
SHOW WARNINGS;
USE `JOB_PORTAL`;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
