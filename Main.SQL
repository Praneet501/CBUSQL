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
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`user_type` (
  `user_type_id` INT NOT NULL,
  `user_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_type_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`freelance_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`freelance_account` (
  `freelance_id` INT NOT NULL,
  `user_type_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `gender` VARCHAR(45) NULL,
  `contact_number` INT NULL,
  PRIMARY KEY (`freelance_id`),
  INDEX `user_type_id_idx` (`user_type_id` ASC) VISIBLE,
  CONSTRAINT `user_type_id`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `JOB_PORTAL`.`user_type` (`user_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`service` (
  `service_id` INT NOT NULL,
  `category` VARCHAR(45) NULL,
  `service_name` VARCHAR(45) NULL,
  `service_description` VARCHAR(45) NULL,
  `createdby` VARCHAR(45) NULL,
  `created_date` VARCHAR(45) NULL,
  `updatedby` VARCHAR(45) NULL,
  `updated_date` VARCHAR(45) NULL,
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`freelance_services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`freelance_services` (
  `freelance_service_id` INT NOT NULL,
  `freelance_id` INT NULL,
  `salary_per_hour` VARCHAR(45) NULL,
  `background_verified` BINARY(10) NULL,
  `is_available` BINARY(10) NULL,
  `service_location` VARCHAR(45) NULL,
  `job_title` VARCHAR(45) NULL,
  `service_description` VARCHAR(45) NULL,
  `service_id` INT NULL,
  `price` VARCHAR(45) NULL,
  `rating` DECIMAL(10) NULL,
  `discount` DECIMAL(10) NULL,
  PRIMARY KEY (`freelance_service_id`),
  INDEX `solutions_id_idx` (`service_id` ASC) VISIBLE,
  CONSTRAINT `solutions_id`
    FOREIGN KEY (`service_id`)
    REFERENCES `JOB_PORTAL`.`service` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`education` (
  `education_id` INT NOT NULL,
  `freelance_id` INT NULL,
  `university` VARCHAR(45) NULL,
  `degree_name` VARCHAR(45) NULL,
  `major_subject` VARCHAR(45) NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `cgpa` DECIMAL(20) NULL,
  PRIMARY KEY (`education_id`),
  INDEX `user_account_id_idx` (`freelance_id` ASC) VISIBLE,
  CONSTRAINT `user_account_id`
    FOREIGN KEY (`freelance_id`)
    REFERENCES `JOB_PORTAL`.`freelance_account` (`freelance_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`experience` (
  `experience_id` INT NOT NULL,
  `freelance_id` INT NULL,
  `current_job_title` VARCHAR(45) NULL,
  `total_experience` DECIMAL(25) NULL,
  `feedback_rating` DECIMAL NULL,
  `recent_start_date` DATE NULL,
  `recent_end_date` DATE NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`experience_id`),
  INDEX `user_account_id_idx` (`freelance_id` ASC) VISIBLE,
  CONSTRAINT `user_account_id`
    FOREIGN KEY (`freelance_id`)
    REFERENCES `JOB_PORTAL`.`freelance_account` (`freelance_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`company_profile`
-- -----------------------------------------------------
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
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`job_status` (
  `job_id` INT NOT NULL,
  `freelance_service_id` INT NULL,
  `company_id` INT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `time_period` INT NULL,
  `in_progress` VARCHAR(45) NULL,
  `payment_done` VARCHAR(45) NULL,
  PRIMARY KEY (`job_id`),
  INDEX `company_id_idx` (`company_id` ASC) VISIBLE,
  INDEX `worker_data_id_idx` (`freelance_service_id` ASC) VISIBLE,
  CONSTRAINT `company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `JOB_PORTAL`.`company_profile` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `worker_data_id`
    FOREIGN KEY (`freelance_service_id`)
    REFERENCES `JOB_PORTAL`.`freelance_services` (`freelance_service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `JOB_PORTAL`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JOB_PORTAL`.`reviews` (
  `review_id` INT NOT NULL,
  `job_id` INT NULL,
  `rating` DECIMAL(2,1) NULL,
  `comments` NVARCHAR(500) NULL,
  `posted_date` DATETIME NULL,
  `updated_date` DATETIME NULL,
  `is_deleted` TINYINT NULL,
  `like` INT NULL,
  `dislike` INT NULL,
  PRIMARY KEY (`review_id`),
  INDEX `job_id_idx` (`job_id` ASC) VISIBLE,
  CONSTRAINT `job_id`
    FOREIGN KEY (`job_id`)
    REFERENCES `JOB_PORTAL`.`job_status` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

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
USE `JOB_PORTAL`;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
