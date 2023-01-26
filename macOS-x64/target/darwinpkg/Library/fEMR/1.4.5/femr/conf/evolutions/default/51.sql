# --- !Ups

ALTER TABLE `custom_fields`
ADD UNIQUE INDEX `name_UNIQUE` (`name` ASC);

# --- !Downs

ALTER TABLE `custom_fields`
DROP INDEX `name_UNIQUE` ;