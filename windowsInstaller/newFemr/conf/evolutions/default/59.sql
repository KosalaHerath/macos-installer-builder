# --- !Ups

CREATE TABLE `system_settings` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `isActive` BIT(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

# --- !Downs

DROP TABLE `system_settings`;