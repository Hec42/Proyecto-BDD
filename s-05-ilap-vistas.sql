--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2022
--@Descripción:     Creación de vistas que no requieren manejo de BLOBs.

--################## SUCURSAL ##################
create or replace view sucursal as
  select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f1
  union all
  select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f2
  union all
  select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f3
  union all
  select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f4;
--################## SUCURSAL TALLER ##################
create or replace view sucursal_taller as
  select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f1
  union all
  select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f2
  union all
  select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f3
  union all
  select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f4;
--################## SUCURSAL VENTA ##################
create or replace view sucursal_venta as
  select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f1
  union all
  select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f2
  union all
  select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f3
  union all
  select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f4;
--################## LAPTOP INVENTARIO ##################
create or replace view laptop_inventario as
  select lif1.laptop_id,lif2.fecha_status,lif1.rfc_cliente,lif1.num_tarjeta,
    lif2.sucursal_id,lif2.status_laptop_id 
  from laptop_inventario_f1 lif1
  join laptop_inventario_f2 lif2
  on lif1.laptop_id = lif2.laptop_id;
--################## HISTORICO STATUS LAPTOP ##################
create or replace view historico_status_laptop as
  select historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id 
  from historico_status_laptop_f1
  union all
  select historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id 
  from historico_status_laptop_f2;
--################## TIPO PROCESADOR ##################
create or replace view tipo_procesador as
  select tipo_procesador_id,clave,descripcion from tipo_procesador_r1;
--################## TIPO TARJETA VIDEO ##################
create or replace view tipo_tarjeta_video as
  select tipo_tarjeta_video_id,clave,descripcion from tipo_tarjeta_video_r1;
--################## TIPO ALMACENAMIENTO ##################
create or replace view tipo_almacenamiento as
  select tipo_almacenamiento_id,clave,descripcion from tipo_almacenamiento_r1;
--################## TIPO MONITOR ##################
create or replace view tipo_monitor as
  select tipo_monitor_id,clave,descripcion from tipo_monitor_r1;
