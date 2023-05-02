# --- !Ups

CREATE TABLE `custom_field_sizes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

  ALTER TABLE `custom_fields`
ADD COLUMN `custom_size_id` INT(11) NOT NULL AFTER `isDeleted`,
ADD INDEX `fk_custom_fields_custom_size_id_idx` (`custom_size_id` ASC);
ALTER TABLE `custom_fields`
ADD CONSTRAINT `fk_custom_fields_custom_size_id`
  FOREIGN KEY (`custom_size_id`)
  REFERENCES `custom_field_sizes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

ALTER TABLE `custom_fields`
DROP FOREIGN KEY `fk_custom_fields_custom_size_id`;

ALTER TABLE `custom_fields`
DROP INDEX `fk_custom_fields_custom_size_id_idx` ;

ALTER TABLE `custom_fields`
DROP COLUMN `custom_size_id`;

DROP TABLE `custom_field_sizes`;
