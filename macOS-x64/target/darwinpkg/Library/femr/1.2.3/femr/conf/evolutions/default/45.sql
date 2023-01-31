# --- !Ups

CREATE TABLE `custom_field_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

  CREATE TABLE `custom_tabs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `user_id` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_custom_tabs_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_custom_tabs_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

  CREATE TABLE `custom_fields` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `user_id` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `custom_tab_id` INT NOT NULL,
  `custom_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_custom_fields_custom_tab_id_idx` (`custom_tab_id` ASC),
  INDEX `fk_custom_fields_custom_type_id_idx` (`custom_type_id` ASC),
  INDEX `fk_custom_fields_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_custom_fields_custom_tab_id`
    FOREIGN KEY (`custom_tab_id`)
    REFERENCES `custom_tabs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_fields_custom_type_id`
    FOREIGN KEY (`custom_type_id`)
    REFERENCES `custom_field_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_fields_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `patient_encounter_custom_fields` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `patient_encounter_id` INT NOT NULL,
  `custom_field_id` INT NOT NULL,
  `custom_field_value` VARCHAR(255) NOT NULL,
  `date_taken` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_patient_encounter_custom_fields_user_id_idx` (`user_id` ASC),
  INDEX `fk_patient_encounter_custom_fields_pe_id_idx` (`patient_encounter_id` ASC),
  INDEX `fk_patient_encounter_custom_fields_custom_field_id_idx` (`custom_field_id` ASC),
  CONSTRAINT `fk_patient_encounter_custom_fields_user_id`
  FOREIGN KEY (`user_id`)
  REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_custom_fields_pe_id`
  FOREIGN KEY (`patient_encounter_id`)
  REFERENCES `patient_encounters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_custom_fields_custom_field_id`
  FOREIGN KEY (`custom_field_id`)
  REFERENCES `custom_fields` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




# --- !Downs

DROP TABLE `patient_encounter_custom_fields`;
DROP TABLE `custom_fields`;
DROP TABLE `custom_tabs`;
DROP TABLE `custom_field_types`;




