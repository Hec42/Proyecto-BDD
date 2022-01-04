--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  26/12/2021
--@Descripción:     Creación de fragmentos del nodo hecbbdd_s2.

--Fragmento SUCURSAL_F2_HCB_S2
create table sucursal_f2_hcb_s2(
  sucursal_id number(10,0) constraint sucursal_f2_hcb_s2_pk primary key,
  clave       varchar2(10)  not null,
  es_taller   number(1,0)   not null,
  es_venta    number(1,0)   not null,
  nombre      varchar2(40)  not null,
  latitud     varchar2(10)  not null,
  longitud    varchar2(10)  not null,
  url         varchar2(200) not null
);

--Fragmento TIPO_PROCESADOR_R_HCB_S2
create table tipo_procesador_r_hcb_s2(
  tipo_procesador_id number(5,0) constraint tipo_procesador_r_hcb_s2_pk primary key,
  clave              varchar2(40)   not null,
  descripcion        varchar2(400)  not null
);

--Fragmento TIPO_TARJETA_VIDEO_R_HCB_S2
create table tipo_tarjeta_video_r_hcb_s2(
  tipo_tarjeta_video_id number(5,0) constraint tipo_tarjeta_video_r_hcb_s2_pk primary key,
  clave                 varchar2(40)   not null,
  descripcion           varchar2(400)  not null
);

--Fragmento TIPO_ALMACENAMIENTO_R_HCB_S2
create table tipo_almacenamiento_r_hcb_s2(
  tipo_almacenamiento_id number(5,0) constraint tipo_almacenamiento_r_hcb_s2_pk primary key,
  clave                  varchar2(40)   not null,
  descripcion            varchar2(400)  not null
);

--Fragmento TIPO_MONITOR_R_HCB_S2
create table tipo_monitor_r_hcb_s2(
  tipo_monitor_id number(5,0) constraint tipo_monitor_r_hcb_s2_pk primary key,
  clave           varchar2(40)   not null,
  descripcion     varchar2(400)  not null
);

--Fragmento STATUS_LAPTOP
create table status_laptop(
  status_laptop_id number(5,0) constraint status_laptop_pk primary key,
  clave            varchar2(40)  not null,
  descripcion      varchar2(400) not null
);

--Fragmento SUCURSAL_TALLER_F2_HCB_S2
create table sucursal_taller_f2_hcb_s2(
  sucursal_id       number(10,0)  not null,
  dia_descanso      number(1,0)   not null,
  telefono_atencion varchar2(20)  not null,
  constraint sucursal_taller_f2_hcb_s2_pk primary key (sucursal_id),
  constraint sucursal_taller_fk foreign key (sucursal_id)
  references sucursal_f2_hcb_s2 (sucursal_id)
);

--Fragmento SUCURSAL_VENTA_F2_HCB_S2
create table sucursal_venta_f2_hcb_s2(
  sucursal_id   number(10,0) not null,
  hora_apertura date         not null,
  hora_cierre   date         not null,
  constraint sucursal_venta_f2_hcb_s2_pk primary key (sucursal_id),
  constraint sucursal_venta_fk foreign key (sucursal_id)
  references sucursal_f2_hcb_s2 (sucursal_id)
);

--Fragmento SERVICIO_LAPTOP_F2_HCB_S2
create table servicio_laptop_f2_hcb_s2(
  num_servicio  number(10,0)    not null,
  laptop_id     number(10,0)    not null,
  importe       varchar2(10)    not null,
  diagnostico   varchar2(2000)  not null,
  factura       blob,
  sucursal_id   number(10,0)    not null,
  constraint servicio_laptop_f2_hcb_s2_pk primary key (num_servicio, laptop_id),
  constraint servicio_laptop_sucursal_id_fk foreign key (sucursal_id)
  references sucursal_taller_f2_hcb_s2 (sucursal_id)
);

--Fragmento LAPTOP_F5_HCB_S2
create table laptop_f5_hcb_s2(
  laptop_id              number(10,0)   not null,
  num_serie              varchar2(18)   not null,
  cantidad_ram           number(6,0)    not null,
  caracteristicas_extras varchar2(2000) not null,
  laptop_reemplazo_id    number(10,0),
  tipo_procesador_id     number(5,0)    not null,
  tipo_tarjeta_video_id  number(5,0)    not null,
  tipo_almacenamiento_id number(5,0)    not null,
  tipo_monitor_id        number(5,0)    not null,
  constraint laptop_f5_hcb_s2_pk primary key (laptop_id),
  constraint latop_tipo_procesador_id_fk foreign key (tipo_procesador_id)
  references tipo_procesador_r_hcb_s2 (tipo_procesador_id),
  constraint laptop_tipo_tarjeta_video_id_fk foreign key (tipo_tarjeta_video_id)
  references tipo_tarjeta_video_r_hcb_s2 (tipo_tarjeta_video_id),
  constraint laptop_tipo_almacenamiento_id_fk foreign key (tipo_almacenamiento_id)
  references tipo_almacenamiento_r_hcb_s2 (tipo_almacenamiento_id),
  constraint laptop_tipo_monitor_id_fk foreign key (tipo_monitor_id)
  references tipo_monitor_r_hcb_s2 (tipo_monitor_id)
);

--Fragmento HISTORICO_STATUS_LAPTOP_F1_HCB_S2
create table historico_status_laptop_f1_hcb_s2(
  historico_status_laptop_id number(10,0) not null,
  fecha_status               date         not null,
  laptop_id                  number(10,0) not null,
  status_laptop_id           number(5,0)  not null,
  constraint historico_status_laptop_f1_hcb_s2_pk primary key (historico_status_laptop_id),
  constraint historico_status_laptop_id_fk foreign key (status_laptop_id)
  references status_laptop (status_laptop_id)
);
