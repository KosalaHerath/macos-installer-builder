# --- !Ups

ALTER TABLE `medication_inventories`
ADD COLUMN `timeAdded` DATETIME NULL,
ADD COLUMN `createdBy` INT(11) NULL;

# --- !Downs

ALTER TABLE `medication_inventories`
DROP COLUMN `timeAdded`,
DROP COLUMN `createdBy`;
