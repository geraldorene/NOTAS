ps -fea | grep pmon
ps -fea | grep java
ps -fea | grep oms
ps -fea | grep agent

huawei
ssh oracle@10.218.48.100


./stop_Agent.sh
./stop_OMS_ALL.sh
./start_OMS_ALL.sh
./start_Agent.sh


Google
ssh oracle@10.214.147.2

./stop_Agent.sh
./stop_OMS_ALL.sh
./start_OMS_ALL.sh
./start_Agent.sh

********************Comandos***********************************************************************
  nohup sh stop_Agent.sh >> log_agent.log &
  tail -20f log_agent.log
  nohup sh stop_OMS_ALL.sh >> log_oms_all.log &
  tail -20f log_oms_all.log
  nohup sh start_OMS_ALL.sh >> log_oms_all.log &
  tail -20f log_oms_all.log
  nohup sh start_Agent.sh >> log_agent.log &
  tail -20f log_agent.log
  nohup sh stop_Agent.sh >> log_agent.log &
  tail -20f log_agent.log
  nohup sh stop_OMS_ALL.sh >> log_oms_all.log &
  tail -20f log_oms_all.log
  nohup sh start_OMS_ALL.sh >> log_oms_all.log &
  tail -20f log_oms_all.log
  nohup sh start_Agent.sh >> log_agent.log &
  tail -20f log_agent.log

----- Reinicio de Oracle Cloud Control Azteca

ssh oracle@10.213.8.225

--Bajar Agente
sh stop_Agent.sh

--Bajar Servicio
sh stop_OMS_ALL.sh

--Iniciar servicio
sh start_OMS_ALL.sh

--Iniciar Agente.
sh start_Agent.sh


======================================================
*NOTIFICACIÓN DE INFORMATIVA (BASE DE DATOS ORACLE)*
======================================================
*Fecha y hora:* 29/10/2023 22:23 hrs
*IPs:* 10.213.8.225 / 10.216.17.78/ 10.218.48.100/ 10.214.147.2

Buenas noches,Como parte de las actividades de fin de semana, se realizará reinicio de sanidad del Cloud Control Azteca, Querétaro, Huawei y Google.
Se procede con el reinicio de Sanidad del Cloud Control Azteca. Se informa cuando se encuentre disponible.

Atte.Operación de BDs CONDOR NOC CDMX


======================================================
*NOTIFICACIÓN DE INFORMATIVA (BASE DE DATOS ORACLE)*
======================================================
*Fecha y hora:* 29/10/2023 23:12 hrs
*IP:* 10.216.17.78

Se concluyó con el reinicio de Sanidad del Cloud Control Azteca. Las gráficas se encuentran disponibles.
Se procede con el reinicio de Sanidad del Cloud Control Querétaro. Se informa cuando se encuentre disponible.

Atte.Operación de BDs CONDOR NOC CDMX


----- Reinicio de Oracle Cloud Control Queretao

ssh oracle@10.216.17.78

--Bajar Agente
sh stop_Agent.sh

--Bajar Servicio
sh stop_OMS_ALL.sh

--Iniciar servicio
sh start_OMS_ALL.sh

--Iniciar Agente.
sh start_Agent.sh


###########################################
web logic 


BASE DE DATOS ORACLE, [16/11/2023 12:30 a. m.]
. /oracle/gc_inst1/user_projects/domains/GCDomain/bin/setDomainEnv.sh $*echo $DOMAIN_HOME

BASE DE DATOS ORACLE, [16/11/2023 12:30 a. m.]
. /oracle/gc_inst1/user_projects/domains/GCDomain/bin/setDomainEnv.sh $*

BASE DE DATOS ORACLE, [16/11/2023 12:30 a. m.]
. /oracle/gc_inst1/user_projects/domains/GCDomain/bin/setDomainEnv.sh $*

BASE DE DATOS ORACLE, [16/11/2023 12:30 a. m.]
echo $DOMAIN_HOME

BASE DE DATOS ORACLE, [16/11/2023 12:31 a. m.]
nohup sh startWebLogic.sh > startWebLogic.log &



nohup ./startManagedWebLogic.sh EMGC_OMS1  http://10.213.8.225:7101 > managed_EMGC_OMS1.log &


cd /oracle/OEM/wlserver_10.3/server/bin/

nohup sh startNodeManager.sh > startNodeManager.log &


--====## Credenciales de acceso ##====

een nueva teerminal ejecutar firefox

enviroment >>>>> servers

Weblogic server Admin password : weblogic
Weblogic server Admin password : TP4dm1n9ca3b82f17








======================================================
*NOTIFICACIÓN DE INFORMATIVA (BASE DE DATOS ORACLE)*
======================================================
*Fecha y hora:* 30/10/2023 02:14 hrs
*IP:* 10.214.147.2

Buenas noches
Se concluyó con el reinicio de Sanidad del Cloud Control GOOGLE. Las gráficas se encuentran disponibles.

Atte.Operación de BDs CONDOR NOC CDMX




Tablas BAL 

Conteo 

select count(*) as BAL_GRP_SUB_BALS_T from BRMAPP01.BAL_GRP_SUB_BALS_T;



TP:CHECKLIST BASE DE DATOS 29-OCT-2023

Buenos días.

Se envía checklist de las Bases de datos, los ambientes se encuentran trabajando correctamente.


BRM
IPTV
BRMCOL
BROUPAZ
BSWOPAZT
GIMTP
KQTPSHOP
BMSDB
DSFC
LOGMICRO
PAGOSDBP
KQNETPRO
KQTRPROD






fin busca apartir de la ruta en el quie estes


locate desde el origen

./emctl status agent




========================
NOTIFICACIÓN DE EVENTO      
========================
Fecha y hora: 02/11/2023 21:08 hrs. 
Base de datos: QUADIENT
IP: 10.218.49.45 / 46

Detalle: Se visualiza un incremento de concurrencia debió a las estadísticas propias del producto de oracle

Acciones:
1. Se procede a cancelarlas estadisticas
2.- Se mantiene monitoreo 

Atentamente                                                    
Operación de BDs CONDOR NOC CDMX

-- REINICIO ESCALONADO 

ssh oracle@10.216.17.169

srvctl status database -d BROUDG -v ;date
date; srvctl stop instance -d BROUDG -i BROUPAZT1 -o immediate; date
srvctl status database -d BROUDG -v ;date
date; srvctl start instance -d BROUDG -i BROUPAZT1; date
srvctl status database -d BROUDG -v ;date





srvctl stop instance -d KQSOAPRO -i KQSOAPRO1 -o immediate
date
srvctl status database -d KQSOAPRO -v 

date; srvctl stop instance -d BROUDG -i BROUPAZT1; date

srvctl status database -d KQSOAPRO -v 

date; srvctl stop instance -d BROUDG -i BROUPAZT1; date


srvctl status database -d KQSOAPRO -v 
date


ssh oracle@10.216.17.170


=====================================
*NOTIFICACIÓN DE REINICIO DE SANIDAD*
=====================================
*Fecha y hora:* 03/11/2023 23:10 Hrs.   

*Base de datos:* BROUDG
*IP:* 10.216.17.169 / 170

*Detalles:* Reinicio de sanidad escalonado de la bd broudg
Se procede a bajar el nodo 1, se notifica en cuanto se encuentre disponible.

*Atentamente**
Operación de BDs CONDOR NOC CDMX



=======================
*NOTIFICACIÓN DE CIERRER DE REINICIO DE SANIDAD*
========================
*Fecha y hora:* 03/11/2023 23:39 Hrs.   

*Base de datos:* BROUDG
*IP:* 10.216.17.169 / 170

*Detalles:* El Nodo 2 se encuentra disponible 
Se tiene conexion a la base a travez de la ip virtual y Scan 

*Atentamente**
Operación de BDs CONDOR NOC CDMX




date; srvctl stop instance -d BROUDG -i BROUPAZT2 -o immediate; date
date; srvctl start  instance -d BROUDG -i BROUPAZT2; date


--#################
======= FRA =======
--#################

SELECT * FROM V$FLASH_RECOVERY_AREA_USAGE;


SET LINESIZE 255
COLUMN name FORMAT A30
SELECT name, ROUND(SPACE_LIMIT/1024/1024/1024,2) "SPACE_LIMIT (GB)",
ROUND(SPACE_USED/1024/1024/1024,2) "SPACE_USED (GB)", 
NUMBER_OF_FILES, 
(((SPACE_USED/1024/1024)*100)/(SPACE_LIMIT/1024/1024)) "%_USED"
from v$recovery_file_dest;

--FRA
--En Megas

SELECT * FROM V$FLASH_RECOVERY_AREA_USAGE;


--En Gigas
SET LINESIZE 255
COLUMN name FORMAT A30
SELECT name, ROUND(SPACE_LIMIT/1024/1024/1024,2) "SPACE_LIMIT (GB)",
ROUND(SPACE_USED/1024/1024/1024,2) "SPACE_USED (GB)", 
NUMBER_OF_FILES, 
(((SPACE_USED/1024/1024/1024)*100)/(SPACE_LIMIT/1024/1024)) "%_USED"
from v$recovery_file_dest;

-- Da mejor el porcentaje de uso
SET LINESIZE 255
COLUMN name FORMAT A30
SELECT name, ROUND(SPACE_LIMIT/1024/1024/1024,2) "SPACE_LIMIT (GB)",
ROUND(SPACE_USED/1024/1024/1024,2) "SPACE_USED (GB)", 
NUMBER_OF_FILES, 
(((SPACE_USED/1024/1024)*100)/(SPACE_LIMIT/1024/1024)) "%_USED"
from v$recovery_file_dest;


CROSSCHECK BACKUP;
DELETE EXPIRED BACKUP;


delete expired archivelog all;
crosscheck archivelog all;
list archivelog all;


set lines 200;
set pages 200;
col RESOURCE_NAME  for a15
select inst_id, resource_name,current_utilization,limit_value, max_utilization from gv$resource_limit
where resource_name in ('processes','sessions','transactions');



scp BCK_20231101_FULL_BBRMPAZT_762adjie_163046_1_1 oracle@10.215.148.150:/backup/BBRMPAZT/RMAN

