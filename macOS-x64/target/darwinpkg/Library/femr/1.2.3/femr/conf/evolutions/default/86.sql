# --- !Ups

ALTER TABLE `patients`
ADD COLUMN `isDeleted` DATETIME NULL DEFAULT NULL AFTER `photo_id`;

# --- !Downs

ALTER TABLE `patients`
DROP COLUMN `isDeleted`;
