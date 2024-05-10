BRM
ssh oracle@10.216.26.11
cd scripts_m/check/; . check.sh

cd /home/oracle/scripts_m/oracle/AdmonBD/BD/Estadisticas

cd /home/oracle/scripts/DG;while true; do ./monit_DG_AZTECANEW.sh; sleep 300;done
--cd /home/oracle/scripts/DG;while true; do ./monit_DG_RACGOOGLE.sh; sleep 300;done
cd /home/oracle/scripts/DG;while true; do ./monit_DG_NEWDG_QRO.sh; sleep 300;done

tail -500 /oradump/diag/crs/kqbrm12db01/crs/trace/alert.log 
tail -500 /oradump/diag/asm/+asm/+ASM1/trace/alert_+ASM1.log
tail -500 /oradump/diag/rdbms/bbrdgqro/BBRMPAZT1/trace/alert_BBRMPAZT1.log


ssh oracle@10.216.26.12
cd scripts_m/check/; . check.sh

tail -500 /oradump/diag/crs/kqbrm12db02/crs/trace/alert.log 
tail -500 /oradump/diag/asm/+asm/+ASM2/trace/alert_+ASM2.log
tail -500 /oradump/diag/rdbms/bbrdgqro/BBRMPAZT2/trace/alert_BBRMPAZT2.log



IPTV
ssh oracle@10.213.4.230
cd scripts_m/check/; . check.sh

ssh oracle@10.213.4.231
cd scripts_m/check/; . check.sh

ssh oracle@10.213.4.232
cd scripts_m/check/; . check.sh

ssh oracle@10.213.4.233
cd scripts_m/check/; . check.sh

tail -350 /oradump/diag/asm/+asm/+ASM2/trace/alert_+ASM2.log
tail -350 /oradump/diag/crs/tvaiptv12cdb02/crs/trace/alert.log
tail -350f /oradump/diag/rdbms/btpypazt/BTPYPAZT1/trace/alert_BTPYPAZT1.log

tail -350 /oradump/diag/asm/+asm/+ASM3/trace/alert_+ASM3.log
tail -350 /oradump/diag/crs/tvaiptv12cdb03/crs/trace/alert.log
tail -350 /oradump/diag/rdbms/btpypazt/BTPYPAZT3/trace/alert_BTPYPAZT3.log

cd /home/oracle/scripts_m/DG; while true; do ./monit_DG_BTPYSTBY.sh; sleep 600; done
cd /home/oracle/scripts_m/DG; while true; do ./monit_DG_BTPYSTBY.sh; sleep 600; done

BRMCOL
ssh oracle@10.215.50.21
cd scripts_m/check/; . check.sh

tail -1500f /oradump/diag/rdbms/bbrmpcol/BBRMPCOL/trace/alert_BBRMPCOL.log
tail -1500f /oradump/diag/asm/+asm/+ASM/trace/alert_+ASM.log
tail -1500f /oradump/diag/crs/ecs-kqp-brmcolbd/crs/trace/alert.log

cd /home/oracle/scripts/DG ;while true; do ./monit_DG_BBRMPCOL.sh; sleep 100;done
cd /home/oracle/scripts_m/oracle/AdmonBD/BD/Estadisticas ; tail -20 Estadisticas_BRMCOL_actualizado.log


BROUPAZT
ssh oracle@10.216.17.169
cd scripts_m/check/; . check.sh

ssh oracle@10.216.17.170
cd scripts_m/check/; . check.sh

tail -1000  /grid/product/11.2.0/crs/log/kq11gdb01/alertkq11gdb01.log
tail -300 /oradump/diag/asm/+asm/+ASM2/trace/alert_+ASM2.log 
tail -300 /oradump/diag/rdbms/broudg/BROUPAZT2/trace/alert_BROUPAZT2.log


cd /Scripts/AdmonBD/BD/Estadisticas/
cd /home/oracle/scripts/DG; while true; do ./monit_DG_BROUPAZT.sh; sleep 300;done

BSWOPAZT
ssh oracle@10.216.17.169
cd scripts_m/check/BSWOPAZT/; . check.sh



cd /home/oracle/eeb/scripts
cd /home/oracle/scripts/DG; while true; do ./monit_DG_BSWOPAZT.sh; sleep 300;done


ssh oracle@10.216.17.170
cd scripts_m/check/; . check.sh

DG 
tail -100 /respaldos/BSWOPAZT/RMAN/2023-09-17RMANBSWOPAZT2/log_BSWOPAZT2_2023-09-08.log


tail -300f  /grid/product/11.2.0/crs/log/kq11gdb02/alertkq11gdb02.log 
tail -400 /oradump/diag/rdbms/bswopaztdg/BSWOPAZT2/trace/alert_BSWOPAZT2.log

tail -400 /oradump/diag/rdbms/bswopaztdg/BSWOPAZT1/trace/alert_BSWOPAZT1.log

tail -1000 /oradump/diag/crs/kq911db01/crs/trace/alert.log
tail -1000 /oradump/diag/asm/+asm/+ASM1/trace/alert_+ASM1.log



tail -1000 /oradump/diag/rdbms/gimtp/BRGIMTP1/trace/alert_BRGIMTP1.log

GIMTP

ssh oracle@10.216.16.248
cd scripts_m/check/; . check.sh

ssh oracle@10.216.16.249
cd scripts_m/check/; . check.sh


cat /home/oracle/eeb/scripts/estadisticas_BRGIMTP.log
cd /home/oracle/scripts/DG; while true; do ./monit_DG_GIMTP.sh; sleep 200;done

tail -300 /oradump/diag/crs/kq911db01/crs/trace/alert.log
tail -300 /oradump/diag/asm/+asm/+ASM1/trace/alert_+ASM1.log
tail -300 /oradump/diag/rdbms/gimtp/BRGIMTP1/trace/alert_BRGIMTP1.log

tail -300 /oradump/diag/crs/kq911db02/crs/trace/alert.log
tail -300 /oradump/diag/asm/+asm/+ASM2/trace/alert_+ASM2.log
tail -300 /oradump/diag/rdbms/gimtp/BRGIMTP2/trace/alert_BRGIMTP2.log


TPSHOP
ssh oracle@10.216.18.95
cd scripts_m/check/kqtpshop/; . check.sh

cat /home/oracle/scripts_m/AdmonBD/BD/estadisticas_KQTPSHOP2/log/estadisticas_KQTPSHOP.log
cd /home/oracle/scripts/DG; while true; do ./monit_DG_KQTPSHOP.sh; sleep 300;done


tail -350 /oradump/diag/rdbms/kqtpshop/KQTPSHOP2/trace/alert_KQTPSHOP2.log
tail -350 /oradump/diag/crs/kqtotalbankdb02/crs/trace/alert.log
tail -350 /oradump/diag/asm/+asm/+ASM2/trace/alert_+ASM2.log



BMSDB

ssh oracle@10.216.20.219
cd scripts_m/check/; . check.sh

ssh oracle@10.216.20.220
cd scripts_m/check/; . check.sh


cd /home/oracle/scripts/DG; while true; do ./monit_DG_BMSDB.sh; sleep 200;done

tail -350 /oradump/diag/rdbms/bmsdb/BMSDB1/trace/alert_BMSDB1.log
tail -1000 /oradump/diag/crs/kqmiddb12c01/crs/trace/alert.log
tail -500 /oradump/diag/asm/+asm/+ASM1/trace/alert_+ASM1.log


tail -550 /oradump/diag/rdbms/bmsdb/BMSDB2/trace/alert_BMSDB2.log
tail -350 /oradump/diag/asm/+asm/+ASM2/trace/alert_+ASM2.log
tail -350 /oradump/diag/crs/kqmiddb12c02/crs/trace/alert.log

DSFC
ssh oracle@10.214.174.41
cd scripts_m/check/; . check.sh

cat /home/oracle/scripts_m/estadisticas/estadisticas_DSFC.log

cd /home/oracle/scripts/DG; while true; do ./monit_DG_DSFC.sh; sleep 200;done
cd /home/oracle/scripts/DG; while true; do ./monit_DG_DSFCDG2.sh; sleep 300;done

 tail -350 /oradump/diag/rdbms/dsfc/DSFC/trace/alert_DSFC.log
 tail -350 /oradump/diag/crs/gcp-ffmdsfcdb/crs/trace/alert.log
 tail -350 /oradump/diag/asm/+asm/+ASM/trace/alert_+ASM.log

LOGMICRO
ssh oracle@10.215.49.97
cd scripts_m/check/; . check.sh

T0tAlBD0_#2024


cat /home/oracle/scripts_m/estadisticas/estadisticas_tbls_LOGMICRO.log
cd /home/oracle/scripts/DG;while true; do ./monit_DG_LOGMICRO.sh;sleep 300;done
tail -350 /oradump/diag/rdbms/logmicro/LOGMICRO/trace/alert_LOGMICRO.log
tail -350 /oradump/diag/crs/ecs-kqp-microservbd/crs/trace/alert.log
tail -350 /oradump/diag/asm/+asm/+ASM/trace/alert_+ASM.log


PAGOSDB
ssh oracle@10.216.18.95
cd scripts_m/check/pagosdbp; . check.sh


cat /home/oracle/scripts_m/AdmonBD/BD/estadisticas_PAGOSDBP1/log/LOG_estadisticas_PAGOSDBP.log
cd /home/oracle/scripts/DG; while true; do ./monit_DG_PAGOSDBP.sh; sleep 300;done

tail -1000f /oradump/diag/crs/kqtotalbankdb02/crs/trace/alert.log
tail -500f /oradump/diag/asm/+asm/+ASM2/trace/alert_+ASM2.log
tail -500f /oradump/diag/rdbms/pagosdbp/PAGOSDBP1/trace/alert_PAGOSDBP1.log




KQNETPRO
ssh oracle@10.180.50.50
cd /home/oracle/scripts_m/check
. check.sh


tail -500f /oradump/diag/asm/+asm/+ASM1/trace/alert_+ASM1.log


tail -500f /oradump/diag/rdbms/kqnetpro/KQNETPRO2/trace/alert_KQNETPRO2.log
tail -1000f /oradump/diag/crs/kqu31db02/crs/trace/alert.log
tail -500f /oradump/diag/asm/+asm/+ASM2/trace/alert_+ASM2.log

col owner for a20
col table_name for a35
col last_analyzed for a20
select owner,
table_name,
num_rows,
sample_size,
last_analyzed,
tablespace_name
from dba_tables where owner not in ('SYS','SYSTEM')
order by last_analyzed asc;


---valida disk groups 
col NAME for A17
select GROUP_NUMBER, NAME, STATE, TOTAL_MB/1024 AS TOTAL_GB, FREE_MB/1024 AS FREE_GB,
(100-((FREE_MB*100)/TOTAL_MB)) AS pct_used,
 (FREE_MB*100)/TOTAL_MB AS pct_free
 from v$asm_diskgroup  where STATE='CONNECTED'
order by pct_free asc;


KQTRPROD
ssh oracle@10.216.17.169
ssh oracle@10.216.17.170

cd scripts_m/check;. check.sh

. check.sh
tail -30f /home/oracle/eeb/scripts/estadisticasBD_KQTRPROD.log
tail -200f /oradump/diag/asm/+asm/+ASM1/trace/alert_+ASM1.log
tail -200f /grid/product/11.2.0/crs/log/kq11gdb01/alertkq11gdb01.log
tail -200f /grid/product/11.2.0/crs/log/kq11gdb02/alertkq11gdb02.log
tail -200f /oradump/diag/rdbms/kqtrprod/KQTRPROD1/trace/alert_KQTRPROD1.log

tail -200f /oradump/diag/asm/+asm/+ASM2/trace/alert_+ASM2.log





column status format a25
col START_TIME for a20
col END_TIME for a20
select  operation,  status,  object_type,
 to_char(start_time,'mm/dd/yyyy hh24:mi') as start_time,
 to_char(end_time,'mm/dd/yyyy hh24:mi') as end_time
from  v$rman_status
where  start_time > SYSDATE-5
and  operation = 'BACKUP'
order by  start_time desc;



column status format a25
col START_TIME for a20
col END_TIME for a20
select  operation,  status,  object_type,
 to_char(start_time,'mm/dd/yyyy hh24:mi') as start_time,
 to_char(end_time,'mm/dd/yyyy hh24:mi') as end_time
from  v$rman_status
where  start_time > SYSDATE-5
and  operation = 'BACKUP'
and  object_type = 'DB FULL'
order by  start_time desc;


se validaron los objetos y el job llama a un procedimiento dicho procedimiento no se encuentra calificado 


 . oraenv 