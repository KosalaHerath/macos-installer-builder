# --- !Ups

SET @code=0;
UPDATE chief_complaints
SET sort_order = (SELECT @code:=@code+1 AS code);

# --- !Downs

UPDATE chief_complaints
SET sort_order = NULL;