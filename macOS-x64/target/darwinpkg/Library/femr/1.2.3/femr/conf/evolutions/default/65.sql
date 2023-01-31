# --- !Ups

ALTER TABLE `users`
ADD COLUMN `notes` VARCHAR(255) NULL DEFAULT NULL AFTER `isPasswordReset`;

# --- !Downs

ALTER TABLE `users`
DROP COLUMN `notes`;