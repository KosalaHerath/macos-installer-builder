# --- !Ups

INSERT INTO `patient_prescription_replacements`
(
  `patient_prescription_id_original`,
  `patient_prescription_id_replacement`,
  `patient_prescription_replacement_reason_id`
)
  SELECT
    `pp`.`id`,
    `pp`.`replacement_id`,
    `pprr`.`id`
  FROM `patient_prescriptions` pp, `patient_prescription_replacement_reasons` pprr
  WHERE `replacement_id` IS NOT NULL
        AND `pprr`.`name` = 'pharmacist replacement';

# --- !Downs

UPDATE `patient_prescriptions` pp
  INNER JOIN `patient_prescription_replacements` ppr
    ON pp.`id` = ppr.`patient_prescription_id_original`
SET pp.`replacement_id` = ppr.`patient_prescription_id_replacement`;