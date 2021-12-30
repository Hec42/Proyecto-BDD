--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  29/12/2021
--@Descripción:     Creación de sinónimos en el nodo arnbdd_s1.

--################## SUCURSAL ##################
create or replace synonym sucursal_f1 for sucursal_f1_hcb_s1@hecbbdd_s1;
create or replace synonym sucursal_f2 for sucursal_f2_hcb_s2@hecbbdd_s2;
create or replace synonym sucursal_f3 for sucursal_f3_arn_s1;
create or replace synonym sucursal_f4 for sucursal_f4_arn_s2@arnbdd_s2;
--################## SUCURSAL TALLER ##################
create or replace synonym sucursal_taller_f1 for sucursal_taller_f1_hcb_s1@hecbbdd_s1;
create or replace synonym sucursal_taller_f2 for sucursal_taller_f2_hcb_s2@hecbbdd_s2;
create or replace synonym sucursal_taller_f3 for sucursal_taller_f3_arn_s1;
create or replace synonym sucursal_taller_f4 for sucursal_taller_f4_arn_s2@arnbdd_s2;
--################## SUCURSAL VENTA ##################
create or replace synonym sucursal_venta_f1 for sucursal_venta_f1_hcb_s1@hecbbdd_s1;
create or replace synonym sucursal_venta_f2 for sucursal_venta_f2_hcb_s2@hecbbdd_s2;
create or replace synonym sucursal_venta_f3 for sucursal_venta_f3_arn_s1;
create or replace synonym sucursal_venta_f4 for sucursal_venta_f4_arn_s2@arnbdd_s2;
--################## LAPTOP ##################
create or replace synonym laptop_f1 for laptop_f1_arn_s2@arnbdd_s2;
create or replace synonym laptop_f2 for laptop_f2_hcb_s1@hecbbdd_s1;
create or replace synonym laptop_f3 for laptop_f3_arn_s2@arnbdd_s2;
create or replace synonym laptop_f4 for laptop_f4_arn_s1;
create or replace synonym laptop_f5 for laptop_f5_hcb_s2@hecbbdd_s2;
--################## LAPTOP INVENTARIO ##################
create or replace synonym laptop_inventario_f1 for laptop_inventario_f1_arn_s1;
create or replace synonym laptop_inventario_f2 for laptop_inventario_f2_hcb_s1@hecbbdd_s1;
--################## HISTORICO STATUS LAPTOP ##################
create or replace synonym historico_status_laptop_f1 for historico_status_laptop_f1_hcb_s2@hecbbdd_s2;
create or replace synonym historico_status_laptop_f2 for historico_status_laptop_f2_hcb_s1@hecbbdd_s1;
--################## SERVICIO LAPTOP ##################
create or replace synonym servicio_laptop_f1 for servicio_laptop_f1_hcb_s1@hecbbdd_s1;
create or replace synonym servicio_laptop_f2 for servicio_laptop_f2_hcb_s2@hecbbdd_s2;
create or replace synonym servicio_laptop_f3 for servicio_laptop_f3_arn_s1;
create or replace synonym servicio_laptop_f4 for servicio_laptop_f4_arn_s2@arnbdd_s2;
--################## TIPO PROCESADOR ##################
create or replace synonym tipo_procesador_r1 for tipo_procesador_r_arn_s1;
create or replace synonym tipo_procesador_r2 for tipo_procesador_r_hcb_s1@hecbbdd_s1;
create or replace synonym tipo_procesador_r3 for tipo_procesador_r_hcb_s2@hecbbdd_s2;
create or replace synonym tipo_procesador_r4 for tipo_procesador_r_arn_s2@arnbdd_s2;
--################## TIPO TARJETA VIDEO ##################
create or replace synonym tipo_tarjeta_video_r1 for tipo_tarjeta_video_r_arn_s1;
create or replace synonym tipo_tarjeta_video_r2 for tipo_tarjeta_video_r_hcb_s1@hecbbdd_s1;
create or replace synonym tipo_tarjeta_video_r3 for tipo_tarjeta_video_r_hcb_s2@hecbbdd_s2;
create or replace synonym tipo_tarjeta_video_r4 for tipo_tarjeta_video_r_arn_s2@arnbdd_s2;
--################## TIPO ALMACENAMIENTO ##################
create or replace synonym tipo_almacenamiento_r1 for tipo_almacenamiento_r_arn_s1;
create or replace synonym tipo_almacenamiento_r2 for tipo_almacenamiento_r_hcb_s1@hecbbdd_s1;
create or replace synonym tipo_almacenamiento_r3 for tipo_almacenamiento_r_hcb_s2@hecbbdd_s2;
create or replace synonym tipo_almacenamiento_r4 for tipo_almacenamiento_r_arn_s2@arnbdd_s2;
--################## TIPO MONITOR ##################
create or replace synonym tipo_monitor_r1 for tipo_monitor_r_arn_s1;
create or replace synonym tipo_monitor_r2 for tipo_monitor_r_hcb_s1@hecbbdd_s1;
create or replace synonym tipo_monitor_r3 for tipo_monitor_r_hcb_s2@hecbbdd_s2;
create or replace synonym tipo_monitor_r4 for tipo_monitor_r_arn_s2@arnbdd_s2;
