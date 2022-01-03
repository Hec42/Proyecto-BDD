--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2021
--@Descripción:     Definición de funciones para acceso a BLOBs.

Prompt Creando función para extraer dato BLOB de LAPTOP_F1
create or replace function get_remote_foto_f1_by_id(p_laptop_id in number)
  return blob is
  pragma autonomous_transaction;
  v_temp_pdf blob;
begin
  --Asegura que no haya registros
  delete from ts_laptop_f1;
  --Inserta los datos obtenidos del fragmento remoto a la tabla temporal
  insert into ts_laptop_f1
    select laptop_id,foto
    from laptop_f1
    where laptop_id = p_laptop_id;
  --Obtiene el registro de la tabla temporal y lo regresa como blob
  select foto into v_temp_pdf
  from ts_laptop_f1
  where laptop_id = p_laptop_id;
  --Elimina los registros de la tabla temporal una vez que han sido obtenidos
  delete from ts_laptop_f1;
  --Termina txn autónoma
  commit;
  return v_temp_pdf;
exception
  when others then
    --Si ocurre error, termina la txn autónoma
    rollback;
    raise;
end;
/
show errors

-- ######################## Fragmento 1 ########################
Prompt Creando función para extraer dato BLOB de SERVICIO_LAPTOP_F1
create or replace function get_remote_factura_f1_by_id(
  p_num_servicio in number, p_laptop_id in number) return blob is
pragma autonomous_transaction;
v_temp_pdf blob;
begin
  --Asegura que no haya registros
  delete from ts_servicio_laptop_f1;
  --Inserta los datos obtenidos del fragmento remoto a la tabla temporal
  insert into ts_servicio_laptop_f1(num_servicio,laptop_id,factura)
    select num_servicio,laptop_id,factura
    from servicio_laptop_f1
    where num_servicio = p_num_servicio
    and laptop_id = p_laptop_id;
  --Obtiene el registro de la tabla temporal y lo regresa como blob
  select factura into v_temp_pdf
  from ts_servicio_laptop_f1
  where num_servicio = p_num_servicio
  and laptop_id = p_laptop_id;
  --Elimina los registros de la tabla temporal
  delete from ts_servicio_laptop_f1;
  --Termina txn autónoma
  commit;
  return v_temp_pdf;
exception
  when others then
    --Si ocurre error, termina la txn autónoma
    rollback;
    raise;
end;
/
show errors

-- ######################## Fragmento 2 ########################
Prompt Creando función para extraer dato BLOB de SERVICIO_LAPTOP_F2
create or replace function get_remote_factura_f2_by_id(
  p_num_servicio in number, p_laptop_id in number) return blob is
pragma autonomous_transaction;
v_temp_pdf blob;
begin
  --Asegura que no haya registros
  delete from ts_servicio_laptop_f2;
  --Inserta los datos obtenidos del fragmento remoto a la tabla temporal
  insert into ts_servicio_laptop_f2(num_servicio,laptop_id,factura)
    select num_servicio,laptop_id,factura
    from servicio_laptop_f2
    where num_servicio = p_num_servicio
    and laptop_id = p_laptop_id;
  --Obtiene el registro de la tabla temporal y lo regresa como blob
  select factura into v_temp_pdf
  from ts_servicio_laptop_f2
  where num_servicio = p_num_servicio
  and laptop_id = p_laptop_id;
  --Elimina los registros de la tabla temporal
  delete from ts_servicio_laptop_f2;
  --Termina txn autónoma
  commit;
  return v_temp_pdf;
exception
  when others then
    --Si ocurre error, termina la txn autónoma
    rollback;
    raise;
end;
/
show errors

-- ######################## Fragmento 3 ########################
Prompt Creando función para extraer dato BLOB de SERVICIO_LAPTOP_F3
create or replace function get_remote_factura_f3_by_id(
  p_num_servicio in number, p_laptop_id in number) return blob is
pragma autonomous_transaction;
v_temp_pdf blob;
begin
  --Asegura que no haya registros
  delete from ts_servicio_laptop_f3;
  --Inserta los datos obtenidos del fragmento remoto a la tabla temporal
  insert into ts_servicio_laptop_f3(num_servicio,laptop_id,factura)
    select num_servicio,laptop_id,factura
    from servicio_laptop_f3
    where num_servicio = p_num_servicio
    and laptop_id = p_laptop_id;
  --Obtiene el registro de la tabla temporal y lo regresa como blob
  select factura into v_temp_pdf
  from ts_servicio_laptop_f3
  where num_servicio = p_num_servicio
  and laptop_id = p_laptop_id;
  --Elimina los registros de la tabla temporal
  delete from ts_servicio_laptop_f3;
  --Termina txn autónoma
  commit;
  return v_temp_pdf;
exception
  when others then
    --Si ocurre error, termina la txn autónoma
    rollback;
    raise;
end;
/
show errors

-- ######################## Fragmento 4 ########################
Prompt Creando función para extraer dato BLOB de SERVICIO_LAPTOP_F4
create or replace function get_remote_factura_f4_by_id(
  p_num_servicio in number, p_laptop_id in number) return blob is
pragma autonomous_transaction;
v_temp_pdf blob;
begin
  --Asegura que no haya registros
  delete from ts_servicio_laptop_f4;
  --Inserta los datos obtenidos del fragmento remoto a la tabla temporal
  insert into ts_servicio_laptop_f4(num_servicio,laptop_id,factura)
    select num_servicio,laptop_id,factura
    from servicio_laptop_f4
    where num_servicio = p_num_servicio
    and laptop_id = p_laptop_id;
  --Obtiene el registro de la tabla temporal y lo regresa como blob
  select factura into v_temp_pdf
  from ts_servicio_laptop_f4
  where num_servicio = p_num_servicio
  and laptop_id = p_laptop_id;
  --Elimina los registros de la tabla temporal
  delete from ts_servicio_laptop_f4;
  --Termina txn autónoma
  commit;
  return v_temp_pdf;
exception
  when others then
    --Si ocurre error, termina la txn autónoma
    rollback;
    raise;
end;
/
show errors
