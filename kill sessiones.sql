select
    to_char(s.logon_time,'dd-mon-rrrr hh24:mi:ss') ini_sess,
    s.username,
    s.osuser,
    p.spid,
    s.machine,
    s.process,
    s.sid,
    s.serial#,
    s.terminal,
    s.status,
    (s.last_call_et /60) mins,
    s.sql_hash_value,
    s.sql_id,
    s.module,
    s.action,
    s.program
--    s.client_info
from
    gv$session s, gv$process p
where
    s.status = 'INACTIVE'
and s.type = 'USER'
and s.paddr = p.addr
order by s.status, mins asc, username;

kqvbrm12batchtfe69
kqvbrm12batchtas70

kqvbrm12lineasfprod25
kqvbrm12batchfac67

spool kill_sesion.sql
set lines 500;
set pages 2000;
select 'alter system kill session '''||sid||','||serial#||',@'||inst_id||''' IMMEDIATE;' from gv$session s where MACHINE='kqbrmlinea94' and status='ACTIVE';
spool off;
set echo on; 
set timing on;
@kill_sesion 

kqvbrm12batchtfe69
kqvbrm12batchfac67

kill_sesion.sql


set lines 500;
set pages 2000;
select 'alter system kill session  '''||sid||','||serial#||',@'||inst_id||''' IMMEDIATE;' from gv$session s where username='APEREZH';

----identificar machines EQUIPO BRM
kqvbrm12batchtas71
kqvbrm12batchfac67
kqvbrm12batchfac69
kqvbrm12batchfac
dm-oracle

EQUIPO OPERACIONES
dm-oracle-xxxxdm-oracle-ffmprod
dm-oracle-totalshopdm-oracle-soaivr
dm-oracle-soaivrha


SOLICITUD DE STORAGE BMSDB 23/11/2023
SOLICITUD DE STORAGE GIMTP 23/11/2023