# --- !Ups

CREATE  TABLE `pmh_fields` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) );

INSERT INTO `pmh_fields` (`name`) VALUES ('medicalSurgicalHistory');
INSERT INTO `pmh_fields` (`name`) VALUES ('socialHistory');
INSERT INTO `pmh_fields` (`name`) VALUES ('currentMedication');
INSERT INTO `pmh_fields` (`name`) VALUES ('familyHistory');


# --- !Downs

DROP TABLE IF EXISTS `pmh_fields`;