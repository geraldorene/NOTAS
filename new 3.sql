sqlplus / as sysdba
@instancias
rman target /
list archivelog all;
delete archivelog until time 'SYSDATE-1';
DELETE ARCHIVELOG ALL COMPLETED BEFORE "SYSDATE -6/24";
crosscheck archivelog 
ls +RECO/APXPROD_IAD1XV/ARCHIVELOG


du -sh * | sort -h


tar -czvf listener_log_bkp_07052024.tar.gz listener.log

T0t4lBDG_2K22!23

T07Al_BDG2O23!24

10.215.50.11-->grid ---> T07Al_BDG2O23!24 --->14-10-2023


rm -rf 

rm -rf core_41798 core_90472 core_36940 core_44374 core_26571 core_76650 core_129867 core_69008 core_141894 core_94759 core_102446 core_39245




*======================================*
*NOTIFICACIÓN INFORMATIVA (BASE DE DATOS ORACLE)*
*======================================*
*Fecha y hora:* 11/10/2023 19:09 hrs

*BD:* BRMPAZT
*IP:* 

*DETALLE:* Se observo evento de aplicacion por sesiones INACTIVAS de la machine dm_oracleffmha 

Atte.
Operación de BDs CONDOR NOC CDMX



Indices mariana 
ssh oracle@10.216.16.54
cd indices_night/
nohup sh index_Mariana.sh &

BCV

ssh oracle@10.213.8.105

ejecutar 
valida_ambientes_bcv.sh


conteo casandra

ssh oracle@10.216.20.220
cat /BMSDBData/cassandra/cassandra_splunk.txt

alter system kill session '964,37' immediate;

select shrink_phase_knlasg from X$KNLASG;


alter system set events 'immediate trace name mman_create_def_request level 6';

Buen dia.
Se comparten el conteo del día de hoy, sin embargo se observan que los conteos de ayer fueron mayores a los del dia de hoy.
HW1=  10824799
HW2=   3201286






Buen dia.
Se comparten el conteo del día de hoy, estos son correctos
HW1= 10879357
HW2= 3214321




son estos
HW1=10875873
HW2=3213673

04/11/2023 03:24:38 
04/11/2023 03:24:38 




Buen dia.
Se comparten el conteo del día de hoy.
HW1   10795695    10788406   7,289
HW2    3193490	   3191503   1,987

La malla de cassandra culminó correctamente


--validacion de usuarios creados en postprocesos
se crean en los bcv 
select username,account_status,created from dba_users where username in('SYSTEM');	



Vistas materializadas

select OWNER, OBJECT_NAME, OBJECT_TYPE, STATUS, LAST_DDL_TIME from dba_objects where 
OWNER='TPPROD' and OBJECT_TYPE='MATERIALIZED VIEW' and OBJECT_NAME in ('TP_APPS_SEARCH_MV','TP_EPG_GUIDE_MV','TP_EPG_SEARCH_MV','TP_TV_PROGRAM_MV','TP_VOD_MV','TP_VOD_SEARCH_MV');


--IPTV solo tiene acceso a la ip 10.213.4.230
--revisar la vistas meterializadas en la base BTPYPAZT

/home/oracle/eeb/scripts/vistas/Revision_Vistas.sh

cat  /home/oracle/eeb/scripts/vistas/query_vistas.log



====================
*NOTIFICACIÓN DE CIERRE DE EVENTO*
====================
*Fecha y hora:* 24/11/2023 13:25 hrs
*IP:* 10.214.174.41
*BD:* DSFC

*DETALLE:* Se observaron incremento de Network,eran sesiones backgroud de archives propias de la base, se liberaron por si solas. 


*Acciones* 
1.-Se identifican sesiones de consumo
2.-se mantiene monitoreo de las mismas 
3.-La base no presento problemas ni afectacion, se encuentra estable.
Atentamente
Operación de BDs CONDOR NOC CDMX
