SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `streams`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `streams` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `courses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `courses` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `stream_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `courses.stream_id` (`stream_id` ASC) ,
  CONSTRAINT `courses.stream_id`
    FOREIGN KEY (`stream_id` )
    REFERENCES `streams` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instructors`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `instructors` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL ,
  `homepage` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `offerings`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `offerings` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `course_id` INT NOT NULL ,
  `start_date` DATE NULL ,
  `end_date` DATE NULL ,
  `exact_dates_know` TINYINT(1)  NULL ,
  `created` TIMESTAMP NULL ,
  `modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) ,
  INDEX `offerings.course_id` (`course_id` ASC) ,
  CONSTRAINT `offerings.course_id`
    FOREIGN KEY (`course_id` )
    REFERENCES `courses` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `courses_instructors`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `courses_instructors` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `course_id` INT NOT NULL ,
  `instructor_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `courses_instructors.course_id` (`course_id` ASC) ,
  INDEX `courses_instructors.instructor_id` (`instructor_id` ASC) ,
  CONSTRAINT `courses_instructors.course_id`
    FOREIGN KEY (`course_id` )
    REFERENCES `courses` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `courses_instructors.instructor_id`
    FOREIGN KEY (`instructor_id` )
    REFERENCES `instructors` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DELIMITER $$


CREATE TRIGGER offerings_OnInsert BEFORE INSERT ON `offerings`
    FOR EACH ROW SET NEW.created = IFNULL(NEW.created, NOW());

$$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
