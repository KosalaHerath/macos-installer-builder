# --- !Ups

UPDATE `vitals`
SET `name`='bloodPressureDiastolic'
WHERE `id`='9';

# --- !Downs

UPDATE `vitals`
SET `name`='bloodPressureDiasolic'
WHERE `id`='9';
