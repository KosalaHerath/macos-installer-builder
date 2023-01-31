# --- !Ups

ALTER TABLE `custom_fields`
DROP INDEX `order_UNIQUE` ;

# --- !Downs

ALTER TABLE `custom_fields`
ADD UNIQUE INDEX `sort_order_UNIQUE` (`sort_order` ASC);