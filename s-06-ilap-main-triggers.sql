--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2021
--@Descripción:     Creación de trigger para implementar transparencia de inserción.

clear screen
whenever sqlerror exit rollback

Prompt ==============================
Prompt Creando triggers en hecbbdd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@hecbbdd_s1
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-hecbbdd-s1-sucursal-taller-trigger.sql
@s-06-ilap-hecbbdd-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-hecbbdd-s1-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt ==============================
Prompt Creando triggers en hecbbdd_s2
Prompt ==============================
connect ilap_bdd/ilap_bdd@hecbbdd_s2
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-hecbbdd-s2-sucursal-taller-trigger.sql
@s-06-ilap-hecbbdd-s2-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-hecbbdd-s2-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt ==============================
Prompt Creando triggers en arnbdd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@arnbdd_s1
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-arnbdd-s1-sucursal-taller-trigger.sql
@s-06-ilap-arnbdd-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-arnbdd-s1-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt ==============================
Prompt Creando triggers en arnbdd_s2
Prompt ==============================
connect ilap_bdd/ilap_bdd@arnbdd_s2
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-arnbdd-s2-sucursal-taller-trigger.sql
@s-06-ilap-arnbdd-s2-sucursal-venta-trigger.sql
@s-06-ilap-arnbdd-s2-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-arnbdd-s2-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt Listo!
disconnect
