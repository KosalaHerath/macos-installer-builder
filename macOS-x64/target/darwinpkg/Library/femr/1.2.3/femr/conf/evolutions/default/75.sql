# --- !Ups

CREATE TABLE `login_attempts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL,
  `ip_address` BINARY(16) NOT NULL,
  `date` DATETIME NOT NULL,
  `isSuccessful` BIT(1) NOT NULL,
  `username_attempt` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `login_attempts_user_id_users_id`
    FOREIGN KEY (`id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `medication_administrations` ADD `daily_modifier` DECIMAL(5, 2) NOT NULL;

ALTER TABLE `patient_prescriptions`
DROP FOREIGN KEY `fk_patient_prescriptions_medication_administrations`;

ALTER TABLE `medication_administrations`
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ,
ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC);

ALTER TABLE `patient_prescriptions`
CHANGE COLUMN `medication_administrations_id` `medication_administrations_id` INT(11) NULL DEFAULT NULL ;

ALTER TABLE `patient_prescriptions`
ADD CONSTRAINT `fk_patient_prescriptions_medication_administrations`
FOREIGN KEY (`medication_administrations_id`)
REFERENCES `medication_administrations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `patient_encounters`
ADD COLUMN `user_id_diabetes_screen` INT(11) NULL DEFAULT NULL,
ADD COLUMN `date_of_diabetes_screen` DATETIME NULL DEFAULT NULL,
ADD INDEX `fk_patient_encounters_user_id_users_id_diabetes_idx` (`user_id_diabetes_screen` ASC);
ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_patient_encounters_user_id_users_id_diabetes`
  FOREIGN KEY (`user_id_diabetes_screen`)
  REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

DROP TABLE `login_attempts`;

ALTER TABLE `medication_administrations` DROP COLUMN `daily_modifier`;

ALTER TABLE `patient_prescriptions`
DROP FOREIGN KEY `fk_patient_prescriptions_medication_administrations`;

ALTER TABLE `medication_administrations`
CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL ,
DROP INDEX `id_UNIQUE` ;

ALTER TABLE `patient_prescriptions`
CHANGE COLUMN `medication_administrations_id` `medication_administrations_id` INT(11) UNSIGNED NULL ;


  ALTER TABLE `patient_prescriptions`
ADD CONSTRAINT `fk_patient_prescriptions_medication_administrations`
FOREIGN KEY (`medication_administrations_id`)
REFERENCES `medication_administrations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_patient_encounters_user_id_users_id_diabetes`;
ALTER TABLE `patient_encounters`
DROP COLUMN `date_of_diabetes_screen`,
DROP COLUMN `user_id_diabetes_screen`,
DROP INDEX `fk_patient_encounters_user_id_users_id_diabetes_idx` ;
