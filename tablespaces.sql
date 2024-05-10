https://botonrojo.socio.gs/botonrojoasop/LoginDSI.aspx

--elimminar archivos por dias
find . -name 'ARC_KQCIFPRO1_23*' -type f -ctime +3 -exec rm {} \;

set linesize 121
SELECT tablespace_name,
ROUND( SUM (total_mb)) MBTOTAL,
ROUND( SUM (total_mb)- SUM (free_mb)) MB_USADO,
ROUND(( SUM (total_mb)- SUM (free_mb))/ SUM (total_mb)*100,2) PCT_USADO_MB,
ROUND( SUM (max_mb) - ( SUM (total_mb)- SUM (free_mb))) FREE_SPACE_MBMAX,
ROUND( SUM (max_mb)) MAXTOTAL,
ROUND(( SUM (total_mb)- SUM (free_mb))/ SUM (max_mb)*100,2) PORC_USADO_MAX
FROM (
SELECT tablespace_name, SUM (bytes)/1024/1024 FREE_MB,	
0 TOTAL_MB, 0 MAX_MB
FROM dba_free_space
GROUP BY tablespace_name
UNION ALL
SELECT tablespace_name, 0 CURRENT_MB,
SUM (bytes)/1024/1024 TOTAL_MB,
SUM ( DECODE (maxbytes,0,bytes, maxbytes))/1024/1024 MAX_MB
FROM dba_data_files GROUP BY tablespace_name)
WHERE tablespace_name = 'SYSAUX'
GROUP BY tablespace_name
ORDER BY PORC_USADO_MAX desc;

-- consulta discos
 col NAME for A19
select GROUP_NUMBER, NAME, STATE, TOTAL_MB/1024 AS TOTAL_GB, FREE_MB/1024 AS FREE_GB,
(100-((FREE_MB*100)/TOTAL_MB)) AS pct_used,
 (FREE_MB*100)/TOTAL_MB AS pct_free
 from v$asm_diskgroup where name = 'RMO_ARCHIVES'
order by pct_free asc;

SELECT * FROM (
  SELECT df.tablespace_name "Tablespace",
  totalusedspace "UsedMB",
  (df.totalspace - tu.totalusedspace) "FreeMB",
  df.totalspace "TotalMB",
  round(100 * ( (df.totalspace - tu.totalusedspace)/ df.totalspace)) "PctFree"
  FROM
  (SELECT tablespace_name,
    round(sum(bytes) / 1048576) TotalSpace
    FROM dba_data_files 
    GROUP BY tablespace_name) df,
  (SELECT round(sum(bytes)/(1024*1024)) totalusedspace, tablespace_name
    FROM dba_segments 
    GROUP BY tablespace_name) tu
  WHERE df.tablespace_name = tu.tablespace_name) tbsps
WHERE "PctFree" < 30 and "FreeMB" < 74,942 order by 3,5;

--- CONSULTA TBS ALERTA -------

select
df.tablespace_name "TABLESPACE_NAME",
100 - (round( ( (df.totalspace - tu.totalusedspace)/ df.totalspace)* 100,2)) "%_USADO",
ROUND (df.totalspace,2) "GB_TOTAL",
ROUND (totalusedspace,2) "GB_USADO",
ROUND ((df.totalspace) - (tu.totalusedspace),2) "GB_LIBRE"
from
(select tablespace_name,
round(sum(bytes) / 1024 / 1024 / 1024,2) TotalSpace
from dba_data_files
where tablespace_name in ('TPSFPROD_SOAINFRA')
group by tablespace_name) df,
(select round(sum(bytes)/(1024*1024*1024),2) totalusedspace, tablespace_name
from dba_segments
where tablespace_name in ('TPSFPROD_SOAINFRA')
group by tablespace_name) tu
where df.tablespace_name = tu.tablespace_name;


--Consulta datafiles de TBS especifico
col file_name for a90;
select file_name, AUTOEXTENSIBLE ,sum(bytes/1024/1024) from dba_data_files where tablespace_name='TPSFPROD_SOAINFRA'
group by file_name, AUTOEXTENSIBLE,bytes
order by bytes desc;

-- consulta discos
col NAME for A19
select GROUP_NUMBER, NAME, STATE, TOTAL_MB/1024 AS TOTAL_GB, FREE_MB/1024 AS FREE_GB,
(100-((FREE_MB*100)/TOTAL_MB)) AS pct_used,
(FREE_MB*100)/TOTAL_MB AS pct_free
from v$asm_diskgroup where name='DGSOASFPDATA'
order by pct_free asc;


+DGSOASHDATA/KQSOASH/DATAFILE/tpsoa_soainfra.284.1154031131

+DGSOASHDATA/KQSOASH/DATAFILE/tpsoa_soainfra.284.1154031131

alter database datafile '+DGSOASFPDATA/KQSOASFP/DATAFILE/tpsfprod_soainfra.288.1152346367' resize 8192M;    20480M;    32767M;   10240M; 15360M; 25600M;   5120M;


--Agregar datafile
ALTER TABLESPACE HS_SOAINFRA ADD DATAFILE '+DGSOAHSDATA' SIZE 10G;

ALTER TABLESPACE TBSINV_DATA ADD DATAFILE '+BMSDB_DATA' SIZE 32767M;



 col HEADER_STATUS for a15
 col name for a15
 col path for a40
 set lines 400
 select HEADER_STATUS, NAME, PATH, OS_MB,free_MB ,mount_status, mode_status state from v$asm_disk where HEADER_STATUS in ('PROVISIONED','FORMER') order by PATH;





---Agregar un disco a un grupo de discos desde grid
ssh grid@10.218.49.45

******No se setean variables********

sqlplus / as sysasm



 /dev/oracleasm/disks/DISKASM017
 /dev/oracleasm/disks/DISKASM017
 
ALTER DISKGROUP BMSDB_DATA ADD DISK 'ORCL:DRDASMRACKIODISK126' rebalance power 14;
                                          
set line 200
Select * from v$asm_operation;



 
select username,account_status,LOCK_DATE from dba_users where lock_date >= sysdate - 12/24 and NOT username = 'APPDYNAMICS_MON';





*****************************Depuracion SYAUX***********************

---Primer metodo

begin
dbms_audit_mgmt.clean_audit_trail(
audit_trail_type => dbms_audit_mgmt.audit_trail_unified,
use_last_arch_timestamp => false,
container => dbms_audit_mgmt.container_current);
end;
/

begin
for i in reverse 10..100
loop
dbms_stats.purge_stats(sysdate-i);
end loop;
end;
/


exec DBMS_AUDIT_MGMT.FLUSH_UNIFIED_AUDIT_TRAIL;

exec DBMS_STATS.PURGE_STATS(DBMS_STATS.PURGE_ALL);


-- Se gundo metodo --- Se aplica si no baja el tamaño
set pages 100;
col TRUNCATE for a60
select 'TRUNCATE TABLE ' || OWNER || '.'  || SEGMENT_NAME || ';'  as TRUNCATE
from dba_segments
where TABLESPACE_NAME='SYSAUX'
and SEGMENT_TYPE like 'TABLE%'
and SEGMENT_NAME like 'WRH%';
and bytes/1024/1024 > 1;

spool sysaux_purge.sql
set lines 500;
set pages 2000;
select 'TRUNCATE TABLE ' || OWNER || '.'  || SEGMENT_NAME || ';'  as TRUNCATE
from dba_segments
where TABLESPACE_NAME='SYSAUX'
and SEGMENT_TYPE like 'TABLE%'
and SEGMENT_NAME like 'WRH%';
and bytes/1024/1024 > 1;
spool off;
set echo on; 
set timing on;
@sysaux_purge.sql

----depurar system

set pages 100;
col TRUNCATE for a60
select 'TRUNCATE TABLE ' || OWNER || '.'  || SEGMENT_NAME || ';'  as TRUNCATE
from dba_segments
where TABLESPACE_NAME='SYSTEM'
and SEGMENT_TYPE like 'TABLE%'
and SEGMENT_NAME like 'AUD$%';
and bytes/1024/1024 > 1;



set pages 100;
col TRUNCATE for a60
select 'TRUNCATE TABLE ' || OWNER || '.'  || SEGMENT_NAME || ';'  as TRUNCATE
from dba_segments
where TABLESPACE_NAME='TS_DATOS_SABD_001'
and SEGMENT_TYPE like 'TABLE%'
and bytes/1024/1024 > 1;


col owner for a15
col segment_name for a50
select * from
(select owner,segment_name||'~'||partition_name segment_name,bytes/(1024*1024) size_m
from dba_segments
where tablespace_name = 'TS_DATOS_SABD_001' ORDER BY BLOCKS desc) where rownum < 6;

SELECT COUNT(*) FROM SYS.SABD_ACCESOHIST;

select
df.tablespace_name "TABLESPACE_NAME",
100 - (round( ( (df.totalspace - tu.totalusedspace)/ df.totalspace)* 100,2)) "%_USADO",
ROUND (df.totalspace,2) "MB_TOTAL",
ROUND (totalusedspace,2) "MB_USADO",
ROUND ((df.totalspace) - (tu.totalusedspace),2) "MB_LIBRE"
from
(select tablespace_name,
round(sum(bytes) / 1024 / 1024,2) TotalSpace
from dba_data_files
where tablespace_name in ('SYSAUX')
group by tablespace_name) df,
(select round(sum(bytes)/(1024*1024),2) totalusedspace, tablespace_name
from dba_segments
where tablespace_name in ('SYSAUX')
group by tablespace_name) tu
where df.tablespace_name = tu.tablespace_name;



--- validar status de la base -----
set lines 200
set pages 500
col NAME for a10
col OPEN_MODE for a30
col DATABASE_ROLE for a20
select name,open_mode,database_role from gv$database;




----- consulta tbs tbs_usage ----
col TIME_TAKEN_DISPLAY for a20
 set lines 180
 SELECT tablespace_name,
 ROUND( SUM (total_mb)) MBTOTAL,
 ROUND( SUM (total_mb)- SUM (free_mb)) MB_USADO,
 ROUND(( SUM (total_mb)- SUM (free_mb))/ SUM (total_mb)*100) PCT_USADO_MB,
 ROUND( SUM (max_mb) - ( SUM (total_mb)- SUM (free_mb))) FREE_SPACE_MBMAX,
 ROUND( SUM (max_mb)) MAXTOTAL,
 ROUND(( SUM (total_mb)- SUM (free_mb))/ SUM (max_mb)*100) PORC_USADO_MAX
 FROM (
 SELECT tablespace_name, SUM (bytes)/1024/1024 FREE_MB,
 0 TOTAL_MB, 0 MAX_MB
 FROM dba_free_space
 GROUP BY tablespace_name
 UNION ALL
 SELECT tablespace_name, 0 CURRENT_MB,
 SUM (bytes)/1024/1024 TOTAL_MB,
 SUM ( DECODE (maxbytes,0,bytes, maxbytes))/1024/1024 MAX_MB
 FROM dba_data_files GROUP BY tablespace_name)
 GROUP BY tablespace_name
 ORDER BY PORC_USADO_MAX desc;
 
 
 
 
 -----------------Procesos y transacciones

col INST_ID for a10
col resource_name for a20
col current_utilization for a20
col max_utilization for a20
col limit_value for a20
select to_char(INST_ID)INST_ID, resource_name, to_char(current_utilization)current_utilization, to_char(max_utilization)max_utilization, limit_value 
       from gv$resource_limit 
       where resource_name in ('processes', 'sessions', 'transactions')
     order by 1,2;	

