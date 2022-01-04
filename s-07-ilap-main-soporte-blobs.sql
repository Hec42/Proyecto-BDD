--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  03/01/2022
--@Descripción:     Script principal empleado para configurar el soporte
--                  de datos BLOB en los 4 nodos.

Prompt Configurando directorios y otorgando registros
--############################# HECBBDD_S1 #############################
Prompt ===========================================
Prompt Configurando soporte BLOB para HECBBDD_S1
Prompt ===========================================
connect ilap_bdd/ilap_bdd@hecbbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

--############################# HECBBDD_S2 #############################
Prompt ===========================================
Prompt Configurando soporte BLOB para HECBBDD_S2
Prompt ===========================================
connect ilap_bdd/ilap_bdd@hecbbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

--############################# ARNBDD_S1 #############################
Prompt ===========================================
Prompt Configurando soporte BLOB para ARNBDD_S1
Prompt ===========================================
connect ilap_bdd/ilap_bdd@arnbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

--############################# ARNBDD_S2 #############################
Prompt ===========================================
Prompt Configurando soporte BLOB para ARNBDD_S2
Prompt ===========================================
connect ilap_bdd/ilap_bdd@arnbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt Listo!
disconnect
