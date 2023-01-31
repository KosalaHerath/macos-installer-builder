# --- !Ups

ALTER TABLE `custom_fields`
ADD UNIQUE INDEX `order_UNIQUE` (`sort_order` ASC);

# --- !Downs

ALTER TABLE `custom_fields`
DROP INDEX `sort_order_UNIQUE` ;