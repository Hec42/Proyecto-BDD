--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  26/12/2021
--@Descripción:     Creación de fragmentos en los 4 nodos.

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando fragmentos para hecbbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@hecbbdd_s1
@s-03-ilap-hecbbdd-s1-ddl.sql

prompt =====================================
prompt Creando fragmentos para hecbbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@hecbbdd_s2
@s-03-ilap-hecbbdd-s2-ddl.sql

prompt =====================================
prompt Creando fragmentos para arnbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@arnbdd_s1
@s-03-ilap-arnbdd-s1-ddl.sql

prompt =====================================
prompt Creando fragmentos para arnbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@arnbdd_s2
@s-03-ilap-arnbdd-s2-ddl.sql

Prompt Listo!
disconnect
