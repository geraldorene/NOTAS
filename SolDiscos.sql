----# CRECIMIENTO POR MES POR TBS tbs

Select T.NAME "Tablespace",
  to_char(D.CREATION_TIME, 'RRRR Month')"Mes",
  round(sum(bytes) / 1024 / 1024 / 1024,2) CRECANYGB
From V$Datafile D, V$Tablespace T
Where  D.TS#=T.TS#
AND to_char(D.CREATION_TIME, 'RRRR Month') like '%23%' 
--AND to_char(D.CREATION_TIME, 'RRRR Month') like '%August%' 
Group By T.NAME, to_char(D.CREATION_TIME, 'RRRR Month')
Order By 2, 1;

col "Tablespace" for a20

Select T.NAME "Tablespace",
	to_char(D.CREATION_TIME, 'RRRR Month') "Mes",
	round(sum(D.BYTES)/1048576) CRECANYMB
From V$Datafile D, V$Tablespace T
Where	D.TS#=T.TS#
Group By T.NAME, to_char(D.CREATION_TIME, 'RRRR Month')
Order By 1, 2;


Select T.NAME "Tablespace",
	to_char(D.CREATION_TIME, 'RRRR Month') "Mes",
	round(sum(D.BYTES)/1048576) CRECANYMB
From V$Datafile D, V$Tablespace T
Where	D.TS#=T.TS# and D.CREATION_TIME LIKE '2023%'
Group By T.NAME, to_char(D.CREATION_TIME, 'RRRR Month')
Order By 1, 2;

---por datafile
col name for a60
select	name,
	to_char(creation_time, 'RRRR Month') "Mes",
	round(sum(bytes)/(1048576*1024)) "Crecimiento (Gb)"
from V$Datafile
group by name, to_char(creation_time, 'RRRR Month')
order by 2, 1;


col name for a60
select	name,
	to_char(creation_time, 'RRRR Month') "Mes",
	round(sum(bytes)/(1048576*1024)) "Crecimiento (Gb)"
from V$Datafile where creation_time like '%23'
group by name, to_char(creation_time, 'RRRR Month')
order by 2, 1;


select creation_time from V$Datafile;



---pronostico de crecimiento de base 
col name for a65
col mes for a35

select tsname,
    round(tablespace_size*t2.block_size/1024/1024/1024,2) "Tamaño Actual GB",
    round(tablespace_usedsize*t2.block_size/1024/1024/1024,2) "Espacio Usado GB",
    round((tablespace_size-tablespace_usedsize)*t2.block_size/1024/1024/1024,2) "Espacio Libre GB",
    round(val2*t2.block_size/1024/1024/1024,2) "Proy. Diario GB",
    round(val3*t2.block_size/1024/1024/1024,2) "Proy. Semanal GB",
    round(val4*t2.block_size/1024/1024/1024,2) "Proy. Mensual GB",
    round((tablespace_usedsize/tablespace_size)*100, 2) "% Usado",
    round((val2/tablespace_size)*100, 2) "% Proy. Diario",
    round((val3/tablespace_size)*100, 2) "% Proy. Semanal",
    round((val4/tablespace_size)*100, 2) "% Proy. Mensual"
from (select distinct tsname,
rtime,
tablespace_size,
tablespace_usedsize,
tablespace_usedsize-first_value(tablespace_usedsize)
over (partition by tablespace_id order by rtime rows 1 preceding) val1,
tablespace_usedsize-first_value(tablespace_usedsize)
over (partition by tablespace_id order by rtime rows 24 preceding) val2,
tablespace_usedsize-first_value(tablespace_usedsize)
over (partition by tablespace_id order by rtime rows 168 preceding) val3,
tablespace_usedsize-first_value(tablespace_usedsize)
over (partition by tablespace_id order by rtime rows 720 preceding) val4
from (select t1.tablespace_size, t1.snap_id, t1.rtime,t1.tablespace_id,
             t1.tablespace_usedsize-nvl(t3.space,0) tablespace_usedsize
     from dba_hist_tbspc_space_usage t1,
          dba_hist_tablespace_stat t2,
          (select ts_name,sum(space) space
           from recyclebin group by ts_name) t3
     where t1.tablespace_id = t2.ts#
      and  t1.snap_id = t2.snap_id
      and  t2.tsname = t3.ts_name (+)) t1,
dba_hist_tablespace_stat t2
where t1.tablespace_id = t2.ts#
and t1.snap_id = t2.snap_id) t1,
dba_tablespaces t2
where t1.tsname = t2.tablespace_name
and rtime = (select max(rtime) from dba_hist_tbspc_space_usage)
order by "Proy. Diario GB" desc,"Proy. Semanal GB" desc,"Proy. Mensual GB" desc;





set lines 200;
set pages 200;
col PATH for a40;
select CREATE_DATE, DISK_NUMBER, PATH, STATE, HEADER_STATUS, MODE_STATUS, OS_MB/1024 AS OS_GB from v$asm_disk
WHERE HEADER_STATUS in ('PROVISIONED','FORMER') order by 3;


select NAME, TRUNC((TOTAL_MB/1024),2) AS TOTAL_GB, TRUNC((FREE_MB/1024),2) AS "FREE_GB",
TRUNC((100-((FREE_MB*100)/TOTAL_MB)),2) AS pct_used ,TRUNC((FREE_MB*100)/TOTAL_MB,2) AS pct_free from v$asm_diskgroup;


set lines 200
set pages 500
col name for a20
col path for a40
select b.CREATE_DATE,a.name DiskGroup,b.name DiskName, b.os_mb/1024, b.total_mb, b.free_mb,b.path, b.header_status
from v$asm_disk b, v$asm_diskgroup a where a.group_number (+) =b.group_number order by b.CREATE_DATE,b.name;




 col NAME for A19
select GROUP_NUMBER, NAME, STATE, TOTAL_MB/1024 AS TOTAL_GB, FREE_MB/1024 AS FREE_GB,
(100-((FREE_MB*100)/TOTAL_MB)) AS pct_used,
 (FREE_MB*100)/TOTAL_MB AS pct_free
 from v$asm_diskgroup
order by pct_free asc;




col HEADER_STATUS for a15
 col name for a15
 col path for a40
 set lines 400
 select HEADER_STATUS, NAME, PATH, OS_MB,free_MB ,mount_status, mode_status state from v$asm_disk where path like 'ORCL:DRDASMRACMDD2DISK11%' order by PATH;
 
 col HEADER_STATUS for a15
 col name for a15
 col path for a40
 set lines 400
 select HEADER_STATUS, NAME, PATH, OS_MB,free_MB ,mount_status, mode_status state from v$asm_disk where HEADER_STATUS in ('PROVISIONED','FORMER') Order by PATH;



col HEADER_STATUS for a14
 col name for a19
 col path for a40
 set lines 400
 select HEADER_STATUS, NAME, PATH, OS_MB,free_MB ,mount_status, mode_status state from v$asm_disk where GROUP_NUMBER ='13' Order by PATH;
