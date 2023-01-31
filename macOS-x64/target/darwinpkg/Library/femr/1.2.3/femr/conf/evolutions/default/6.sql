# --- !Ups

CREATE  TABLE `patient_encounters` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `patient_id` INT NOT NULL ,
  `user_id` INT NOT NULL ,
  `date_of_visit` DATETIME NOT NULL ,
  `chief_complaint` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `ID_UNIQUE` (`id` ASC) ,
  INDEX `patient_id_idx` (`patient_id` ASC) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_patient_encounter_patient_id_patients_id`
  FOREIGN KEY (`patient_id` )
  REFERENCES `patients` (`id` ),
  CONSTRAINT `fk_patient_encounter_user_id_users_id`
  FOREIGN KEY (`user_id` )
  REFERENCES `users` (`id` ));

# --- !Downs

DROP TABLE IF EXISTS `patient_encounters`;