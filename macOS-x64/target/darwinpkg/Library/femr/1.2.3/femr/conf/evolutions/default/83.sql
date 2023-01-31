# --- !Ups

UPDATE patient_prescriptions pp
INNER JOIN patient_encounters pe ON
	pp.encounter_id = pe.id
SET pp.date_dispensed = pe.date_of_pharmacy_visit
WHERE NOT EXISTS(
	SELECT * FROM patient_prescription_replacements ppr
    WHERE ppr.patient_prescription_id_original = pp.id
);

ALTER TABLE `mission_trips`
DROP COLUMN `isCurrent`;


# --- !Downs


UPDATE patient_prescriptions pp
SET pp.date_dispensed = NULL;

ALTER TABLE `mission_trips`
ADD COLUMN `isCurrent` BIT(1) NOT NULL DEFAULT b'0';
