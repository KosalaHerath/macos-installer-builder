# --- !Ups

CREATE  TABLE `patient_encounter_pmh_fields` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NULL ,
  `patient_encounter_id` INT NULL ,
  `pmh_field_id` INT NULL ,
  `pmh_field_value` VARCHAR(255) NULL ,
  `date_taken` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_patient_encounter_pmh_fields_user_id_users_id_idx` (`user_id` ASC) ,
  INDEX `fk_patient_encounter_pmh_field_id_pmh_fields_id_idx` (`pmh_field_id` ASC) ,
  INDEX `fk_patient_encounter_pmh_fields_patient_encounter_id_idx` (`patient_encounter_id` ASC) ,
  CONSTRAINT `fk_patient_encounter_pmh_fields_user_id_users_id`
  FOREIGN KEY (`user_id` )
  REFERENCES `users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_pmh_fields_pmh_field_id_pmh_fields_id`
  FOREIGN KEY (`pmh_field_id` )
  REFERENCES `pmh_fields` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_pmh_fields_patient_encounter_id`
  FOREIGN KEY (`patient_encounter_id` )
  REFERENCES `patient_encounters` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

# --- !Downs

DROP TABLE IF EXISTS `patient_encounter_pmh_fields`;