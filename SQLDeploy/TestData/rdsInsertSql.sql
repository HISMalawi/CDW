-- Insert initial userid=0 user:
		SET FOREIGN_KEY_CHECKS=0;
				INSERT INTO `dev_rds`.`users`
				(
				user_id,
				system_id,
				`username`,
				`password`,
				`salt`,
				`secret_question`,
				`secret_answer`,
				`creator`,
				`date_created`,
				`changed_by`,
				`date_changed`,
				`person_id`,
				`retired`,
				`retired_by`,
				`date_retired`,
				`retire_reason`,
				`uuid`,
				`authentication_token`,
				`token_expiry_time`,
				`deactivated_on`,
				`created_at`,
				`updated_at`)
				VALUES
				(
					  0
					, 0
					, 'default_user' -- <{username: }>,
					, 'plaintext password' -- <{password: }>,
					, 'salty' -- <{salt: }>,
					, null -- <{secret_question: }>,
					, null -- <{secret_answer: }>,
					, 0  -- <{creator: 0}>,
					, CURDATE() -- <{date_created: CURRENT_TIMESTAMP}>,
					, null -- <{changed_by: }>,
					, null -- <{date_changed: }>,
					, null -- <{person_id: }>,
					, 0  -- <{retired: 0}>,
					, null -- <{retired_by: }>,
					, null -- <{date_retired: }>,
					, null -- <{retire_reason: }>,
					, UUID() -- <{uuid: }>,
					, null -- <{authentication_token: }>,
					, null -- <{token_expiry_time: }>,
					, null -- <{deactivated_on: }>,
					, CURDATE() -- <{created_at: }>,
					, CURDATE() -- <{updated_at: }>);
				);
		SET FOREIGN_KEY_CHECKS=1;

		update users 
			set user_id = 0
		where username = 'default_user';

-- Insert other users:
		INSERT INTO `dev_rds`.`users`
		(
		`username`,
		`password`,
		`salt`,
		`secret_question`,
		`secret_answer`,
		`creator`,
		`date_created`,
		`changed_by`,
		`date_changed`,
		`person_id`,
		`retired`,
		`retired_by`,
		`date_retired`,
		`retire_reason`,
		`uuid`,
		`authentication_token`,
		`token_expiry_time`,
		`deactivated_on`,
		`created_at`,
		`updated_at`)
		VALUES
		(
			'user3' -- <{username: }>,
			, 'plaintext password' -- <{password: }>,
			, 'salty' -- <{salt: }>,
			, null -- <{secret_question: }>,
			, null -- <{secret_answer: }>,
			, 0 -- <{creator: 0}>,
			, CURDATE() -- <{date_created: CURRENT_TIMESTAMP}>,
			, null -- <{changed_by: }>,
			, null -- <{date_changed: }>,
			, null -- <{person_id: }>,
			, 0 -- <{retired: 0}>,
			, null -- <{retired_by: }>,
			, null -- <{date_retired: }>,
			, null -- <{retire_reason: }>,
			, UUID() -- <{uuid: }>,
			, null -- <{authentication_token: }>,
			, null -- <{token_expiry_time: }>,
			, null -- <{deactivated_on: }>,
			, CURDATE() -- <{created_at: }>,
			, CURDATE() -- <{updated_at: }>);
		);

-- insert person
select * from dev_rds.person

			INSERT INTO `dev_rds`.`person`
			(
			`gender`,
			`birthdate`,
			`birthdate_estimated`,
			`dead`,
			`death_date`,
			`cause_of_death`,
			`creator`,
			`date_created`,
			`changed_by`,
			`date_changed`,
			`voided`,
			`voided_by`,
			`date_voided`,
			`void_reason`,
			`uuid`,
			`created_at`,
			`updated_at`)
			VALUES
			(
			'male' -- <{gender: }>,
			, '1982-01-01' -- <{birthdate: }>,
			, 50  -- <{birthdate_estimated: 0}>,
			, 1  -- <{dead: 0}>,
			, null  -- <{death_date: }>,
			, null  -- <{cause_of_death: }>,
			, 0  -- <{creator: 0}>,
			, CURDATE()  -- <{date_created: 1900-01-01 00:00:00}>,
			, null  -- <{changed_by: }>,
			, null  -- <{date_changed: }>,
			, 0  -- <{voided: 0}>,
			, null  -- <{voided_by: }>,
			, null  -- <{date_voided: }>,
			, null  -- <{void_reason: }>,
			, UUID()  -- <{uuid: }>,
			, CURDATE()  -- <{created_at: }>,
			, CURDATE()  -- <{updated_at: }>
			);

-- insert person name
			insert into dev_rds.person_name (
				preferred,
				person_id,
				prefix,
				given_name,
				middle_name,
				family_name_prefix,
				family_name,
				family_name2,
				family_name_suffix,
				degree,
				creator,
				date_created,
				voided,
				voided_by,
				date_voided,
				void_reason,
				changed_by,
				date_changed,
				uuid,
				created_at,
				updated_at
				)
				values (
				  1 -- as preferred,
				, 2 -- as person_id,
				, 'Mr.' -- as prefix,
				, 'Guy' -- as given_name,
				, 'Alias 1' -- as middle_name,
				, null -- as family_name_prefix,
				, 'Middleson' -- as family_name,
				, null -- as family_name2,
				, null -- as family_name_suffix,
				, null -- as degree,
				, 0 -- as creator,
				, CURDATE() -- as date_created,
				, 0 -- as voided,
				, null -- as voided_by,
				, null -- as date_voided,
				, null -- as void_reason,
				, null -- as changed_by,
				, null -- as date_changed,
				, UUID() -- as uuid,
				, CURDATE() -- as created_at,
				, CURDATE() -- as updated_at
				);

-- -------------- Tribe
INSERT INTO `dev_rds`.`tribe`
(
`retired`,
`name`)
VALUES
(
0 -- <{retired: 0}>,
, 'tribe1' -- <{name: }>);
);

select *
from tribe;

-- --------------  Patient
INSERT INTO `dev_rds`.`patient`
(
`tribe`,
`creator`,
`date_created`,
`changed_by`,
`date_changed`,
`voided`,
`voided_by`,
`date_voided`,
`void_reason`,
`created_at`,
`updated_at`)
VALUES
(
1 -- <{tribe: }>,
, 0 -- <{creator: 0}>,
, CURDATE() -- <{date_created: 1900-01-01 00:00:00}>,
, 0 -- <{changed_by: }>,
, CURDATE() -- <{date_changed: }>,
, 0 -- <{voided: 0}>,
, 0 -- <{voided_by: }>,
, CURDATE() -- <{date_voided: }>,
, 'reason1' -- <{void_reason: }>,
, CURDATE() -- <{created_at: }>,
, CURDATE() -- <{updated_at: }>)
);

select *
from patient;
-- --------------- Encounter Type
INSERT INTO `dev_rds`.`encounter_type`
(
`name`,
`description`,
`creator`,
`date_created`,
`retired`,
`retired_by`,
`date_retired`,
`retire_reason`,
`uuid`)
VALUES
(
'test encounter 1' -- <{name: }>,
, 'randome encounter record' -- <{description: }>,
, 0 -- <{creator: 0}>,
, CURDATE() -- <{date_created: 0000-00-00 00:00:00}>,
, 0 -- <{retired: 0}>,
, 0 -- <{retired_by: }>,
, CURDATE() -- <{date_retired: }>,
, 'my reason' -- <{retire_reason: }>,
, UUID() -- <{uuid: }>
);

select *
from encounter_type;

-- --------------- Encounter
INSERT INTO `dev_rds`.`encounter`
(
`encounter_type`,
`patient_id`,
`provider_id`,
`location_id`,
`form_id`,
`encounter_datetime`,
`creator`,
`date_created`,
`voided`,
`voided_by`,
`date_voided`,
`void_reason`,
`uuid`,
`changed_by`,
`date_changed`,
`program_id`,
`created_at`,
`updated_at`)
VALUES
(
1 -- <{encounter_type: }>,
, 2 -- <{patient_id: 0}>,
, 2  -- <{provider_id: 0}>,
, null  -- <{location_id: }>,
, null  -- <{form_id: }>,
, CURDATE() -- <{encounter_datetime: 1900-01-01 00:00:00}>,
, 0  -- <{creator: 0}>,
, CURDATE() -- <{date_created: 1900-01-01 00:00:00}>,
, 0  -- <{voided: 0}>,
, null  -- <{voided_by: }>,
, CURDATE() -- <{date_voided: }>,
, null  -- <{void_reason: }>,
, UUID() -- <{uuid: }>,
, null -- <{changed_by: }>,
, CURDATE() -- <{date_changed: }>,
, null -- <{program_id: }>,
, CURDATE() -- <{created_at: }>,
, CURDATE() -- <{updated_at: }>
);
select *
from encounter;

INSERT INTO `dev_rds`.`concept_class`
(
`name`,
`description`,
`creator`,
`date_created`,
`retired`,
`retired_by`,
`date_retired`,
`retire_reason`,
`uuid`)
VALUES
(
'test concept class' -- <{name: }>,
, 'desc of test concept class' -- <{description: }>,
, 0 -- <{creator: 0}>,
, CURDATE() -- <{date_created: 0000-00-00 00:00:00}>,
, 0 -- <{retired: 0}>,
, null -- <{retired_by: }>,
, CURDATE() -- <{date_retired: }>,
, null -- <{retire_reason: }>,
, UUID() -- <{uuid: }>
);

select *
from concept_class;

INSERT INTO `dev_rds`.`concept_datatype`
(
`name`,
`hl7_abbreviation`,
`description`,
`creator`,
`date_created`,
`retired`,
`retired_by`,
`date_retired`,
`retire_reason`,
`uuid`)
VALUES
(
'datatype 1' -- <{name: }>,
, null -- <{hl7_abbreviation: }>,
, 'test description' -- <{description: }>,
, 0 -- <{creator: 0}>,
, CURDATE() -- <{date_created: 0000-00-00 00:00:00}>,
, 0 -- <{retired: 0}>,
, null -- <{retired_by: }>,
, null -- <{date_retired: }>,
, null -- <{retire_reason: }>,
, UUID()  -- <{uuid: }>
);
select *
from concept_datatype;

INSERT INTO `dev_rds`.`concept`
(
concept_id,
`retired`,
`short_name`,
`description`,
`form_text`,
`datatype_id`,
`class_id`,
`is_set`,
`creator`,
`date_created`,
`default_charge`,
`version`,
`changed_by`,
`date_changed`,
`retired_by`,
`date_retired`,
`retire_reason`,
`uuid`)
VALUES
(
1344
, 0 -- <{retired: 0}>,
, 'Malaria diagnosis' -- <{short_name: }>,
, 'Diagnosis of malaria on the problem list' -- <{description: }>,
, null -- <{form_text: }>,
, 1 -- <{datatype_id: 0}>,
, 1 -- <{class_id: 0}>,
, 0 -- <{is_set: 0}>,
, 0 -- <{creator: 0}>,
, CURDATE() -- <{date_created: 0000-00-00 00:00:00}>,
, null -- <{default_charge: }>,
, null -- <{version: }>,
, null -- <{changed_by: }>,
, CURDATE() -- <{date_changed: }>,
, null -- <{retired_by: }>,
, CURDATE() -- <{date_retired: }>,
, null -- <{retire_reason: }>,
, UUID() -- <{uuid: }>
);

select *
from concept;

-- --------------- OBS
INSERT INTO `dev_rds`.`obs`
(
`person_id`,
`concept_id`,
`encounter_id`,
`order_id`,
`obs_datetime`,
`location_id`,
`obs_group_id`,
`accession_number`,
`value_group_id`,
`value_boolean`,
`value_coded`,
`value_coded_name_id`,
`value_drug`,
`value_datetime`,
`value_numeric`,
`value_modifier`,
`value_text`,
`date_started`,
`date_stopped`,
`comments`,
`creator`,
`date_created`,
`voided`,
`voided_by`,
`date_voided`,
`void_reason`,
`value_complex`,
`uuid`,
`created_at`,
`updated_at`)
VALUES
(
2 -- <{person_id: }>,  
, 6543 -- <{concept_id: 0}>, 
, 3 -- <{encounter_id: }>,
, null -- <{order_id: }>,
, CURDATE() -- <{obs_datetime: 1900-01-01 00:00:00}>,
, null -- <{location_id: }>,
, null -- <{obs_group_id: }>,
, null -- <{accession_number: }>,
, null -- <{value_group_id: }>,
, null -- <{value_boolean: }>,
, 1344 -- <{value_coded: }>,
, null -- <{value_coded_name_id: }>,
, null -- <{value_drug: }>,
, null -- <{value_datetime: }>,
, null -- <{value_numeric: }>,
, null -- <{value_modifier: }>,
, null -- <{value_text: }>,
, CURDATE() -- <{date_started: }>,
, CURDATE() -- <{date_stopped: }>,
, null -- <{comments: }>,
, 0 -- <{creator: 0}>,
, CURDATE() -- <{date_created: 1900-01-01 00:00:00}>,
, 0 -- <{voided: 0}>,
, null -- <{voided_by: }>,
, null -- <{date_voided: }>,
, null -- <{void_reason: }>,
, null -- <{value_complex: }>,
, UUID() -- <{uuid: }>,
, CURDATE() -- <{created_at: }>,
, CURDATE() -- <{updated_at: }>
);

select *
from obs;

SELECT en.encounter_id
	, max(case when c.short_name = 'primary_diagnosis' then ob.value_coded end) as primary_diagnosis
    , max(case when c.short_name = 'secondary_diagnosis' then ob.value_coded end) as secondary_diagnosis
    , max(en.encounter_datetime) encounter_datetime
    , max(en.created_at) created_at
    , max(en.updated_at) updated_at
FROM obs ob
JOIN encounter en
	ON ob.encounter_id = en.encounter_id
left join concept c
	on ob.concept_id = c.concept_id
WHERE ob.concept_id IN (6542,6543)
	and en.updated_at > '1900-01-01'
group by en.encounter_id

SELECT e.encounter_id
	, et.encounter_type_id
    , p.program_id
    , e.patient_id
    , e.encounter_datetime
    , e.voided
    , e.voided_by
    , e.date_voided
    , e.void_reason
    , e.date_created
    , e.date_changed
    , e.created_at
    , e.updated_at
FROM encounter e
	left join program p
		on e.program_id = p.program_id
	left join encounter_type et
		on e.encounter_type = et.encounter_type_id
where e.updated_at > '2019/12/14 00:00:00.000000000'


