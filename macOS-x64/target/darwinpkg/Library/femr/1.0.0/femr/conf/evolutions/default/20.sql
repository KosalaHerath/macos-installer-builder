# --- !Ups

CREATE  TABLE `treatment_fields` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) );

INSERT INTO `treatment_fields` (`name`) VALUES ('assessment');
INSERT INTO `treatment_fields` (`name`) VALUES ('problem');
INSERT INTO `treatment_fields` (`name`) VALUES ('treatment');
INSERT INTO `treatment_fields` (`name`) VALUES ('familyHistory');

# --- !Downs

DROP TABLE IF EXISTS `treatment_fields`