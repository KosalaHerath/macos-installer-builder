# --- !Ups

ALTER TABLE `custom_tabs`
ADD COLUMN `left_column_size` INT NOT NULL DEFAULT 0 AFTER `isDeleted`,
ADD COLUMN `right_column_size` INT NOT NULL DEFAULT 0 AFTER `left_column_size`;

# --- !Downs

ALTER TABLE `custom_tabs`
DROP COLUMN `right_column_size`,
DROP COLUMN `left_column_size`;