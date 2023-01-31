# --- !Ups

ALTER TABLE `photos`
ADD COLUMN `photo` LONGBLOB NULL AFTER `insertTS`;

# --- !Downs

ALTER TABLE `photos` DROP COLUMN `photo`;