# --- !Ups

CREATE  TABLE `patient_encounter_vitals` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NOT NULL ,
  `patient_encounter_id` INT NOT NULL ,
  `vital_id` INT NOT NULL ,
  `vital_value` FLOAT NOT NULL ,
  `date_taken` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  INDEX `patient_encounter_id_idx` (`patient_encounter_id` ASC) ,
  INDEX `vital_id_idx` (`vital_id` ASC) ,
  CONSTRAINT `fk_patient_encounter_vitals_user_id_users_id`
  FOREIGN KEY (`user_id` )
  REFERENCES `users` (`id` ),
  CONSTRAINT `fk_patient_encounter_vitals_patient_encounter_id`       #properly named constraint not accepted -- too long
  FOREIGN KEY (`patient_encounter_id` )
  REFERENCES `patient_encounters` (`id` ),
  CONSTRAINT `fk_patient_encounter_vitals_vital_id_vitals_id`
  FOREIGN KEY (`vital_id` )
  REFERENCES `vitals` (`id` ));

# --- !Downs

DROP TABLE IF EXISTS `patient_encounter_vitals`