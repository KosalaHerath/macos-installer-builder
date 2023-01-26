# --- !Ups

CREATE TABLE `medication_forms` (
  `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_name` VARCHAR(45)  NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `form_name_UNIQUE` (`form_name` ASC));

ALTER TABLE `medications`
ADD COLUMN `medication_forms_id` INT(11) UNSIGNED NULL DEFAULT NULL
AFTER `isDeleted`,
ADD INDEX `fk_medications_medication_forms_idx` (`medication_forms_id` ASC);
ALTER TABLE `medications`
ADD CONSTRAINT `fk_medications_medication_forms`
FOREIGN KEY (`medication_forms_id`)
REFERENCES `medication_forms` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `medication_active_drugs` (
  `id`                              INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `medication_measurement_units_id` INT(11)          NOT NULL,
  `medication_active_drug_names_id` INT(11)          NOT NULL,
  `isDenominator`                   BIT(1)           NOT NULL,
  `value`                           INT(11)          NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

CREATE TABLE `medication_medication_active_drugs` (
  `id`                         INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `medications_id`             INT(11)          NOT NULL,
  `medication_active_drugs_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_medication_medication_active_drugs_medication_active_dru_idx` (`medication_active_drugs_id` ASC),
  INDEX `fk_medication_medication_active_drugs_medications_idx` (`medications_id` ASC),
  CONSTRAINT `fk_medication_medication_active_drugs_medications`
  FOREIGN KEY (`medications_id`)
  REFERENCES `medications` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medication_medication_active_drugs_medication_active_drugs`
  FOREIGN KEY (`medication_active_drugs_id`)
  REFERENCES `medication_active_drugs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `medication_measurement_units` (
  `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `unit_name` VARCHAR(45)  NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `unit_name_UNIQUE` (`unit_name` ASC));

CREATE TABLE `medication_active_drug_names` (
  `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45)  NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

ALTER TABLE `medication_active_drugs`
CHANGE COLUMN `medication_measurement_units_id` `medication_measurement_units_id` INT(11) UNSIGNED NOT NULL,
CHANGE COLUMN `medication_active_drug_names_id` `medication_active_drug_names_id` INT(11) UNSIGNED NOT NULL,
ADD INDEX `fk_medication_active_drugs_medication_measurement_units_idx` (`medication_measurement_units_id` ASC),
ADD INDEX `fk_medication_active_drugs_medication_active_drug_names_idx` (`medication_active_drug_names_id` ASC);
ALTER TABLE `medication_active_drugs`
ADD CONSTRAINT `fk_medication_active_drugs_medication_measurement_units`
FOREIGN KEY (`medication_measurement_units_id`)
REFERENCES `medication_measurement_units` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_medication_active_drugs_medication_active_drug_names`
FOREIGN KEY (`medication_active_drug_names_id`)
REFERENCES `medication_active_drug_names` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


# --- !Downs

ALTER TABLE `medications`
DROP FOREIGN KEY `fk_medications_medication_forms`;

DROP TABLE `medication_forms`;

ALTER TABLE `medications`
DROP COLUMN `medication_forms_id`,
DROP INDEX `fk_medications_medication_forms_idx` ;

ALTER TABLE `medication_medication_active_drugs`
DROP FOREIGN KEY `fk_medication_medication_active_drugs_medication_active_drugs`,
DROP FOREIGN KEY `fk_medication_medication_active_drugs_medications`;

DROP TABLE `medication_medication_active_drugs`;

ALTER TABLE `medication_active_drugs`
DROP FOREIGN KEY `fk_medication_active_drugs_medication_active_drug_names`,
DROP FOREIGN KEY `fk_medication_active_drugs_medication_measurement_units`;

DROP TABLE `medication_active_drugs`;

DROP TABLE `medication_active_drug_names`;

DROP TABLE `medication_measurement_units`;

