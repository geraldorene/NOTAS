IP:10.215.152.11/12
1.- Validar secuencia que este empatada la Primaria y la Standby 

select 'Ultimo Recibido' dato,
THREAD# instancia, max(SEQUENCE#) archive from v$archived_log where
RESETLOGS_TIME = (select RESETLOGS_TIME from v$database) group by THREAD#
UNION
select 'Ultimo Aplicado' dato, THREAD# instancia, max(SEQUENCE#) archive from
v$log_history where RESETLOGS_TIME = (select RESETLOGS_TIME from v$database)
group by THREAD# order by 2
 

2.- Validar rol de la BD - (Si el rol se encuentra en PHYSICAL STANDBY)
 
   select database_role,open_mode from gv$database;

3.- Detener replica 
 ----- DESDE EL BROKER MAMAGUEVO --------                                                                                                                     
 ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;

4.- Baja de BD  de BRM Monterrey 
srvctl stop databse -d BBRMPMTY


5.- Subir BD con son estatus MOUNT , pero solo un nodo 
srvctl start instance  -d BBRMPMTY -i BBRMPAZT1  -o mount 

6.- Una vez montado el nodo1  generar snapshot 
ALTER DATABASE CONVERT TO SNAPSHOT STANDBY;

 
7.- Consultar status de la BD (El estatus debe ser  SNAPSHOT STANDBY READ WRITE)
Select status , instance_name,database_role , open_mode from gv$database ,gv$instance;

8.- Baja de BD 
Shut  immediate

9.-subir la base en modo mount
srvctl start databse -d BBRMPMTY - o mount 

10.- abrir la BD 
alter database open ;

 
11-Volver a consultar que ambos nodos este con (El estatus debe ser  SNAPSHOT STANDBY READ WRITE)
 
Select status , instance_name,database_role , open_mode from gv$database ,gv$instance;





srvctl config
srvctl stop database -d BBRMPMTYDG
srvctl start instance  -d BBRMPMTYDG -i BBRMPAZT1  -o mount
srvctl start database -d BBRMPMTYDG - o mount
srvctl start database -d BBRMPMTYDG -o mount
srvctl stop database -d BBRMPMTY
srvctl config
srvctl stop database -d BBRMPMTYDG
srvctl start instance -d BBRMPMTYDG -i BBRMPAZT1 -o mount
srvctl start database -d BBRMPMTYDG -o "read only"
srvctl config
srvctl stop databse -d BBRMPMTYDG
srvctl status database -d BBRMPMTYDG -v ;date



===============================================================================================
--Convertir a BD snapshot standby 

--1.- Validar secuencia que este empatada la Primaria y la Standby 

select 'Ultimo Recibido' dato,
THREAD# instancia, max(SEQUENCE#) archive from v$archived_log where
RESETLOGS_TIME = (select RESETLOGS_TIME from v$database) group by THREAD#
UNION
select 'Ultimo Aplicado' dato, THREAD# instancia, max(SEQUENCE#) archive from
v$log_history where RESETLOGS_TIME = (select RESETLOGS_TIME from v$database)
group by THREAD# order by 2
 

--2.- Validar rol de la BD - (Si el rol se encuentra en PHYSICAL STANDBY)
 
select status, instance_name, database_role,open_mode from v$database, gv$instance;

--3.- Detener replica 
col STATUS for a15
SELECT PROCESS, STATUS FROM V$MANAGED_STANDBY WHERE PROCESS LIKE '%MRP%';

**CON BROKER desde la PRIMARY
DGMGRL> show configuration
 
DGMGRL> show database verbose 'KQCIFPROMTY'

DGMGRL> EDIT DATABASE 'BBRMPMTYDG' SET STATE='APPLY-OFF';
        
**SIN BROKER desde STANDBY
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;

--4.- Baja de BD  de BRM Monterrey 

srvctl status database –d KQCIFPROMTY
srvctl stop database -d BBRMPMTYDG -o immediate

srvctl status database -d MOBOPRODMTY
srvctl stop database -d MOBOPRODMTY -o immediate

--5.- Subir BD con son estatus MOUNT , pero solo un nodo 
srvctl start instance -d KQCIFPROMTY -i KQCIFPRO1  -o mount 

srvctl start instance -d BBRMPMTYDG -i BBRMPAZT1 -o mount

srvctl start instance -d MOBOPRODMTY -i MOBOPROD1 -o mount

MOBOPROD1
--6.- Una vez montado el nodo1  generar snapshot 
ALTER DATABASE CONVERT TO SNAPSHOT STANDBY;

-- En BROKER
CONVERT DATABASE 'KQCIFPROMTY' to SNAPSHOT STANDBY;

--7.- Consultar status de la BD (El estatus debe ser  SNAPSHOT STANDBY READ WRITE)
Select status , instance_name,database_role , open_mode from v$database ,gv$instance;

--8.- Baja de BD 
Shut  immediate

--9.-subir la base en modo mount
srvctl start database -d KQCIFPROMTY -o mount 
srvctl start database -d BBRMPMTYDG -o mount
srvctl start database -d MOBOPRODMTY -o mount

--10.- abrir la BD 
alter database open;

 
--11-Volver a consultar que ambos nodos este con (El estatus debe ser  SNAPSHOT STANDBY READ WRITE)
 
Select status , instance_name,database_role , open_mode from v$database ,gv$instance;


*********** Convertir a BD physical standby. **********

--1.-Validacion de procesos en STANDBY 
select process,status,sequence# from v$managed_standby;

col STATUS for a15
SELECT PROCESS, STATUS FROM V$MANAGED_STANDBY WHERE PROCESS LIKE '%MRP%';

--2.- Validar rol de la BD.
select status, instance_name, database_role,open_mode from v$database, gv$instance;

--3.- Baja e inicio de BD en estatus MOUNT 
srvctl status database -d BBRMPMTYDG
srvctl stop database -d BBRMPMTYDG -o immediate
srvctl start instance -d BBRMPMTYDG -i BBRMPAZT1 -o mount


srvctl start instance -d  KQCIFPROMTY -i KQCIFPRO1 –o mount

--4.- Convierta la base de datos en espera de instantáneas en una base de datos en espera física.
alter database convert to physical standby;

Nota: (en caso de mandar error de active o status started, validar replica y apagar replica de forma manual, 
bajar la instancia y subir la BD en caso de ser RAC continuar con el paso 5.1).

--5.1.- BAJA E INICIO DE BD EN ESTATUS MOUNT 
shut immediate;
srvctl start database -d BBRMPMTYDG -o mount

srvctl start database -d KQCIFPROMTY -o mount
srvctl start database -d MOBOPRODMTY -o mount
--5.2.- Validar rol de la BD.
select status, instance_name, database_role,open_mode from v$database, gv$instance;

MODIFICAR BD A SOLO LECTURA 
ALTER DATABASE OPEN READ ONLY;



show database verbose 'BBRMPMTYDG';

EDIT DATABASE  'BBRMPMTYDG' SET STATE='APPLY-ON';

EDIT DATABASE  	'MOBOPRODMTY' SET STATE='APPLY-OFF';




---ENTRAR A BROKER
dgmgrl /
---VER LAS BASES DISPONIBLES
show configuration
----ACTIVAR
EDIT DATABASE 'BBRDGAZT' SET STATE='APPLY-ON';
----DESACTIVAR
EDIT DATABASE  	'BBRDGAZT' SET STATE='APPLY-OFF';
----VALIDACION
show database verbose 'BBRDGAZT';
---Verificar secuencia DG
select max(sequence#) from v$archived_log where applied='YES';
!hostname -i; date
---Verificar secuencia PROD
select max(sequence#) from v$archived_log;
!hostname -i; date