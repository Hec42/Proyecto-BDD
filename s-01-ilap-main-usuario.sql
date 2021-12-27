--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  26/12/2021
--@Descripción:     Creación de usuarios en los 4 nodos.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

Prompt Inciando creación/eliminación de usuarios
accept syspass char prompt 'Proporcione el password de sys: ' hide

prompt =====================================
prompt Creando usuario en hecbbdd_s1
prompt =====================================
connect sys/&&syspass@hecbbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en hecbbdd_s2
prompt =====================================
connect sys/&&syspass@hecbbdd_s2 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en arnbdd_s1
prompt =====================================
connect sys/&&syspass@arnbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en arnbdd_s2
prompt =====================================
connect sys/&&syspass@arnbdd_s2 as sysdba
@s-01-ilap-usuario.sql

Prompt Listo!
disconnect
