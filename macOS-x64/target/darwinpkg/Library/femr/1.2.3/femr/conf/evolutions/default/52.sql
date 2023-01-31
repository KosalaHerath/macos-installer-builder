# --- !Ups

ALTER TABLE `custom_fields`
ADD COLUMN `placeholder` VARCHAR(255) NULL AFTER `sort_order`;

# --- !Downs

ALTER TABLE `custom_fields`
DROP COLUMN `placeholder`;