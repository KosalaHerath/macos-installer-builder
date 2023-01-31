# --- !Ups

CREATE  TABLE `patient_encounter_treatment_fields` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NOT NULL ,
  `patient_encounter_id` INT NOT NULL ,
  `treatment_field_id` INT NOT NULL ,
  `treatment_field_value` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_patient_encounter_treatment_fields_user_id_users_id_idx` (`user_id` ASC) ,
  INDEX `fk_patient_encounter_treatment_fields_patient_encounter_id_idx` (`patient_encounter_id` ASC) ,
  INDEX `fk_patient_encounter_treatment_fields_treatment_id_idx` (`treatment_field_id` ASC) ,
  CONSTRAINT `fk_patient_encounter_treatment_fields_user_id_users_id`
    FOREIGN KEY (`user_id` )
    REFERENCES `users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_treatment_fields_patient_encounter_id`
    FOREIGN KEY (`patient_encounter_id` )
    REFERENCES `patient_encounters` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_treatment_fields_treatment_id`
    FOREIGN KEY (`treatment_field_id` )
    REFERENCES `treatment_fields` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

# --- !Downs

DROP TABLE IF EXISTS `patient_encounter_treatment_fields`