# --- !Ups

ALTER TABLE `users`
ADD COLUMN `isPasswordReset` BIT(1) NOT NULL DEFAULT 0 AFTER `isDeleted` ;

# --- !Downs

ALTER TABLE `users`
DROP COLUMN `isPasswordReset` ;

