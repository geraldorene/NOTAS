spool kill_session_sesion.sql
set lines 500;
set pages 2000;
select 'alter system kill session '''||sid||','||serial#||',@'||inst_id||''' IMMEDIATE;' from gv$session s where MACHINE='kqbrmlinea94';
spool off;
set echo on; 
set timing on;
@kill_session_sesion.sql


and status='INACTIVE' ;


select count (*) from gv$session s where program='dm_oracle@kqvbrm12batchfac67 (TNS V1-V3)' and status='ACTIVE';
select machine,program, status from gv$session s where program='dm_oracle@kqvbrm12batchfac67 (TNS V1-V3)';


select 'alter system kill session '''||sid||','||serial#||',@'||inst_id||''' IMMEDIATE;' from gv$session s where ='dm_oracle@kqvbrm12batchfac67 (TNS V1-V3)'and status = 'ACTIVE';


alter system kill session 

---------- matar sesiones ----------
set lines 500; 
set pages 500; 
select 'alter system kill session '''||sid||','||serial#||',@'||inst_id||''' IMMEDIATE;' from gv$session s where MACHINE='kqbrmlinea94'; and status='INACTIVAS'; 



=======================================
*NOTIFICACIÓN DE EVENTO (BASE DE DATOS ORACLE)*
=======================================
*Fecha y hora:* 24/11/2023 08:17 hrs
*IP:* 10.216.17.96 / 97
*BD:* KQCIFPRO

*DETALLE:* Se observaron eventos de *I/O  , CPU, OTHER y Concurrencia* , los eventos se liberan por si solos y no nos reportan afectación

*Acciones:*
1. Los eventos se liberan por si solos. 
2. Se comparte usuario, machine y sentencias.

*Atentamente*
Operación de BDs CONDOR NOC CDMX