-- ---------- dev_rds (working scratch file)
use dev_rds;

select *
from dev_rds.orders

select *
from dev_rds.regimen_drug_order

select *
from information_schema.columns
where column_name like '%identifier%'
	and table_schema = 'dev_rds'

select *
from information_schema.tables
where table_name like '%identifier%'
	and table_schema = 'dev_rds'

select order_id as lab_order_id
	, accession_number as tracking_number
    , start_date as order_date
    , encounter_id
    , creator
    , voided
    , voided_by
    , date_voided
    , void_reason
    , date_created
    , null as date_updated
    , created_at
    , updated_at
from dev_rds.orders
where updated_at >= '1900-01-01'


SELECT ob.obs_id as side_effect_id
	, ob.concept_id
    , ob.encounter_id
    , ob.value_coded
    , ob.voided
    , ob.voided_by
    , ob.date_voided
    , ob.void_reason
    , ob.date_created
    , null as date_changed
    , ob.updated_at
    , ob.created_at    
FROM obs ob
	join concept_name cn
		on ob.concept_id = cn.concept_id
where cn.name like '%side%'
	and ob.updated_at >= '1900-01-01'
    

select *
from information_schema.columns
where column_name like '%outcome_id%'
	and table_schema like '%dev_rds%'


