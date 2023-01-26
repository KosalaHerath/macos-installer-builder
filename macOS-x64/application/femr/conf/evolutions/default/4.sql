# --- !Ups

CREATE TABLE `patients` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(255) NOT NULL ,
  `last_name` VARCHAR(255) NOT NULL ,
  `age` INT NOT NULL ,
  `sex` VARCHAR(10) NOT NULL ,
  `address` VARCHAR(255) NOT NULL ,
  `city` VARCHAR(255) NOT NULL ,
  PRIMARY KEY  (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
DEFAULT CHARACTER SET = utf8;

# --- !Downs

DROP TABLE IF EXISTS `patients`;