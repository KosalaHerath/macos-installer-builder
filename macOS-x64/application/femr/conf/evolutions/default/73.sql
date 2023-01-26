# --- !Ups

ALTER TABLE `users`
CHANGE COLUMN `last_login` `last_login` DATETIME NULL;

ALTER TABLE `chief_complaints`
ADD COLUMN `sort_order` INT NULL AFTER `patient_encounter_id`;

# --- !Downs

UPDATE `users`	SET `last_login` = now() WHERE `last_login` is NULL;

ALTER TABLE `users`
CHANGE COLUMN `last_login` `last_login` DATETIME NOT NULL;

ALTER TABLE `chief_complaints`
DROP COLUMN `sort_order`;

