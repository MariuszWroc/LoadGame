SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `nowaInstancja2` ;
CREATE SCHEMA IF NOT EXISTS `nowaInstancja2` DEFAULT CHARACTER SET utf8 ;
USE `nowaInstancja2` ;

-- -------------------------------------------------------
-- Table `nowaInstancja2`.`user_roles`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS `nowaInstancja2`.`role`(
    `idRole` INT(11) NOT NULL,
    `role_name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idRole`))
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `nowaInstancja2`.`clubs_dictionary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nowaInstancja2`.`clubs_dictionary`(
    `idClub` INT(11) NOT NULL,
    `club_name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idClub`))
    ENGINE = InnoDB;

-- -------------------------------------------------------
-- Table `nowaInstancja2`.`users`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS `nowaInstancja2`.`user`(
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
              REFERENCES `nowaInstancja2`.`role` (`idRole`)
              ON DELETE NO ACTION
              ON UPDATE NO ACTION)
          ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nowaInstancja2`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nowaInstancja2`.`game` (
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
	REFERENCES `nowaInstancja2`.`clubs_dictionary` (`idClub`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT `fk_game_user1`
	FOREIGN KEY (`user_idUser`)
	REFERENCES `nowaInstancja2`.`user` (`idUser`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `nowaInstancja2`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `nowaInstancja2`;
INSERT INTO `nowaInstancja2`.`role` (`idRole`, `role_name`) VALUES (1, 'ROLE_ADMIN');
INSERT INTO `nowaInstancja2`.`role` (`idRole`, `role_name`) VALUES (2, 'ROLE_USER');
INSERT INTO `nowaInstancja2`.`role` (`idRole`, `role_name`) VALUES (3, 'ROLE_CODER');

COMMIT;

-- -----------------------------------------------------
-- Data for table `nowaInstancja2`.`clubs_dictionary`
-- -----------------------------------------------------
START TRANSACTION;
USE `nowaInstancja2`;
INSERT INTO `nowaInstancja2`.`clubs_dictionary` (`idClub`, `club_name`) VALUES (1, 'Śląsk Wrocław');
INSERT INTO `nowaInstancja2`.`clubs_dictionary` (`idClub`, `club_name`) VALUES (2, 'Legia Warszawa');

COMMIT;

-- -----------------------------------------------------
-- Data for table `nowaInstancja2`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `nowaInstancja2`;
INSERT INTO `nowaInstancja2`.`user` (`idUser`, `first_name`, `second_name`, `login`, `password`, `enabled`, `role_idRole`) VALUES (1, 'Mariusz', 'Czarny', 'mczarny', '123', 1, 1);
INSERT INTO `nowaInstancja2`.`user` (`idUser`, `first_name`, `second_name`, `login`, `password`, `enabled`, `role_idRole`) VALUES (2, 'Jacek', 'Bednarczyk', 'jbednarczyk', '123', 1, 1);
INSERT INTO `nowaInstancja2`.`user` (`idUser`, `first_name`, `second_name`, `login`, `password`, `enabled`, `role_idRole`) VALUES (3, 'Jan', 'Kowalski', 'jkowalski', '123', 0, 2);
COMMIT;

-- -----------------------------------------------------
-- Data for table `nowaInstancja2`.`game`, user_status = 0 - user, user_status = 1 - owner
-- -----------------------------------------------------
START TRANSACTION;
USE `nowaInstancja2`;
INSERT INTO `nowaInstancja2`.`game` (`idGame`, `game_code`, `session_id`, `game_name`, `user_status`, `clubs_dictionary_idClub`, `user_idUser`) VALUES (1, '1', '1', 'mCzarny', 1, 1, 1);
INSERT INTO `nowaInstancja2`.`game` (`idGame`, `game_code`, `session_id`, `game_name`, `user_status`, `clubs_dictionary_idClub`, `user_idUser`) VALUES (2, '1', '2', 'jBednarczyk', 0, 2, 2);

COMMIT;


