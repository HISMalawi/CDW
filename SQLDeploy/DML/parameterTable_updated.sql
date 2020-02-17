/*
Description:
	DML for Dev parameter table
		
	Set @UpdateAction to 'report' or 'update'

*/
use dev_ids;

select @UpdateAction 'report'; 	--  'report' or 'update'

CREATE TABLE `audit_etl_parameter` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `datatype` varchar(10) DEFAULT NULL,
  `description` text,
  `createdate` datetime DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `audit_pentaho_job_log` (
  `ID_JOB` int(11) DEFAULT NULL,
  `CHANNEL_ID` varchar(255) DEFAULT NULL,
  `JOBNAME` varchar(255) DEFAULT NULL,
  `STATUS` varchar(15) DEFAULT NULL,
  `LINES_READ` bigint(20) DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) DEFAULT NULL,
  `LINES_UPDATED` bigint(20) DEFAULT NULL,
  `LINES_INPUT` bigint(20) DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) DEFAULT NULL,
  `LINES_REJECTED` bigint(20) DEFAULT NULL,
  `ERRORS` bigint(20) DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `ENDDATE` datetime DEFAULT NULL,
  `LOGDATE` datetime DEFAULT NULL,
  `DEPDATE` datetime DEFAULT NULL,
  `REPLAYDATE` datetime DEFAULT NULL,
  `LOG_FIELD` longtext,
  KEY `IDX_pentaho_job_log_1` (`ID_JOB`),
  KEY `IDX_pentaho_job_log_2` (`ERRORS`,`STATUS`,`JOBNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop temporary table if exists Parameter;

create temporary table Parameter (
	id int,
	name varchar(150) NULL,
	value varchar(500) NULL,
	datatype varchar(10) NULL,
	description text NULL,
	createdate datetime NULL,
	lastupdatedate datetime NULL
);

insert into Parameter
	(  id
      ,name
      ,value
      ,datatype
      ,description
      ,createdate
      ,lastupdatedate
	  )
--		   Parameter Name						  Parameter Value
select 1, 'jobLogTableName'							, 'audit_pentaho_job_log'	, 'string', 'log table name. Also passed on command line.'	, '2019-12-13', '2019-12-13'  union
select 2, 'transformationLogTableName'				, 'audit_pentaho_job_log'	, 'string', 'log table name. Also passed on command line.'	, '2019-12-13', '2019-12-13'  union
select 3, 'minDate'									, '1900-01-01'				, 'string', 'min date to use for comparisons'	, '2019-12-13', '2019-12-13'  

;

---------------- Update actions
		-- values to insert
		insert into audit_etl_parameter
			select src.*
			from Parameter src
				left join audit_etl_parameter trgt
					on src.id = trgt.id
			where trgt.id is null;

		-- values to update:
		--update audit_etl_parameter trgt
		--	inner join Parameter src on trgt.id = src.id        
		--set trgt.name = src.name
		--	, trgt.value = src.value
		--	, trgt.datatype = src.datatype
		--	, trgt.description = src.description
		--	, trgt.createdate = src.createdate
		--	, trgt.lastupdatedate = src.lastupdatedate
		--where
		--   src.name <> trgt.name
		--	or src.value <> trgt.value
		--	or src.datatype <> trgt.datatype
		--	or src.description <> trgt.description
		--	or src.createdate <> trgt.createdate
		--	or src.lastupdatedate <> trgt.lastupdatedate ;

		
		-- values to delete:
		--delete audit_etl_parameter
		--from Parameter src
		--	right join trgt
		--		on src.id = trgt.id
		--where src.id is null


