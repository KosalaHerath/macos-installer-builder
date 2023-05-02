# --- !Ups

ALTER TABLE `users`
ADD COLUMN `isDeleted` BIT(1) NOT NULL DEFAULT 0  AFTER `last_login` ;

ALTER TABLE `treatment_fields`
ADD COLUMN `isDeleted` BIT(1) NOT NULL DEFAULT 0  AFTER `name` ;

ALTER TABLE `vitals`
ADD COLUMN `isDeleted` BIT(1) NOT NULL DEFAULT 0  AFTER `unit_of_measurement` ;

ALTER TABLE `pmh_fields`
ADD COLUMN `isDeleted` BIT(1) NOT NULL DEFAULT 0  AFTER `name` ;

ALTER TABLE `hpi_fields`
ADD COLUMN `isDeleted` BIT(1) NOT NULL DEFAULT 0  AFTER `name` ;

# --- !Downs

ALTER TABLE `users`
DROP COLUMN `isDeleted` ;

ALTER TABLE `treatment_fields`
DROP COLUMN `isDeleted` ;

ALTER TABLE `vitals`
DROP COLUMN `isDeleted` ;

ALTER TABLE `pmh_fields`
DROP COLUMN `isDeleted` ;

ALTER TABLE `hpi_fields`
DROP COLUMN `isDeleted` ;
