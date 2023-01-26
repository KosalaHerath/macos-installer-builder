# --- !Ups

ALTER TABLE `users`
ADD COLUMN `last_login` DATETIME NOT NULL AFTER `password`;

UPDATE `users`
SET last_login = '9999-01-01'

# --- !Downs

ALTER TABLE `users`
DROP COLUMN `last_login`;


