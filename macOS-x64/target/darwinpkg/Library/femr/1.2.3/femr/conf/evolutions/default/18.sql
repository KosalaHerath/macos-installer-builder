# --- !Ups

CREATE  TABLE `hpi_fields` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) );

INSERT INTO `hpi_fields` (`name`) VALUES ('onset');
INSERT INTO `hpi_fields` (`name`) VALUES ('onsetTime');
INSERT INTO `hpi_fields` (`name`) VALUES ('severity');
INSERT INTO `hpi_fields` (`name`) VALUES ('radiation');
INSERT INTO `hpi_fields` (`name`) VALUES ('quality');
INSERT INTO `hpi_fields` (`name`) VALUES ('provokes');
INSERT INTO `hpi_fields` (`name`) VALUES ('palliates');
INSERT INTO `hpi_fields` (`name`) VALUES ('timeOfDay');
INSERT INTO `hpi_fields` (`name`) VALUES ('physicalExamination');

# --- !Downs

DROP TABLE IF EXISTS `hpi_fields`
