# --- !Ups

CREATE  TABLE `roles` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
DEFAULT CHARACTER SET = utf8;

INSERT INTO `roles` (`name`) VALUES ('Administrator');
INSERT INTO `roles` (`name`) VALUES ('Physician');
INSERT INTO `roles` (`name`) VALUES ('Pharmacist');
INSERT INTO `roles` (`name`) VALUES ('Researcher');

# --- !Downs

DROP TABLE IF EXISTS roles;