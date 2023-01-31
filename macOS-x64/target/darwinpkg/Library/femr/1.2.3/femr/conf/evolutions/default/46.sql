# --- !Ups

ALTER TABLE `custom_tabs`
ADD COLUMN `isDeleted` BIT(1) NOT NULL DEFAULT 0 AFTER `date_created`,
ADD UNIQUE INDEX `name_UNIQUE` (`name` ASC);

# --- !Downs

ALTER TABLE `custom_tabs`
DROP COLUMN `isDeleted`,
DROP INDEX `name_UNIQUE` ;