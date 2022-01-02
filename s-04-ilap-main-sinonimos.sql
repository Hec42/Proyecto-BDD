--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  30/12/2021
--@Descripción:     Creación de sinónimos - main

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando sinónimos para hecbbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@hecbbdd_s1
@s-04-ilap-hecbbdd-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Creando sinónimos para hecbbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@hecbbdd_s2
@s-04-ilap-hecbbdd-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Creando sinónimos para arnbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@arnbdd_s1
@s-04-ilap-arnbdd-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Creando sinónimos para arnbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@arnbdd_s2
@s-04-ilap-arnbdd-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt Listo!
disconnect
