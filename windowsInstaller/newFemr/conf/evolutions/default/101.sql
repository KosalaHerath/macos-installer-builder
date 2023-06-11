# --- !Ups

ALTER TABLE `system_settings` ADD COLUMN description VARCHAR(250);

# --- !Downs

ALTER TABLE `system_settings` DROP COLUMN `description`;
