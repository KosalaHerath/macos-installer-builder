# --- !Ups

UPDATE `tab_fields`
SET name="procedure_counseling"
WHERE name="treatment"

# --- !Downs

UPDATE `tab_fields`
SET name="treatment"
WHERE name="procedure_counseling"
