# --- !Ups

ALTER TABLE `patients`
ADD COLUMN `deleted_by_user_id` INT(11) NULL DEFAULT NULL  AFTER `isDeleted`;
ALTER TABLE `medication_inventories`
ADD COLUMN `isDeleted` DATETIME NULL DEFAULT NULL AFTER `medication_id`;

# --- !Downs

ALTER TABLE `patients`
DROP COLUMN `deleted_by_user_id`;
ALTER TABLE `medication_inventories`
DROP COLUMN `isDeleted`;

