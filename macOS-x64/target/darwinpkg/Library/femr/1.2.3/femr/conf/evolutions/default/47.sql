# --- !Ups

ALTER TABLE `custom_fields`
ADD COLUMN `isDeleted` BIT(1) NOT NULL DEFAULT 0 AFTER `custom_type_id`;

# --- !Downs

ALTER TABLE `custom_fields`
DROP COLUMN `isDeleted`;