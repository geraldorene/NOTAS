origen 10.215.148.18 / 24    
destino  10.216.18.94
10.216.18.95
10.218.49.122
10.214.145.44
10.214.145.46


select USERNAME,ACCOUNT_STATUS,ACCOUNT_STATUS,LOCK_DATE,EXPIRY_DATE from dba_users where USERNAME='';

-- ELIMINAR OBJETOS INVALIDOS 
select OWNER, OBJECT_NAME, OBJECT_TYPE, STATUS, to_char (CREATED, 'DD-MM-YYYY HH24:MI') as "FECHA_CREACION", to_char (last_ddl_time, 'DD-MM-YYYY HH24:MI') as "ULTIMA_MODIFICACION"
from dba_objects
where STATUS='INVALID';



select 'drop ' || object_type ||' "' || owner || '"."' ||object_name || '";' as SENTENCIA_A_EJECUTAR
from dba_objects
where status = 'INVALID'
ORDER BY OWNER,CREATED
desc;




drop PROCEDURE "FFMTPE"."SP_PROCESA_CLARIDAD_EMP";
drop PROCEDURE "GGATE"."DDLORA_GETLOBS";
drop TRIGGER "SYS"."GGS_DDL_TRIGGER_BEFORE";
drop PACKAGE BODY "SYS"."DDLCTXINFO";
drop SYNONYM "USER_COMI_BCV"."SP_PROCESA_CLARIDAD_EMP";

===============================
*NOTIFICACIÓN DE EVENTO*
================================
*Fecha y hora:* 24/10/2023 23:50Hrs. 
*Base de datos :* Varias
*IP:* Segmentos afectados 214 y 215

*Detalle:* Se observan alertas de falla de conexión a varias IPs de bases de datos, se validaron conexiones y no nos conectan las IP


*Atentamente*
Operación de BDs CONDOR NOC CDMX


===============================
*NOTIFICACIÓN CIERRE DE EVENTO*
================================
*Fecha y hora:* 25/10/2023 00:51 Hrs. 
*Base de datos :* Varias
*IP:* Segmentos afectados 214 y 215

*Detalle:* Se reestablecio la comunicacion con los segmentos 10.214, 10.215, 10.218 

*Atentamente*
Operación de BDs CONDOR NOC CDMX


======================================================
NOTIFICACIÓN DE EVENTO (BASE DE DATOS ORACLE)
======================================================
Fecha y hora: 07/11/2023 08:56 hrs
IP: 10.216.17.96 / 97
BD: KQCIFPRO

DETALLE: Se presenta evento de concurrencia, en un momento se comparten más detalles

Atte.Operación de BDs CONDOR NOC CDMX