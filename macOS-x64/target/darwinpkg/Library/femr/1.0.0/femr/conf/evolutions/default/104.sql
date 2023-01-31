# --- !Ups

ALTER TABLE `patient_encounter_tab_fields`
ADD COLUMN `IsDeleted` DATETIME NULL AFTER `chief_complaint_id`,
ADD COLUMN `DeletedByUserId` INTEGER NULL AFTER `IsDeleted`,
ADD CONSTRAINT `fk_deleted_by_user_id_id`
FOREIGN KEY (`DeletedByUserId`)
REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

ALTER TABLE `patient_encounter_tab_fields`
DROP COLUMN `IsDeleted`,
DROP FOREIGN KEY `fk_deleted_by_user_id_id`,
DROP COLUMN `DeletedByUserId`;