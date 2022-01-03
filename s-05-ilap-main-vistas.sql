--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2021
--@Descripción:     Creación de vistas para todos los sitios.

clear screen
whenever sqlerror exit rollback;

prompt ===========================================
prompt Creando vistas para hecbbdd_s1
prompt ===========================================
connect ilap_bdd/ilap_bdd@hecbbdd_s1

prompt Creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql

prompt Creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt Creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt Creando vistas con soporte para BLOBs
@s-05-ilap-hecbbdd-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para hecbbdd_s2
prompt ===========================================
connect ilap_bdd/ilap_bdd@hecbbdd_s2

prompt Creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql

prompt Creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt Creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt Creando vistas con soporte para BLOBs
@s-05-ilap-hecbbdd-s2-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para arnbdd_s1
prompt ===========================================
connect ilap_bdd/ilap_bdd@arnbdd_s1

prompt Creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql

prompt Creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt Creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt Creando vistas con soporte para BLOBs
@s-05-ilap-arnbdd-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para arnbdd_s2
prompt ===========================================
connect ilap_bdd/ilap_bdd@arnbdd_s2

prompt Creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql

prompt Creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt Creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt Creando vistas con soporte para BLOBs
@s-05-ilap-arnbdd-s2-vistas-blob.sql

prompt Listo!
disconnect
