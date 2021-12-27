--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  26/12/2021
--@Descripción:     Creación de ligas en los 4 nodos.

clear screen
whenever sqlerror exit rollback

Prompt ============================
Prompt Creando ligas en hecbbdd_s1
Prompt ============================
connect ilap_bdd/ilap_bdd@hecbbdd_s1
create database link hecbbdd_s2.fi.unam using 'HECBBDD_S2';
create database link arnbdd_s1.fi.unam using 'ARNBDD_S1';
Create database link arnbdd_s2.fi.unam using 'ARNBDD_S2';

Prompt ============================
Prompt Creando ligas en hecbbdd_s2
Prompt ============================
connect ilap_bdd/ilap_bdd@hecbbdd_s2
create database link hecbbdd_s1.fi.unam using 'HECBBDD_S1';
create database link arnbdd_s1.fi.unam using 'ARNBDD_S1';
Create database link arnbdd_s2.fi.unam using 'ARNBDD_S2';

Prompt ============================
Prompt Creando ligas en arnbdd_s1
Prompt ============================
connect ilap_bdd/ilap_bdd@arnbdd_s1
create database link hecbbdd_s1.fi.unam using 'HECBBDD_S1';
create database link hecbbdd_s2.fi.unam using 'HECBBDD_S2';
Create database link arnbdd_s2.fi.unam using 'ARNBDD_S2';

Prompt ============================
Prompt Creando ligas en arnbdd_s2
Prompt ============================
connect ilap_bdd/ilap_bdd@arnbdd_s2
create database link hecbbdd_s1.fi.unam using 'HECBBDD_S1';
create database link hecbbdd_s2.fi.unam using 'HECBBDD_S2';
Create database link arnbdd_s1.fi.unam using 'ARNBDD_S1';

Prompt Listo!
disconnect
