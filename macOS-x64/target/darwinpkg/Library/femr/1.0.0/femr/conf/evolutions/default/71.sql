# --- !Ups

ALTER TABLE `patient_prescriptions`
ADD COLUMN `isCounseled` BIT(1) NOT NULL AFTER `special_instructions`;

ALTER TABLE `patient_prescriptions`
CHANGE COLUMN `isCounseled` `isCounseled` BIT(1) NOT NULL DEFAULT false ,
ADD COLUMN `isDispensed` BIT(1) NOT NULL DEFAULT false AFTER `isCounseled`;

CREATE TABLE `mission_cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

CREATE TABLE `mission_countries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

CREATE TABLE `mission_teams` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

ALTER TABLE `mission_teams`
ADD COLUMN `location` VARCHAR(255) NULL DEFAULT NULL AFTER `name`;

ALTER TABLE `mission_teams`
ADD COLUMN `description` VARCHAR(255) NULL DEFAULT NULL AFTER `name`;

ALTER TABLE `mission_cities`
CHANGE COLUMN `id` `id` INT(10) NOT NULL AUTO_INCREMENT ,
ADD COLUMN `mission_country_id` INT(10) NOT NULL AFTER `name`,
ADD INDEX `fk_mission_cities_1_idx` (`mission_country_id` ASC);
ALTER TABLE `mission_cities`
ADD CONSTRAINT `fk_mission_cities_1`
FOREIGN KEY (`mission_country_id`)
REFERENCES `mission_countries` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `mission_trips` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mission_team_id` INT NOT NULL,
  `mission_city_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_mission_trips_mission_team_idx` (`mission_team_id` ASC),
  INDEX `fk_mission_trips_mission_city_idx` (`mission_city_id` ASC),
  CONSTRAINT `fk_mission_trips_mission_team`
  FOREIGN KEY (`mission_team_id`)
  REFERENCES `mission_teams` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mission_trips_mission_city`
  FOREIGN KEY (`mission_city_id`)
  REFERENCES `mission_cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `patient_encounters`
ADD COLUMN `mission_trip_id` INT(11) NULL AFTER `patient_age_classification_id`,
ADD INDEX `fk_patient_encounters_id_mission_trip_id_idx` (`mission_trip_id` ASC);

ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_patient_encounters_id_mission_trip_id`
FOREIGN KEY (`mission_trip_id`)
REFERENCES `mission_trips` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mission_trips`
ADD COLUMN `isCurrent` BIT(1) NOT NULL DEFAULT FALSE AFTER `mission_city_id`;

ALTER TABLE `mission_trips`
ADD COLUMN `start_date` DATE NOT NULL AFTER `isCurrent`,
ADD COLUMN `end_date` DATE NOT NULL AFTER `start_date`;


# --- !Downs

ALTER TABLE `patient_prescriptions`
DROP COLUMN `isCounseled`;

ALTER TABLE `patient_prescriptions`
DROP COLUMN `isDispensed`;

ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_patient_encounters_id_mission_trip_id`;

ALTER TABLE `patient_encounters`
DROP COLUMN `mission_trip_id`,
DROP INDEX `fk_patient_encounters_id_mission_trip_id_idx` ;

DROP TABLE `mission_trips`;

DROP TABLE `mission_cities`;

DROP TABLE `mission_countries`;

DROP TABLE `mission_teams`;
