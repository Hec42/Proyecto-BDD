--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  03/01/2022
--@Descripción:     Archivo de carga inicial para catálogos replicados.

clear screen
whenever sqlerror exit rollback;

--Para visualizar export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1
Prompt ==================================================
Prompt Cargando catálogos de forma manual en HECBBDD_S1
Prompt ==================================================
connect ilap_bdd/ilap_bdd@hecbbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ==================================================
Prompt Cargando catálogos de forma manual en HECBBDD_S2
Prompt ==================================================
connect ilap_bdd/ilap_bdd@hecbbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ==================================================
Prompt Cargando catálogos de forma manual en ARNBDD_S1
Prompt ==================================================
connect ilap_bdd/ilap_bdd@arnbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ==================================================
Prompt Cargando catálogos de forma manual en ARNBDD_S2
Prompt ==================================================
connect ilap_bdd/ilap_bdd@arnbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt Listo!
exit
