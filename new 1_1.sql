

select status, username,machine, count(*) from gv$session
where  machine in ('kqvcomiprod92', 'kqvcomiprod91') 
group by  status, username, machine order by 4;  


select 'alter system kill session '''||sid||','||serial#||',@'||inst_id||''' IMMEDIATE;' from gv$session s where machine in ('kqvcomiprod92', 'kqvcomiprod91') and status='INACTIVE';



col FILE_NAME format a80col TIME_TAKEN_DISPLAY for a20
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
	 where tablespace_name in ('PIN002024')
	 GROUP BY tablespace_name
	 ORDER BY PORC_USADO_MAX desc;
	 
	 
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
where tablespace_name in ('PIN002024')
GROUP BY tablespace_name
ORDER BY PORC_USADO_MAX desc;


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
where tablespace_name in ('PIN002024')
group by tablespace_name) df,
(select round(sum(bytes)/(1024*1024*1024),2) totalusedspace, tablespace_name
from dba_segments
where tablespace_name in ('PIN002024')
group by tablespace_name) tu
where df.tablespace_name = tu.tablespace_name;

TABLESPACE_NAME                   %_USADO   GB_TOTAL   GB_USADO   GB_LIBRE
------------------------------ ---------- ---------- ---------- ----------
PINX00                               99.1    5405.99    5357.32      48.67

col FILE_NAME format a90
select file_name, bytes/1024/1024 MB, tablespace_name from dba_data_files where tablespace_name='PIN002024';

+BRM_DATA01/BBRMHMTY/DATAFILE/pinx00.766.1163211857                                          32,767.00 PINX00
+BRM_DATA01/BBRMHMTY/DATAFILE/pinx00.767.1163211897                                          32,767.00 PINX00
+BRM_DATA01/BBRMHMTY/DATAFILE/pinx00.773.1164336609                                          32,767.00 PINX00
+BRM_DATA01/BBRMHMTY/DATAFILE/pinx00.774.1164336631                                          32,767.00 PINX00

169 rows selected.


select NAME AS DISKGROUP_NAME, TRUNC((TOTAL_MB/1024),2) AS TOTAL_GB, TRUNC((FREE_MB/1024),2) AS "FREE_GB",
TRUNC((100-((FREE_MB*100)/TOTAL_MB)),2) AS pct_used ,TRUNC((FREE_MB*100)/TOTAL_MB,2) AS pct_free from v$asm_diskgroup 
where NAME in ('DGFLASHDAT');







11:03:37 BBRMHGG> select
df.tablespace_name "TABLESPACE_NAME",
100 - (round( ( (df.totalspace - tu.totalusedspace)/ df.totalspace)* 100,2)) "%_USADO",
ROUND (df.totalspace,2) "GB_TOTAL",
ROUND (totalusedspace,2) "GB_USADO",
ROUND ((df.totalspace) - (tu.totalusedspace),2) "GB_LIBRE"
from
(select tablespace_name,
round(sum(bytes) / 1024 / 1024 / 1024,2) TotalSpace
from dba_data_files
where tablespace_name in ('PIN002024')
group by tablespace_name) df,
(select round(sum(bytes)/(1024*1024*1024),2) totalusedspace, tablespace_name
from dba_segments
where tablespace_name in ('PIN002024')
group by tablespace_name) tu
where df.tablespace_name = tu.tablespace_name;11:05:12   2  11:05:12   3  11:05:12   4  11:05:12   5  11:05:12   6  11:05:12   7  11:05:12   8  11:05:12   9  11:05:12  10  11:05:12  11  11:05:12  12  11:05:12  13  11:05:12  14  11:05:12  15  11:05:12  16  11:05:12  17

TABLESPACE_NAME                   %_USADO   GB_TOTAL   GB_USADO   GB_LIBRE
------------------------------ ---------- ---------- ---------- ----------
PIN002024                           91.56        576     527.37      48.63

11:05:13 BBRMHGG> col FILE_NAME format a90
select file_name, bytes/1024/1024 MB, tablespace_name from dba_data_files where tablespace_name='PIN002024';11:05:33 BBRMHGG>

FILE_NAME                                                                                           MB TABLESPACE_NAME
------------------------------------------------------------------------------------------ ----------- ------------------------------
+DGFLASHDAT/BBRMHMTY/DATAFILE/pin002024.277.1152457897                                      589,824.00 PIN002024

11:05:34 BBRMHGG> select NAME AS DISKGROUP_NAME, TRUNC((TOTAL_MB/1024),2) AS TOTAL_GB, TRUNC((FREE_MB/1024),2) AS "FREE_GB",
TRUNC((100-((FREE_MB*100)/TOTAL_MB)),2) AS pct_used ,TRUNC((FREE_MB*100)/TOTAL_MB,2) AS pct_free from v$asm_diskgroup
where NAME in ('DGFLASHDAT');11:06:27   2  11:06:27   3

DISKGROUP_NAME                   TOTAL_GB    FREE_GB   PCT_USED   PCT_FREE
------------------------------ ---------- ---------- ---------- ----------
DGFLASHDAT                          11264     579.47      94.85       5.14

11:06:29 BBRMHGG>




alter database datafile '+DGFLASHDAT/BBRMHMTY/DATAFILE/pin002024.277.1152457897' resize 750G;


