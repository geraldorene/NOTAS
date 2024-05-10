CREATE USER VFHUIDOBRO
  IDENTIFIED BY VFHUIDOBRO_2023#
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE "PRF-CUST"
  ACCOUNT UNLOCK;
  
GRANT CONNECT TO VFHUIDOBRO;
GRANT RESOURCE TO VFHUIDOBRO;
GRANT CREATE SESSION TO VFHUIDOBRO;
GRANT SELECT ANY DICTIONARY TO VFHUIDOBRO;
	
SELECT 'GRANT SELECT, UPDATE, DELETE, INSERT ON ' || OWNER||'.'||OBJECT_NAME || ' TO VFHUIDOBRO;' 
FROM DBA_OBJECTS WHERE OBJECT_TYPE ='TABLE' AND OWNER='BRMAPP01';

 
spool grants_user.sql
set lines 500;
set pages 2000;
SELECT 'GRANT SELECT ON ' || OWNER||'.'||OBJECT_NAME || ' TO VFHUIDOBRO;' 
FROM DBA_OBJECTS WHERE OBJECT_TYPE ='TABLE' AND OWNER='BRMAPP01';
spool off;
set echo on; 
set timing on;
@grants_user.sql



----INSERTAR INFORMACIÓN EN LA TABLA DEL TRIGGER
INSERT INTO SYS.SABD_ACCESOCONTROL (FCIP,FCUSRSO,FCTERMINAL,FCUSRBD,FCPROGRA,FDVIGENCIA,FCEXT,FCNOMBRE,FCPATERNO,FCMATERNO,FCDESC) 
VALUES ('10.188.14.243','','','ATORALES','TOAD.EXE','03-JUL-2024','','ALFREDO','TORALES','','LA CONSULTA PERMITIRA MANTENER ACTUALIZADO LOS EQUIPOS');

COMMIT;




CREATE USER ATORALES
IDENTIFIED BY ATORALES_2024#
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
PROFILE "PRF-APP"
ACCOUNT UNLOCK;

GRANT SELECT ON ISN_IPS_SERIAL_NUMBERS_M TO ATORALES;

insert into sys.sabd_accesocontrol (FCIP,FCUSRSO,FCTERMINAL,FCUSRBD,FCPROGRA,FDVIGENCIA,FCEXT,FCNOMBRE,FCPATERNO,FCMATERNO,FCDESC) 
values ('10.216.17.212','','','ATORALES','SQL * Plus','08-FEB-2024','','VICTOR','HUIDOBRO','','ACCESO A BRM');

COMMIT;


GRANT CONNECT TO ATORALES;

spool grants_user.sql
set lines 500;
set pages 2000;
SELECT 'GRANT SELECT ON '||OBJECT_NAME || ' TO ATORALES;' 
FROM DBA_OBJECTS WHERE OBJECT_NAME='ISN_IPS_SERIAL_NUMBERS_M';
spool off;
set echo on; 
set timing on;
@grants_user.sql

ISN_IPS_SERIAL_NUMBERS_M





