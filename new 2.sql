
Validacion de acceso a ambiente 

telnet ip puerto
tracert 11.1.0.1


select USERNAME,ACCOUNT_STATUS,PASSWORD_CHANGE_DATE,EXPIRY_DATE from dba_users where username = 'MONITOREOBD';


"10.188.17.213
Password: SIEwindows01"


-- CONSULTA DDL
set lines 200
set pages 300
col owner for a10
col NAME for a25
col TEXT for a150
select OWNER,NAME ,TEXT from dba_source where NAME='TPASAPSEC' AND OWNER='SYS';

set lines 200
set pages 300
col TEXT for a150
select TEXT from dba_source where NAME='FFM_AA_POSCON_04_SP' AND OWNER='TPASAPSEC';



--- CONSULTA USUARIO
set lines 150
set pages 300
col USERNAME for a20
col ACCOUNT_STATUS for a30
col LOCK_DATE for a30
col EXPIRY_DATE for a30
col PROFILE for a20
select USERNAME, ACCOUNT_STATUS, LOCK_DATE, EXPIRY_DATE, PROFILE from dba_users where username in ('ENUNEZLO');


USERNAME             ACCOUNT_STATUS                 LOCK_DATE                      EXPIRY_DATE                    PROFILE
-------------------- ------------------------------ ------------------------------ ------------------------------ --------------------
ENUNEZLO             OPEN                                                          28-APR-23                      PRF-CUST


col name for a20
col PASSWORD for a30
select name, password from user$ where name='ENUNEZLO';

---Obtener la password encriptada

NAME                 PASSWORD
-------------------- ------------------------------
ENUNEZLO             6BD863755502148F



---Reutilizar la password
 alter user ENUNEZLO identified by values '6BD863755502148F' account unlock;
 
 ALTER PROFILE "DEFAULT" LIMIT PASSWORD_VERIFY_FUNCTION NULL;

ALTER PROFILE "DEFAULT" LIMIT PASSWORD_VERIFY_FUNCTION ACS_VFY_TOTP;

ALTER PROFILE "DEFAULT" LIMIT  PASSWORD_REUSE_MAX UNLIMITED;

ALTER PROFILE "DEFAULT" LIMIT  PASSWORD_REUSE_MAX 20;

ALTER PROFILE "DEFAULT" LIMIT PASSWORD_REUSE_TIME NULL;

ALTER PROFILE "PRF-CUST" LIMIT PASSWORD_REUSE_TIME 365;

 
PROFILE              RESOURCE_NAME                  RESOURCE_TYPE                  LIMIT
-------------------- ------------------------------ ------------------------------ --------------------
DEFAULT              PASSWORD_REUSE_TIME            PASSWORD                       365
DEFAULT              PASSWORD_REUSE_MAX             PASSWORD                       20
DEFAULT              PASSWORD_VERIFY_FUNCTION       PASSWORD                       ACS_VFY_TOTP


 
--- Consultar parametros de profile Default
 set lines 300
col PROFILE for a20
col RESOURCE_NAME for a30
col RESOURCE_TYPE for a30
col LIMIT for a20
select PROFILE, RESOURCE_NAME, RESOURCE_TYPE, LIMIT
from dba_profiles
where profile='DEFAULT'
and RESOURCE_NAME in ('PASSWORD_REUSE_TIME','PASSWORD_REUSE_MAX','PASSWORD_VERIFY_FUNCTION');


PROFILE              RESOURCE_NAME                  RESOURCE_TYPE                  LIMIT
-------------------- ------------------------------ ------------------------------ --------------------
PRF-CUST             PASSWORD_REUSE_TIME            PASSWORD                       365
PRF-CUST             PASSWORD_REUSE_MAX             PASSWORD                       20
PRF-CUST             PASSWORD_VERIFY_FUNCTION       PASSWORD                       ACS_VFY_TOTP

alter user ENUNEZLO profile "PRF-CUST";

select username, account_status from dba_users where username='ENUNEZLO'; 


3 rows selected.

Modificas el profile
alter profile DEFAULT limit PASSWORD_VERIFY_FUNCTION null;
alter profile DEFAULT limit PASSWORD_REUSE_TIME UNLIMITED;
alter profile DEFAULT limit PASSWORD_REUSE_MAX UNLIMITED;

ALTER PROFILE PRF-CUST LIMIT
   ASSWORD_VERIFY_FUNCTION null
   PASSWORD_REUSE_TIME UNLIMITED
   PASSWORD_REUSE_MAX UNLIMITED;
ALTER PROFILE PRF-CUST LIMIT PASSWORD_VERIFY_FUNCTION NULL;

alter profile PRF-CUST limit PASSWORD_VERIFY_FUNCTION NULL;

ALTER PROFILE 'PRF-CUST' LIMIT
    PASSWORD_REUSE_TIME UNLIMITED;

Relanzar la pass nuevamente 

alter user CTXSYS identified by values '112400445CD91331' account unlock;

---Regresar valores al valor inicial
alter profile DEFAULT limit PASSWORD_VERIFY_FUNCTION ACS_VFY_TOTP;
alter profile DEFAULT limit PASSWORD_REUSE_TIME 365;
alter profile DEFAULT limit PASSWORD_REUSE_MAX 20;

----Consular user  nuevamente
select USERNAME, ACCOUNT_STATUS, LOCK_DATE, EXPIRY_DATE, PROFILE from dba_users where username in ('CTXSYS');

USERNAME             ACCOUNT_STATUS                 LOCK_DATE                      EXPIRY_DATE                    PROFILE
-------------------- ------------------------------ ------------------------------ ------------------------------ --------------------
CTXSYS               OPEN                                                          02-SEP-23                      DEFAULT
