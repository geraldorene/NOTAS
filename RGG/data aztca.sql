ssh oracle@10.213.10.10

tail -300f /oradump/diag/rdbms/bbrdgazt/BBRMPAZT1/trace/alert_BBRMPAZT1.log


---ENTRAR A BROKER
dgmgrl /
---VER LAS BASES DISPONIBLES
show configuration
----ACTIVAR
EDIT DATABASE 'BBRDGAZT' SET STATE='APPLY-ON';
----DESACTIVAR
EDIT DATABASE  	'BBRDGAZT' SET STATE='APPLY-OFF';
----VALIDACION
show database verbose 'BBRDGAZT';
---Verificar secuencia DG
select max(sequence#) from v$archived_log where applied='YES';
!hostname -i; date
---Verificar secuencia PROD
select max(sequence#) from v$archived_log;
!hostname -i; date
)

EDIT DATABASE  'BBRMPMTYDG' SET STATE='APPLY-OFF';
show database verbose 'BBRMPMTYDG';
Activar replica

-DG
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE disconnect from session;

ALTER DATABASE RECOVER MANAGED STANDBY DATABASE disconnect from session;


SELECT ARCH.THREAD# "Thread", ARCH.SEQUENCE# "Last Sequence Received", APPL.SEQUENCE# "Last Sequence Applied", (ARCH.SEQUENCE# - APPL.SEQUENCE#) "Difference"
FROM (SELECT THREAD# ,SEQUENCE# FROM V$ARCHIVED_LOG WHERE (THREAD#,FIRST_TIME ) IN (SELECT THREAD#,MAX(FIRST_TIME) FROM V$ARCHIVED_LOG GROUP BY THREAD#)) ARCH,
(SELECT THREAD# ,SEQUENCE# FROM V$LOG_HISTORY WHERE (THREAD#,FIRST_TIME ) IN (SELECT THREAD#,MAX(FIRST_TIME) FROM V$LOG_HISTORY GROUP BY THREAD#)) APPL
WHERE ARCH.THREAD# = APPL.THREAD#;


-- colocar BD en READ ONLY
ALTER DATABASE OPEN READ ONLY;
ALTER DATABASE OPEN READ ONLY WITH APPLY;

--- Iniciar nuevamente sincronización
alter database recover managed standby database disconnect from session;


--- Consultar que este en READ ONLY
set lines 200
set pages 500
col NAME for a10
col OPEN_MODE for a30
col DATABASE_ROLE for a20
select name,open_mode,database_role from gv$database;


1.- Validar secuencias 

-PRIMARY
cd scripts_m
@prod-seq
cd /home/oracle/scripts/DG;while true; do ./monit_DG_AZTECANEW.sh; sleep 300;done

 
-DG
cd scripts_m
@dg-seq


.- Monitoreo de réplica
-PRIMARY
select max(sequence#) from v$archived_log;

 -DG
select max(sequence#) from v$archived_log where applied='YES';
C4rL0zLuj4n#3

2.- Desactivar replica 
 -DG
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;

BCK_20231101_FULL_BBRMPAZT_732adjhk_163043_1_1 oracle@10.215.148.150:/backup/BBRMPAZT/RMAN


-PRIMARY
ALTER SYSTEM SET LOG_ARCHIVE_DEST_STATE_2=DEFER scope=both;

3- Activar replica
-PRIMARY
ALTER SYSTEM SET LOG_ARCHIVE_DEST_STATE_2=ENABLE scope=both ;

 -DG
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE disconnect from session;


en mechinga
ruta

cd /home/oracle/scripts_m/check

logs de manera manual

template
https://docs.google.com/document/d/1PHLSPI1K1tOQ8wB9V1SuhlCH9IuJRjDPrZr_QO3S-5I/edit#


se envia correo a las siguientes personas
gabriela.espinoza@totalplay.com.mx,heriberto.martinez@i-condor.com,bd-oracle@totalplay.com.mx,jericot.ramos@totalplay.com.mx


col MACHINE format a40
col RESOURCE_NAME for a20
col VALUE for a20
col distributed_lock_timeout format a40
select INST_ID, resource_name, current_utilization, max_utilization, limit_value from gv$resource_limit where resource_name in ('sessions','processes','transactions')
order by resource_name, INST_ID;

select INST_ID,STATUS , count(*) from gv$session where STATUS in ('ACTIVE') group by INST_ID,STATUS order by 1,2;


Tue May 02 19:18:25 2023
Media Recovery Log +SWO_ARCHIVES/bswopaztdg/archivelog/2023_05_02/thread_2_seq_47534.348.1135793903
File #41 added to control file as 'UNNAMED00041' because
the parameter STANDBY_FILE_MANAGEMENT is set to MANUAL
The file should be manually created to continue.
Errors with log +SWO_ARCHIVES/bswopaztdg/archivelog/2023_05_02/thread_2_seq_47534.348.1135793903
MRP0: Background Media Recovery terminated with error 1274
Errors in file /oradump/diag/rdbms/bswopaztdg/BSWOPAZT1/trace/BSWOPAZT1_pr00_86220.trc:
ORA-01274: cannot add datafile '+SWO_DATA001/bswopazt/datafile/tppagosmidl_data.334.1135793461' - file could not be created
Recovery interrupted!
Recovered data files to a consistent state at change 11288147241575
Tue May 02 19:18:31 2023
Reconfiguration started (old inc 13, new inc 15)



--seteo de variables    . oraenv


SELECT ARCH.THREAD# "Thread", ARCH.SEQUENCE# "Last Sequence Received", APPL.SEQUENCE# "Last Sequence Applied", (ARCH.SEQUENCE# - APPL.SEQUENCE#) "Difference"
FROM (SELECT THREAD# ,SEQUENCE# FROM V$ARCHIVED_LOG WHERE (THREAD#,FIRST_TIME ) IN (SELECT THREAD#,MAX(FIRST_TIME) FROM V$ARCHIVED_LOG GROUP BY THREAD#)) ARCH,
(SELECT THREAD# ,SEQUENCE# FROM V$LOG_HISTORY WHERE (THREAD#,FIRST_TIME ) IN (SELECT THREAD#,MAX(FIRST_TIME) FROM V$LOG_HISTORY GROUP BY THREAD#)) APPL
WHERE ARCH.THREAD# = APPL.THREAD#;










