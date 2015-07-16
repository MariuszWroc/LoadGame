SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `databaseInstance` ;
CREATE SCHEMA IF NOT EXISTS `databaseInstance` DEFAULT CHARACTER SET utf8 ;
USE `databaseInstance` ;

-- -------------------------------------------------------
-- Table `databaseInstance`.`user_roles`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`role`(
    `idRole` INT(11) NOT NULL,
    `role_name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idRole`))
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `databaseInstance`.`clubs_dictionary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`clubs_dictionary`(
    `idClub` INT(11) NOT NULL,
    `club_name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idClub`))
    ENGINE = InnoDB;

-- -------------------------------------------------------
-- Table `databaseInstance`.`users`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`user`(
	`idUser` INT(11) NOT NULL,
	`first_name` VARCHAR(30) NULL,
	`second_name` VARCHAR(40) NULL,
	`login` VARCHAR(50) NULL,
	`password` VARCHAR(20) NULL,
	`enabled` INT(1) NOT NULL DEFAULT 1,
        `role_idRole` INT(11) NULL,
	PRIMARY KEY (`idUser`),
            INDEX `fk_user_role_idx` (`role_idRole` ASC),
            CONSTRAINT `fk_user_role`
              FOREIGN KEY (`role_idRole`)
              REFERENCES `databaseInstance`.`role` (`idRole`)
              ON DELETE NO ACTION
              ON UPDATE NO ACTION)
          ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`game` (
	`idGame` INT(11) NOT NULL,
	`game_code` INT(11) NOT NULL,
	`session_id` VARCHAR(45) NULL,
        `game_name` VARCHAR(45) NULL,
	`user_status` INT(1) NULL DEFAULT 0,
	`clubs_dictionary_idClub` INT(11) NULL,
	`user_idUser` INT(11) NOT NULL,
	PRIMARY KEY (`idGame`),
	INDEX `fk_game_clubs_dictionary_idx` (`clubs_dictionary_idClub` ASC),
	INDEX `fk_game_user1_idx` (`user_idUser` ASC),
	CONSTRAINT `fk_game_clubs_dictionary`
	FOREIGN KEY (`clubs_dictionary_idClub`)
	REFERENCES `databaseInstance`.`clubs_dictionary` (`idClub`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT `fk_game_user1`
	FOREIGN KEY (`user_idUser`)
	REFERENCES `databaseInstance`.`user` (`idUser`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `databaseInstance`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`role` (`idRole`, `role_name`) VALUES (1, 'ROLE_ADMIN');
INSERT INTO `databaseInstance`.`role` (`idRole`, `role_name`) VALUES (2, 'ROLE_USER');
INSERT INTO `databaseInstance`.`role` (`idRole`, `role_name`) VALUES (3, 'ROLE_CODER');

COMMIT;

-- -----------------------------------------------------
-- Data for table `databaseInstance`.`clubs_dictionary`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`clubs_dictionary` (`idClub`, `club_name`) VALUES (1, 'Śląsk Wrocław');
INSERT INTO `databaseInstance`.`clubs_dictionary` (`idClub`, `club_name`) VALUES (2, 'Legia Warszawa');

COMMIT;

-- -----------------------------------------------------
-- Data for table `databaseInstance`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`user` (`idUser`, `first_name`, `second_name`, `login`, `password`, `enabled`, `role_idRole`) VALUES (1, 'Mariusz', 'Czarny', 'mczarny', '123', 1, 1);
INSERT INTO `databaseInstance`.`user` (`idUser`, `first_name`, `second_name`, `login`, `password`, `enabled`, `role_idRole`) VALUES (2, 'Jacek', 'Bednarczyk', 'jbednarczyk', '123', 1, 1);
INSERT INTO `databaseInstance`.`user` (`idUser`, `first_name`, `second_name`, `login`, `password`, `enabled`, `role_idRole`) VALUES (3, 'Jan', 'Kowalski', 'jkowalski', '123', 0, 2);
COMMIT;

-- -----------------------------------------------------
-- Data for table `databaseInstance`.`game`, user_status = 0 - user, user_status = 1 - owner
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`game` (`idGame`, `game_code`, `session_id`, `game_name`, `user_status`, `clubs_dictionary_idClub`, `user_idUser`) VALUES (1, '1', '1', 'mariuszGra', 1, 1, 1);
INSERT INTO `databaseInstance`.`game` (`idGame`, `game_code`, `session_id`, `game_name`, `user_status`, `clubs_dictionary_idClub`, `user_idUser`) VALUES (2, '1', '2', 'jacekGra', 0, 2, 2);

COMMIT;


