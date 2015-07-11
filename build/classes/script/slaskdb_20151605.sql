SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `databaseInstance` ;
CREATE SCHEMA IF NOT EXISTS `databaseInstance` DEFAULT CHARACTER SET utf8 ;
USE `databaseInstance` ;

-- -----------------------------------------------------
-- Table `databaseInstance`.`finance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`finance` (
  `idFinance` INT(11) NOT NULL,
  `Budget` INT(11) NULL,
  `TransferBudget` INT(11) NULL,
  `WageBudget` INT(11) NULL,
  `StadiumCost` INT(11) NULL,
  `AvgTicketCost` INT(11) NULL,
  `AvgSeasonTicketCost` INT(11) NULL,
  `SeasonTicketsNumber` INT(11) NULL,
  `Dept` INT(11) NULL,
  `FromSponsors` INT(11) NULL,
  PRIMARY KEY (`idFinance`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`tactic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`tactic` (
  `idTactic` INT(11) NOT NULL,
  `Attack` INT(11) NULL,
  `Marking` INT(11) NULL,
  `Offside` INT(11) NULL,
  `Pressing` INT(11) NULL,
  `Tempo` INT(11) NULL,
  `PlayWide` INT(11) NULL,
  `PlayHigh` INT(11) NULL,
  `Flair` INT(11) NULL,
  `LongPass` INT(11) NULL,
  `PlayToDefenders` INT(11) NULL,
  `TacticName` VARCHAR(45) NULL,
  PRIMARY KEY (`idTactic`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`formation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`formation` (
  `idFormation` INT(11) NOT NULL,
  `FormationName` VARCHAR(45) NULL,
  `DefendersNumber` INT(1) NULL,
  `MidfieldNumber` INT(1) NULL,
  `ForwardNumber` INT(1) NULL,
  `tactic_idTactic` INT(11) NULL,
  PRIMARY KEY (`idFormation`),
  INDEX `fk_formation_tactic1_idx` (`tactic_idTactic` ASC),
  CONSTRAINT `fk_formacje_taktyki1`
    FOREIGN KEY (`tactic_idTactic`)
    REFERENCES `databaseInstance`.`tactic` (`idTactic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`person` (
  `idPerson` INT(11) NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NULL,
  `BirthDate` DATETIME NULL,
  `Nation` VARCHAR(45) NULL,
  PRIMARY KEY (`idPerson`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`coach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`coach` (
  `idCoach` INT(11) NOT NULL,
  `TacticalKnowledge` INT(11) NULL,
  `TreningMental` INT(11) NULL,
  `TreningTactic` INT(11) NULL,
  `TreningTechnique` INT(11) NULL,
  `Motivating` INT(11) NULL,
  `Management` INT(11) NULL,
  `Discipline` INT(11) NULL,
  `SkillRate` INT(11) NULL,
  `person_idPerson` INT(11) NULL,
  PRIMARY KEY (`idCoach`),
  INDEX `fk_trenerzy_osoby1_idx` (`person_idPerson` ASC),
  CONSTRAINT `fk_trenerzy_osoby1`
    FOREIGN KEY (`person_idPerson`)
    REFERENCES `databaseInstance`.`person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`tournament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`tournament` (
  `idTournament` INT(11) NOT NULL,
  `TournamentName` VARCHAR(45) NULL,
  `TournamentReputation` INT(11) NULL,
  `TeamsNumber` INT(11) NULL,
  `RelegatesNumber` INT(11) NULL,
  PRIMARY KEY (`idTournament`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`city` (
  `idCity` INT(11) NOT NULL,
  `CityName` VARCHAR(45) NULL,
  PRIMARY KEY (`idCity`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`stadium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`stadium` (
  `idStadium` INT(11) NOT NULL,
  `StadiumName` VARCHAR(45) NULL,
  `SitsNumber` INT(11) NULL,
  `YearBuild` INT(4) NULL,
  `Modernity` INT(11) NULL,
  `FieldWidth` INT(11) NULL,
  `FieldHeight` INT(11) NULL,
  `city_idCity` INT(11) NULL,
  PRIMARY KEY (`idStadium`),
  INDEX `fk_stadium_city1_idx` (`city_idCity` ASC),
  CONSTRAINT `fk_stadiony_miasta1`
    FOREIGN KEY (`city_idCity`)
    REFERENCES `databaseInstance`.`city` (`idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`training`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`training` (
  `idTraining` INT(11) NOT NULL,
  `TrainingName` VARCHAR(45) NULL,
  `Pace` INT(1) NULL,
  `Strength` INT(1) NULL,
  `Stamina` INT(1) NULL,
  `SetPieces` INT(1) NULL,
  `Technique` INT(1) NULL,
  `Finishing` INT(1) NULL,
  `Passing` INT(1) NULL,
  `Marking` INT(1) NULL,
  `Tackling` INT(1) NULL,
  `Heading` INT(1) NULL,
  `Reflex` INT(1) NULL,
  `Handling` INT(1) NULL,
  PRIMARY KEY (`idTraining`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`club`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`club` (
  `idClub` INT(11) NOT NULL,
  `AttendanceAvg` INT(11) NULL,
  `AttendanceMin` INT(11) NULL,
  `AttendanceMax` INT(11) NULL,
  `TrainingAssets` INT(11) NULL,
  `Youth` INT(11) NULL,
  `ClubName` VARCHAR(45) NULL,
  `ClubNick` VARCHAR(45) NULL,
  `YearFound` INT(4) NULL,
  `Morale` INT(11) NULL,
  `ClubReputation` INT(11) NULL,
  `Colours` VARCHAR(45) NULL,
  `PointsScored` INT(11) NULL,
  `GoalsScored` INT(11) NULL,
  `GoalsLost` INT(11) NULL,
  `YellowCards` INT(11) NULL,
  `RedCards` INT(11) NULL,
  `coach_idCoach` INT(11) NULL,
  `finance_idFinance` INT(11) NULL,
  `tournament_idTournament` INT(11) NULL,
  `stadium_idStadium` INT(11) NULL,
  `training_idTraining` INT(11) NULL,
  `formation_idFormation` INT(11) NULL,
  PRIMARY KEY (`idClub`),
  INDEX `fk_club_coach1_idx` (`coach_idCoach` ASC),
  INDEX `fk_club_finance1_idx` (`finance_idFinance` ASC),
  INDEX `fk_club_tournament1_idx` (`tournament_idTournament` ASC),
  INDEX `fk_club_stadium1_idx` (`stadium_idStadium` ASC),
  INDEX `fk_club_training1_idx` (`training_idTraining` ASC),
  INDEX `fk_club_formation1_idx` (`formation_idFormation` ASC),
  CONSTRAINT `fk_kluby_trenerzy1`
    FOREIGN KEY (`coach_idCoach`)
    REFERENCES `databaseInstance`.`coach` (`idCoach`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kluby_finanse1`
    FOREIGN KEY (`finance_idFinance`)
    REFERENCES `databaseInstance`.`finance` (`idFinance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kluby_rozgrywki1`
    FOREIGN KEY (`tournament_idTournament`)
    REFERENCES `databaseInstance`.`tournament` (`idTournament`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kluby_stadiony1`
    FOREIGN KEY (`stadium_idStadium`)
    REFERENCES `databaseInstance`.`stadium` (`idStadium`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kluby_trening1`
    FOREIGN KEY (`training_idTraining`)
    REFERENCES `databaseInstance`.`training` (`idTraining`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kluby_formacje1`
    FOREIGN KEY (`formation_idFormation`)
    REFERENCES `databaseInstance`.`formation` (`idFormation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`position` (
  `idPosition` INT(11) NOT NULL,
  `Goalkeeper` INT(11) NULL,
  `DefenderLeft` INT(11) NULL,
  `DefenderCenter` INT(11) NULL,
  `DefenderRight` INT(11) NULL,
  `MidfieldDef` INT(11) NULL,
  `MidfieldRight` INT(11) NULL,
  `MidfieldLeft` INT(11) NULL,
  `MidfieldCenter` INT(11) NULL,
  `WingerLeft` INT(11) NULL,
  `WingerRight` INT(11) NULL,
  `Forward` INT(11) NULL,
  PRIMARY KEY (`idPosition`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`player` (
  `idPlayer` INT(11) NOT NULL,
  `CurrentForm` INT(11) NULL,
  `Reputation` INT(11) NULL,
  `Potential` INT(11) NULL,
  `LegLeft` INT(11) NULL,
  `LegRight` INT(11) NULL,
  `Determination` INT(11) NULL,
  `Dirtness` INT(11) NULL,
  `Influence` INT(11) NULL,
  `Injury` INT(11) NULL,
  `Pace` INT(11) NULL,
  `Strength` INT(11) NULL,
  `Stamina` INT(11) NULL,
  `SetPieces` INT(11) NULL,
  `Technique` INT(11) NULL,
  `Finishing` INT(11) NULL,
  `Passing` INT(11) NULL,
  `Marking` INT(11) NULL,
  `Tackling` INT(11) NULL,
  `Heading` INT(11) NULL,
  `Reflex` INT(11) NULL,
  `Handling` INT(11) NULL,
  `Weight` INT(11) NULL,
  `Height` INT(11) NULL,
  `BestPosition` VARCHAR(45) NULL,
  `BestPositionShort` VARCHAR(45) NULL,
  `person_idPerson` INT(11) NULL,
  `position_idPosition` INT(11) NULL,
  PRIMARY KEY (`idPlayer`),
  INDEX `fk_player_person1_idx` (`person_idPerson` ASC),
  INDEX `fk_player_position1_idx` (`position_idPosition` ASC),
  CONSTRAINT `fk_pilkarze_osoby1`
    FOREIGN KEY (`person_idPerson`)
    REFERENCES `databaseInstance`.`person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pilkarze_pozycje1`
    FOREIGN KEY (`position_idPosition`)
    REFERENCES `databaseInstance`.`position` (`idPosition`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`contract` (
  `idContract` INT(11) NOT NULL,
  `Fee` DECIMAL(10,2) NULL,
  `Wage` DECIMAL(10,2) NULL,
  `DateStart` DATETIME NULL,
  `DateEnd` DATETIME NULL,
  `club_idClub` INT(11) NULL,
  `player_idPlayer` INT(11) NULL,
  PRIMARY KEY (`idContract`),
  INDEX `fk_Contract_player_idx` (`player_idPlayer` ASC),
  INDEX `fk_Contract_club1_idx` (`club_idClub` ASC),
  CONSTRAINT `fk_Kontrakt_pilkarze`
    FOREIGN KEY (`player_idPlayer`)
    REFERENCES `databaseInstance`.`player` (`idPlayer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kontrakt_kluby1`
    FOREIGN KEY (`club_idClub`)
    REFERENCES `databaseInstance`.`club` (`idClub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`referee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`referee` (
  `idReferee` INT(11) NOT NULL,
  `Refereeing` INT(11) NULL,
  `Punishing` INT(11) NULL,
  `person_idPerson` INT(11) NULL,
  PRIMARY KEY (`idReferee`),
  INDEX `fk_coach_person1_idx` (`person_idPerson` ASC),
  CONSTRAINT `fk_sedziowie_osoby1`
    FOREIGN KEY (`person_idPerson`)
    REFERENCES `databaseInstance`.`person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`fixture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`fixture` (
  `idFixture` INT(11) NOT NULL AUTO_INCREMENT,
  `SeasonYear` INT(4) NULL,
  `tournament_idTournament` INT(11) NULL,
  PRIMARY KEY (`idFixture`),
  INDEX `fk_Fixture_tournament1_idx` (`tournament_idTournament` ASC),
  CONSTRAINT `fk_Terminarz_rozgrywki1`
    FOREIGN KEY (`tournament_idTournament`)
    REFERENCES `databaseInstance`.`tournament` (`idTournament`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`arrange`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`arrange` (
  `idArrange` INT(11) NOT NULL,
  `ArrangeDate` DATETIME NULL,
  `referee_idReferee` INT(11) NULL,
  `fixture_idFixture` INT(11) NULL,
  PRIMARY KEY (`idArrange`),
  INDEX `fk_Arrange_coach1_idx` (`referee_idReferee` ASC),
  INDEX `fk_arrange_fixture1_idx` (`fixture_idFixture` ASC),
  CONSTRAINT `fk_Mecz_sedziowie1`
    FOREIGN KEY (`referee_idReferee`)
    REFERENCES `databaseInstance`.`referee` (`idReferee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mecz_terminarz1`
    FOREIGN KEY (`fixture_idFixture`)
    REFERENCES `databaseInstance`.`fixture` (`idFixture`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`staff` (
  `idStaff` INT(11) NOT NULL,
  `StaffFunction` VARCHAR(45) NULL,
  `person_idPerson` INT(11) NULL,
  `club_idClub` INT(11) NULL,
  PRIMARY KEY (`idStaff`),
  INDEX `fk_staff_person1_idx` (`person_idPerson` ASC),
  INDEX `fk_staff_club1_idx` (`club_idClub` ASC),
  CONSTRAINT `fk_personel_osoby1`
    FOREIGN KEY (`person_idPerson`)
    REFERENCES `databaseInstance`.`person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personel_kluby1`
    FOREIGN KEY (`club_idClub`)
    REFERENCES `databaseInstance`.`club` (`idClub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databaseInstance`.`club_has_arrange`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`club_has_arrange` (
  `club_idClub` INT(11) NOT NULL,
  `arrange_idArrange` INT(11) NOT NULL,
  PRIMARY KEY (`club_idClub`, `arrange_idArrange`),
  INDEX `fk_club_has_arrange_arrange1_idx` (`arrange_idArrange` ASC),
  INDEX `fk_club_has_arrange_club1_idx` (`club_idClub` ASC),
  CONSTRAINT `fk_club_has_arrange_club1`
    FOREIGN KEY (`club_idClub`)
    REFERENCES `databaseInstance`.`club` (`idClub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_club_has_arrange_arrange1`
    FOREIGN KEY (`arrange_idArrange`)
    REFERENCES `databaseInstance`.`arrange` (`idArrange`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -------------------------------------------------------
-- Table `databaseInstance`.`users`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`user`(
	`idUser` INT(11) NOT NULL,
	`name` VARCHAR(30) NULL,
	`sname` VARCHAR(40) NULL,
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

-- -------------------------------------------------------
-- Table `databaseInstance`.`user_roles`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS `databaseInstance`.`role`(
    `idRole` INT(11) NOT NULL,
    `rolename` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idRole`))
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
	`club_idClub` INT(11) NULL,
	`user_idUser` INT(11) NOT NULL,
	PRIMARY KEY (`idGame`),
	INDEX `fk_game_club_idx` (`club_idClub` ASC),
	INDEX `fk_game_user1_idx` (`user_idUser` ASC),
	CONSTRAINT `fk_game_club`
	FOREIGN KEY (`club_idClub`)
	REFERENCES `databaseInstance`.`club` (`idClub`)
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
-- Data for table `databaseInstance`.`finance`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`finance` (`idFinance`, `Budget`, `TransferBudget`, `WageBudget`, `StadiumCost`, `AvgTicketCost`, `AvgSeasonTicketCost`, `SeasonTicketsNumber`, `Dept`, `FromSponsors`) VALUES (1, 36000000, 1000000, 25000000, 100000, 30, 120, 10000, 10000000, 5000000);
INSERT INTO `databaseInstance`.`finance` (`idFinance`, `Budget`, `TransferBudget`, `WageBudget`, `StadiumCost`, `AvgTicketCost`, `AvgSeasonTicketCost`, `SeasonTicketsNumber`, `Dept`, `FromSponsors`) VALUES (2, 66000000, 5000000, 42000000, 200000, 70, 300, 15000, 5000000, 10000000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`tactic`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`tactic` (`idTactic`, `Attack`, `Marking`, `Offside`, `Pressing`, `Tempo`, `PlayWide`, `PlayHigh`, `Flair`, `LongPass`, `PlayToDefenders`, `TacticName`) VALUES (1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, '442');
INSERT INTO `databaseInstance`.`tactic` (`idTactic`, `Attack`, `Marking`, `Offside`, `Pressing`, `Tempo`, `PlayWide`, `PlayHigh`, `Flair`, `LongPass`, `PlayToDefenders`, `TacticName`) VALUES (2, 16, 12, 15, 17, 8, 18, 13, 9, 13, 11, '352');
INSERT INTO `databaseInstance`.`tactic` (`idTactic`, `Attack`, `Marking`, `Offside`, `Pressing`, `Tempo`, `PlayWide`, `PlayHigh`, `Flair`, `LongPass`, `PlayToDefenders`, `TacticName`) VALUES (3, 8, 18, 7, 16, 11, 15, 9, 6, 8, 15, '451');

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`formation`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`formation` (`idFormation`, `FormationName`, `DefendersNumber`, `MidfieldNumber`, `ForwardNumber`, `tactic_idTactic`) VALUES (1, '442', 4, 4, 2, 1);
INSERT INTO `databaseInstance`.`formation` (`idFormation`, `FormationName`, `DefendersNumber`, `MidfieldNumber`, `ForwardNumber`, `tactic_idTactic`) VALUES (2, '352', 3, 5, 2, 2);
INSERT INTO `databaseInstance`.`formation` (`idFormation`, `FormationName`, `DefendersNumber`, `MidfieldNumber`, `ForwardNumber`, `tactic_idTactic`) VALUES (3, '451', 4, 5, 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (1, 'Pawel', 'Gil', '1976-06-28', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (2, 'Boguslaw', 'Lesniodorski', '1975-01-01', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (3, 'Pawel', 'Zelem', NULL, 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (4, 'Stanislaw', 'Levy', '1958-05-02', 'Czechy');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (5, 'Jan', 'Urban', '1962-05-14', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (6, 'Rafal', 'Gikiewicz', '1987-10-26', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (7, 'Adam', 'Kokoszka', '1986-10-06', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (8, 'Mariusz', 'Pawelec', '1986-04-14', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (9, 'Tadeusz', 'Socha', '1988-02-15', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (10, 'Rafal', 'Grodzicki', '1983-10-28', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (11, 'Przemyslaw', 'Kazmierczak', '1982-05-05', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (12, 'Sebastian', 'Mila', '1982-07-10', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (13, 'Krzysztof', 'Ostrowski', '1982-05-03', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (14, 'Mateusz', 'Cetnarski', '1988-07-06', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (15, 'Marco', 'Paixao', '1984-09-19', 'Portugalia');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (16, 'Sebino', 'Plaku', '1985-05-20', 'Albania');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (17, 'Sylwester', 'Patejuk', '1982-11-30', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (18, 'Dalibor', 'Stevanovic', '1984-09-27', 'Slowenia');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (19, 'Oded', 'Gavish', '1989-06-23', 'Izrael');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (20, 'Marian', 'Kelemen', '1979-06-08', 'Slowacja');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (21, 'Tomasz', 'Holota', '1991-01-27', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (22, 'Wojciech', 'Skaba', '1984-04-09', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (23, 'Inaki', 'Astiz', '1983-11-05', 'Hiszpania');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (24, 'Lukasz', 'Broz', '1985-12-17', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (25, 'Tomasz', 'Brzyski', '1982-01-10', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (26, 'Tomasz', 'Jodlowiec', '1985-09-08', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (27, 'Jakub', 'Rzezniczak', '1986-10-26', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (28, 'Jakub', 'Wawrzyniak', '1983-07-07', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (29, 'Jakub', 'Kosecki', '1990-08-29', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (30, 'Michal', 'Kucharczyk', '1991-03-20', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (31, 'Daniel', 'Lukasik', '1991-05-28', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (32, 'Miroslav', 'Radovic', '1984-01-16', 'Serbia');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (33, 'Michal', 'Zyro', '1992-09-20', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (34, 'Ivica', 'Drvoljak', '1983-09-19', 'Chorwacja');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (35, 'Dominik', 'Furman', '1992-07-06', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (36, 'Wladimer', 'Dwaliszwili', '1986-04-20', 'Gruzja');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (37, 'Marek', 'Saganowski', '1978-10-31', 'Polska');
INSERT INTO `databaseInstance`.`person` (`idPerson`, `Name`, `Surname`, `BirthDate`, `Nation`) VALUES (38, 'Dusan', 'Kuciak', '1985-05-21', 'Slowacja');

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`coach`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`coach` (`idCoach`, `TacticalKnowledge`, `TreningMental`, `TreningTactic`, `TreningTechnique`, `Motivating`, `Management`, `Discipline`, `SkillRate`, `person_idPerson`) VALUES (1, 12, 11, 8, 7, 14, 6, 9, 14, 4);
INSERT INTO `databaseInstance`.`coach` (`idCoach`, `TacticalKnowledge`, `TreningMental`, `TreningTactic`, `TreningTechnique`, `Motivating`, `Management`, `Discipline`, `SkillRate`, `person_idPerson`) VALUES (2, 13, 10, 14, 16, 12, 11, 13, 11, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`tournament`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`tournament` (`idTournament`, `TournamentName`, `TournamentReputation`, `TeamsNumber`, `RelegatesNumber`) VALUES (1, 'Ekstraklasa', 20, 2, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`city`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`city` (`idCity`, `CityName`) VALUES (1, 'Wroclaw');
INSERT INTO `databaseInstance`.`city` (`idCity`, `CityName`) VALUES (2, 'Warszawa');

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`stadium`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`stadium` (`idStadium`, `StadiumName`, `SitsNumber`, `YearBuild`, `Modernity`, `FieldWidth`, `FieldHeight`, `city_idCity`) VALUES (1, 'Stadion Miejski we Wroclawiu', 45000, 2011, 19, 105, 68, 1);
INSERT INTO `databaseInstance`.`stadium` (`idStadium`, `StadiumName`, `SitsNumber`, `YearBuild`, `Modernity`, `FieldWidth`, `FieldHeight`, `city_idCity`) VALUES (2, 'Stadon Wojska Polskiego', 31000, 2010, 18, 105, 68, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`training`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`training` (`idTraining`, `TrainingName`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`) VALUES (1, 'Fitness', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `databaseInstance`.`training` (`idTraining`, `TrainingName`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`) VALUES (2, 'General', 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0);
INSERT INTO `databaseInstance`.`training` (`idTraining`, `TrainingName`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`) VALUES (3, 'Rest', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `databaseInstance`.`training` (`idTraining`, `TrainingName`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`) VALUES (4, 'Goalkeeping', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `databaseInstance`.`training` (`idTraining`, `TrainingName`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`) VALUES (5, 'Tactic', 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0);
INSERT INTO `databaseInstance`.`training` (`idTraining`, `TrainingName`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`) VALUES (6, 'Technique', 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0);
INSERT INTO `databaseInstance`.`training` (`idTraining`, `TrainingName`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`) VALUES (7, 'Mental', 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`club`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`club` (`idClub`, `AttendanceAvg`, `AttendanceMin`, `AttendanceMax`, `TrainingAssets`, `Youth`, `ClubName`, `ClubNick`, `YearFound`, `Morale`, `ClubReputation`, `Colours`, `PointsScored`, `GoalsScored`, `GoalsLost`, `YellowCards`, `RedCards`, `coach_idCoach`, `finance_idFinance`, `tournament_idTournament`, `stadium_idStadium`, `training_idTraining`, `formation_idFormation`) VALUES (1, 15000, 10000, 25000, 10, 8, 'Slask Wroclaw', 'WKS', 1947, 12, 13, 'zielono-bialo-czerwone', 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`club` (`idClub`, `AttendanceAvg`, `AttendanceMin`, `AttendanceMax`, `TrainingAssets`, `Youth`, `ClubName`, `ClubNick`, `YearFound`, `Morale`, `ClubReputation`, `Colours`, `PointsScored`, `GoalsScored`, `GoalsLost`, `YellowCards`, `RedCards`, `coach_idCoach`, `finance_idFinance`, `tournament_idTournament`, `stadium_idStadium`, `training_idTraining`, `formation_idFormation`) VALUES (2, 20000, 12000, 30000, 16, 19, 'Legia Warszawa', 'Legionisci', 1916, 17, 20, 'czerwono-bialo-zielone', 0, 0, 0, 0, 0, 2, 2, 1, 2, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`position`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (1, 20, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (2, 1, 1, 20, 15, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (3, 1, 15, 20, 15, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (4, 1, 1, 1, 20, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (5, 1, 1, 20, 1, 10, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (6, 1, 1, 1, 1, 20, 1, 20, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (7, 1, 1, 1, 1, 1, 15, 20, 1, 1, 1, 8);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (8, 1, 15, 1, 20, 1, 10, 1, 20, 10, 15, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (9, 1, 1, 1, 1, 1, 13, 20, 11, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (10, 1, 1, 1, 1, 1, 1, 1, 1, 15, 15, 20);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (11, 1, 1, 1, 1, 1, 1, 1, 1, 20, 15, 20);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (12, 1, 1, 1, 1, 1, 10, 15, 10, 20, 15, 10);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (13, 1, 1, 1, 1, 10, 1, 20, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (14, 1, 1, 20, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (15, 20, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (16, 1, 1, 1, 1, 12, 1, 20, 15, 1, 1, 20);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (17, 20, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (18, 20, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (19, 1, 10, 20, 1, 5, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (20, 1, 1, 1, 20, 10, 1, 1, 10, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (21, 1, 20, 10, 1, 1, 15, 1, 1, 10, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (22, 1, 1, 20, 1, 20, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (23, 1, 15, 20, 17, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (24, 1, 20, 15, 10, 1, 10, 1, 1, 15, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (25, 1, 1, 1, 1, 1, 15, 1, 10, 20, 12, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (26, 1, 1, 1, 1, 1, 11, 1, 12, 18, 17, 20);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (27, 1, 1, 1, 1, 20, 1, 15, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (28, 1, 1, 1, 1, 1, 18, 20, 16, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (29, 1, 15, 1, 1, 1, 20, 1, 1, 20, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (30, 1, 1, 1, 1, 20, 1, 20, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (31, 1, 1, 1, 1, 20, 1, 15, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (32, 1, 1, 1, 1, 1, 1, 15, 1, 1, 1, 1);
INSERT INTO `databaseInstance`.`position` (`idPosition`, `Goalkeeper`, `DefenderLeft`, `DefenderCenter`, `DefenderRight`, `MidfieldDef`, `MidfieldRight`, `MidfieldLeft`, `MidfieldCenter`, `WingerLeft`, `WingerRight`, `Forward`) VALUES (33, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`player`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (1, 172, 11, 180, 5, 20, 16, 5, 9, 7, 8, 16, 5, 5, 5, 1, 7, 1, 1, 2, 15, 13, 93, 190, 'Bramkarz', 'GK', 6, 1);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (2, 168, 14, 175, 10, 20, 14, 11, 9, 11, 12, 15, 9, 10, 8, 7, 9, 13, 16, 16, 1, 1, 82, 187, 'Srodkowy Obronca', 'DC', 7, 2);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (3, 163, 12, 170, 15, 20, 10, 12, 8, 10, 17, 13, 16, 13, 12,  5, 7, 12, 12, 9, 1, 1, 72, 180, 'Srodkowy Lewy Obronca', 'DCL', 8, 3);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (4, 155, 10, 165, 10, 20, 6, 14, 10, 12, 10, 10, 11, 3, 7, 4, 9, 11, 12, 12, 1, 1, 80, 183, 'Srodkowy Prawy Obronca', 'DRC', 9, 4);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (5, 161, 9, 169, 10, 20, 10, 9, 2, 12, 13, 12, 14, 11, 11, 6, 8, 12, 15, 14, 1, 1, 91, 192, 'Srodkowy Obronca', 'DC', 10, 5);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (6, 172, 19, 176, 15, 20, 14, 11, 13, 9, 12, 15, 13, 11, 14, 13, 11, 12, 14, 16, 1, 1, 80, 191, 'Srodkowy Defensywny Pomonik', 'DM', 11, 6);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (7, 178, 20, 180, 15, 20, 18, 5, 20, 13, 5, 9, 8, 19, 15, 14, 16, 6, 2, 6, 1, 1, 67, 178, 'Srodkowy Lewy Pomocnik', 'MLC', 12, 7);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (8, 162, 7, 168, 10, 20, 16, 13, 15, 5, 11, 9, 8, 5, 5, 8, 8, 9, 9, 8, 1, 1, 73, 178, 'Prawy Skrzydlowy', 'LWB', 13, 8);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (9, 157, 7, 163, 20, 10, 10, 6, 6, 9, 10, 6, 1, 10, 10, 10, 11, 7, 8, 7, 1, 1, 71, 175, 'Srodkowy Pomocnik', 'MC', 14, 9);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (10, 179, 12, 182, 10, 20, 17, 7, 10, 8, 15, 11, 14, 9, 13, 18, 9, 4, 1, 14, 1, 1, 79, 185, 'Snajper', 'SC', 15, 10);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (11, 174, 10, 178, 10, 20, 14, 8, 9, 9, 17, 10, 15, 7, 12, 14, 12, 3, 2, 9, 1, 1, 70, 174, 'Napastnik', 'FC', 16, 11);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (12, 164, 9, 171, 20, 5, 12, 10, 7, 13, 14, 13, 11, 9, 8, 9, 10, 8, 7, 9, 1, 1, 80, 188, 'Napastnik', 'FC', 17, 12);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (13, 168, 13, 176, 10, 20, 14, 12, 10, 14, 11, 16, 15, 10, 12, 11, 11, 9, 9, 10, 1, 1, 75, 183, 'Srodkowy Pomocnik', 'MC', 18, 13);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (14, 169, 8, 173, 10, 20, 11, 10, 8, 7, 10, 15, 8, 4, 5, 2, 5, 14, 12, 13, 1, 1, 76, 185, 'Srodkowy Obronca', 'DC', 19, 14);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (15, 171, 17, 174, 20, 5, 16, 12, 15, 6, 6, 11, 4, 10, 7, 1, 7, 1, 1, 2, 15, 12, 83, 188, 'Bramkarz', 'GK', 20, 15);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (16, 167, 3, 177, 5, 20, 12, 6, 9, 8, 13, 8, 13, 9, 14, 10, 11, 7, 5, 9, 1, 1, 83, 185, 'Srodkowy Ofensywny Pomocnik', 'AMC', 21, 16);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (17, 174, 17, 179, 5, 20, 15, 8, 10, 9, 5, 8, 4, 4, 1, 1, 8, 1, 5, 5, 14, 17, 84, 194, 'Bramkarz', 'GK', 22, 18);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (18, 170, 18, 172, 10, 20, 15, 12, 10, 13, 14, 15, 14, 6, 11, 7, 12, 14, 12, 13, 1, 1, 83, 185, 'Srodkowy Obronca', 'DC', 23, 19);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (19, 165, 11, 171, 15, 20, 12, 10, 8, 7, 13, 10, 10, 8, 11, 8, 10, 13, 13, 9, 1, 1, 74, 180, 'Prawy Lewy Obronca', 'DLR', 24, 20);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (20, 168, 8, 174, 10, 20, 16, 8, 9, 5, 14, 9, 15, 8, 12, 9, 11, 9, 8, 10, 1, 1, 68, 170, 'Lewy Obronca', 'DL', 25, 21);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (21, 173, 15, 176, 5, 20, 13, 7, 13, 6, 11, 18, 12, 6, 10, 10, 10, 12, 14, 15, 1, 1, 86, 190, 'Srodkowy Obronca', 'DC', 26, 22);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (22, 164, 10, 170, 10, 20, 14, 12, 9, 13, 15, 13, 18, 8, 8, 6, 11, 14, 14, 12, 1, 1, 82, 183, 'Srodkowy Obronca', 'DC', 27, 23);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (23, 161, 9, 167, 20, 5, 11, 13, 5, 11, 15, 12, 16, 7, 4, 7, 9, 10, 12, 9, 1, 1, 85, 188, 'Lewy Obronca', 'DL', 28, 24);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (24, 171, 14, 180, 10, 20, 17, 6, 7, 14, 20, 9, 17, 13, 16, 15, 14, 7, 6, 9, 1, 1, 59, 168, 'Lewy Pomocnik', 'ML', 29, 25);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (25, 165, 11, 173, 15, 20, 12, 5, 4, 16, 2, 10, 11, 10, 10, 13, 11, 4, 6, 12, 1, 1, 72, 178, 'Srodkowy Defensywny Pomocnik', 'DM', 30, 26);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (26, 170, 9, 176, 10, 20, 18, 8, 11, 13, 9, 10, 11, 7, 9, 9, 10, 13, 13, 8, 1, 1, 73, 173, 'Srodkowy Pomocnik', 'MC', 31, 27);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (27, 175, 15, 178, 15, 20, 14, 14, 10, 9, 14, 10, 14, 8, 12, 11, 13, 8, 10, 10, 1, 1, 76, 182, 'Srodkowy Ofensywny Pomocnik', 'AMC', 32, 28);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (28, 169, 12, 177, 20, 10, 13, 9, 5, 12, 13, 14, 11, 9, 10, 12, 11, 7, 10, 11, 1, 1, 78, 189, 'Lewy Skrzydlowy', 'LWB', 33, 29);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (29, 170, 16, 172, 20, 10, 15, 15, 14, 10, 12, 15, 16, 9, 10, 11, 12, 13, 14, 12, 1, 1, 83, 187, 'Srodkowy Defensywny Pomocnik', 'DM', 34, 30);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (30, 171, 15, 179, 5, 20, 12, 7, 8, 9, 9, 7, 10, 11, 9, 12, 11, 11, 10, 8, 1, 1, 71, 181, 'Srodkowy Pomocnik', 'MC', 35, 31);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (31, 168, 20, 173, 10, 20, 17, 9, 18, 11, 14, 15, 10, 13, 15, 15, 9, 3, 2, 10, 1, 1, 82, 182, 'Prawy Ofensywny Pomocnik', 'AMR', 36, 32);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (32, 174, 19, 175, 15, 20, 16, 5, 11, 16, 10, 11, 7, 14, 15, 19, 8, 2, 2, 15, 1, 1, 78, 178, 'Snajper', 'SC', 37, 33);
INSERT INTO `databaseInstance`.`player` (`idPlayer`, `CurrentForm`, `Reputation`, `Potential`, `LegLeft`, `LegRight`, `Determination`, `Dirtness`, `Influence`, `Injury`, `Pace`, `Strength`, `Stamina`, `SetPieces`, `Technique`, `Finishing`, `Passing`, `Marking`, `Tackling`, `Heading`, `Reflex`, `Handling`, `Weight`, `Height`, `BestPosition`, `BestPositionShort`, `person_idPerson`, `position_idPosition`) VALUES (33, 174, 17, 179, 5, 20, 15, 8, 10, 9, 5, 8, 4, 4, 1, 1, 8, 1, 2, 3, 14, 17, 84, 194, 'Bramkarz', 'GK', 38, 17);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`contract`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (1, 20000, 10000, '2012-01-01', '2016-06-01', 1, 1);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (2, 20000, 10000, '2012-01-01', '2016-06-01', 1, 2);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (3, 20000, 10000, '2012-01-01', '2016-06-01', 1, 3);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (4, 20000, 10000, '2012-01-01', '2016-06-01', 1, 4);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (5, 20000, 10000, '2012-01-01', '2016-06-01', 1, 5);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (6, 20000, 10000, '2012-01-01', '2016-06-01', 1, 6);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (7, 20000, 10000, '2012-01-01', '2016-06-01', 1, 7);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (8, 20000, 10000, '2012-01-01', '2016-06-01', 1, 8);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (9, 20000, 10000, '2012-01-01', '2016-06-01', 1, 9);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (10, 20000, 10000, '2012-01-01', '2016-06-01', 1, 10);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (11, 20000, 10000, '2012-01-01', '2016-06-01', 1, 11);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (12, 20000, 10000, '2012-01-01', '2016-06-01', 1, 12);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (13, 20000, 10000, '2012-01-01', '2016-06-01', 1, 13);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (14, 20000, 10000, '2012-01-01', '2016-06-01', 1, 14);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (15, 20000, 10000, '2012-01-01', '2016-06-01', 1, 15);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (16, 20000, 10000, '2012-01-01', '2016-06-01', 1, 16);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (17, 20000, 10000, '2012-01-01', '2016-06-01', 2, 17);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (18, 20000, 10000, '2012-01-01', '2016-06-01', 2, 18);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (19, 20000, 10000, '2012-01-01', '2016-06-01', 2, 19);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (20, 20000, 10000, '2012-01-01', '2016-06-01', 2, 20);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (21, 20000, 10000, '2012-01-01', '2016-06-01', 2, 21);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (22, 20000, 10000, '2012-01-01', '2016-06-01', 2, 22);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (23, 20000, 10000, '2012-01-01', '2016-06-01', 2, 23);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (24, 20000, 10000, '2012-01-01', '2016-06-01', 2, 24);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (25, 20000, 10000, '2012-01-01', '2016-06-01', 2, 25);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (26, 20000, 10000, '2012-01-01', '2016-06-01', 2, 26);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (27, 20000, 10000, '2012-01-01', '2016-06-01', 2, 27);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (28, 20000, 10000, '2012-01-01', '2016-06-01', 2, 28);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (29, 20000, 10000, '2012-01-01', '2016-06-01', 2, 29);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (30, 20000, 10000, '2012-01-01', '2016-06-01', 2, 30);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (31, 20000, 10000, '2012-01-01', '2016-06-01', 2, 31);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (32, 20000, 10000, '2012-01-01', '2016-06-01', 2, 32);
INSERT INTO `databaseInstance`.`contract` (`idContract`, `Fee`, `Wage`, `DateStart`, `DateEnd`, `club_idClub`, `player_idPlayer`) VALUES (33, 20000, 10000, '2012-01-01', '2016-06-01', 2, 33);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`referee`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`referee` (`idReferee`, `Refereeing`, `Punishing`, `person_idPerson`) VALUES (1, 18, 5, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`fixture`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`fixture` (`idFixture`, `SeasonYear`, `tournament_idTournament`) VALUES (1, 2013, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`arrange`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`arrange` (`idArrange`, `ArrangeDate`, `referee_idReferee`, `fixture_idFixture`) VALUES (1, '2013-07-20', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`staff`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`staff` (`idStaff`, `StaffFunction`, `person_idPerson`, `club_idClub`) VALUES (1, 'Prezes', 1, 1);
INSERT INTO `databaseInstance`.`staff` (`idStaff`, `StaffFunction`, `person_idPerson`, `club_idClub`) VALUES (2, 'Prezes', 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`club_has_arrange`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`club_has_arrange` (`club_idClub`, `arrange_idArrange`) VALUES (1, 1);
INSERT INTO `databaseInstance`.`club_has_arrange` (`club_idClub`, `arrange_idArrange`) VALUES (2, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `databaseInstance`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`role` (`idRole`, `rolename`) VALUES (1, 'ROLE_ADMIN');
INSERT INTO `databaseInstance`.`role` (`idRole`, `rolename`) VALUES (2, 'ROLE_USER');
INSERT INTO `databaseInstance`.`role` (`idRole`, `rolename`) VALUES (3, 'ROLE_CODER');

COMMIT;


-- -----------------------------------------------------
-- Data for table `databaseInstance`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`user` (`idUser`, `name`, `sname`, `login`, `password`, `enabled`, `role_idRole`) VALUES (1, 'Mariusz', 'Czarny', 'mczarny', '123', 1, 1);
INSERT INTO `databaseInstance`.`user` (`idUser`, `name`, `sname`, `login`, `password`, `enabled`, `role_idRole`) VALUES (2, 'Jacek', 'Bednarczyk', 'jbednarczyk', '123', 1, 1);
INSERT INTO `databaseInstance`.`user` (`idUser`, `name`, `sname`, `login`, `password`, `enabled`, `role_idRole`) VALUES (3, 'Jan', 'Kowalski', 'jkowalski', '123', 0, 2);
COMMIT;





-- -----------------------------------------------------
-- Data for table `databaseInstance`.`game`, user_status = 0 - user, user_status = 1 - owner
-- -----------------------------------------------------
START TRANSACTION;
USE `databaseInstance`;
INSERT INTO `databaseInstance`.`game` (`idGame`, `game_code`, `session_id`, `game_name`, `user_status`, `club_idClub`, `user_idUser`) VALUES (1, '1', '1', 'mCzarny', 1, 1, 1);
INSERT INTO `databaseInstance`.`game` (`idGame`, `game_code`, `session_id`, `game_name`, `user_status`, `club_idClub`, `user_idUser`) VALUES (2, '1', '2', 'jBednarczyk', 0, 2, 2);

COMMIT;
