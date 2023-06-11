# --- !Ups

CREATE TABLE `concept_medications` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `isDeleted` BIT(1) NULL DEFAULT b'0',
  `concept_medication_form_id` INT(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_concept_medications_concept_medication_forms_idx` (`concept_medication_form_id` ASC),
  CONSTRAINT `fk_concept_medications_concept_medication_forms`
    FOREIGN KEY (`concept_medication_form_id`)
    REFERENCES `concept_medication_forms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `concept_medication_generics` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

CREATE TABLE `concept_medication_generic_strengths` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `concept_medication_unit_id` INT(11) UNSIGNED NOT NULL,
  `concept_medication_generic_id` INT(11) NOT NULL,
  `isDenominator` BIT(1) NOT NULL DEFAULT b'0',
  `value` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_concept_generic_strengths_concept_units_idx` (`concept_medication_unit_id` ASC),
  INDEX `fk_concept_generic_strengths_concept_generics_idx` (`concept_medication_generic_id` ASC),
  CONSTRAINT `fk_concept_generic_strengths_concept_units`
  FOREIGN KEY (`concept_medication_unit_id`)
  REFERENCES `concept_medication_units` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_concept_generic_strengths_concept_generics`
  FOREIGN KEY (`concept_medication_generic_id`)
  REFERENCES `concept_medication_generics` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `concept_medication_concept_generic_strengths` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `concept_medication_id` INT(11) NOT NULL,
  `concept_medication_generic_strength_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_concept_medication_concept_generic_strengths_idx` (`concept_medication_generic_strength_id` ASC),
  INDEX `fk_concept_generic_strengths_concept_medications_idx` (`concept_medication_id` ASC),
  CONSTRAINT `fk_concept_medication_concept_generic_strengths`
  FOREIGN KEY (`concept_medication_generic_strength_id`)
  REFERENCES `concept_medication_generic_strengths` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_concept_generic_strengths_concept_medications`
  FOREIGN KEY (`concept_medication_id`)
  REFERENCES `concept_medications` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);





# --- !Downs

DROP TABLE `concept_medication_concept_generic_strengths`;

DROP TABLE `concept_medication_generic_strengths`;

DROP TABLE `concept_medication_generics`;

DROP TABLE `concept_medications`;
