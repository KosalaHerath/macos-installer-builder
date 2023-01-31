# --- !Ups

ALTER TABLE `custom_fields`
ADD COLUMN `sort_order` INT NULL AFTER `custom_size_id`;

# --- !Downs

ALTER TABLE `custom_fields`
DROP COLUMN `sort_order`;