--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2021
--@Descripción:     Definición de instead of trigger para la vista 
--                  LAPTOP.

create or replace trigger t_dml_laptop
instead of insert or update or delete on laptop
declare
 
begin
	case 
		when inserting then
			if substr(:new.num_serie,1,1) between '0' and '1' then
				insert into laptop_f2(laptop_id,num_serie,cantidad_ram,
          caracteristicas_extras,laptop_reemplazo_id,tipo_procesador_id,
          tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,
          :new.caracteristicas_extras,:new.laptop_reemplazo_id,:new.tipo_procesador_id,
          :new.tipo_tarjeta_video_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id);
			elsif substr(:new.num_serie,1,1) between '2' and '3' then
				insert into laptop_f3(laptop_id,num_serie,cantidad_ram,
          caracteristicas_extras,laptop_reemplazo_id,tipo_procesador_id,
          tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,
          :new.caracteristicas_extras,:new.laptop_reemplazo_id,:new.tipo_procesador_id,
          :new.tipo_tarjeta_video_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id);
      elsif substr(:new.num_serie,1,1) between '4' and '5' then
				insert into laptop_f4(laptop_id,num_serie,cantidad_ram,
          caracteristicas_extras,laptop_reemplazo_id,tipo_procesador_id,
          tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,
          :new.caracteristicas_extras,:new.laptop_reemplazo_id,:new.tipo_procesador_id,
          :new.tipo_tarjeta_video_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id);
      elsif substr(:new.num_serie,1,1) between '6' and '9' then
				insert into laptop_f5(laptop_id,num_serie,cantidad_ram,
          caracteristicas_extras,laptop_reemplazo_id,tipo_procesador_id,
          tipo_tarjeta_video_id,tipo_almacenamiento_id,tipo_monitor_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,
          :new.caracteristicas_extras,:new.laptop_reemplazo_id,:new.tipo_procesador_id,
          :new.tipo_tarjeta_video_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id);
      else
          raise_application_error(-20010, 
            'Valor incorrecto para el campo num_serie: '
            || :new.num_serie
            || ' Solo se permiten números de serie cuyo primer dígito es un número ');
			end if;

      --Inserción en LAPTOP_F1
      --Inserción del binario remoto, uso de tabla temporal
			insert into ti_laptop_f1(laptop_id,foto)
			values(:new.laptop_id,:new.foto);
			--Inserción en el sitio remoto a través de la tabla temporal
			insert into laptop_f1
				select * from ti_laptop_f1
				where laptop_id = :new.laptop_id;
			delete from ti_laptop_f1
			where laptop_id = :new.laptop_id;

		when updating then
			raise_application_error(-20030, 
        'La operación update aún no está implementada');

		when deleting then 
			if substr(:old.num_serie,1,1) between '0' and '1' then
				delete from laptop_f2 where laptop_id = :old.laptop_id;
			elsif substr(:old.num_serie,1,1) between '2' and '3' then
				delete from laptop_f3 where laptop_id = :old.laptop_id;
      elsif substr(:old.num_serie,1,1) between '4' and '5' then
				delete from laptop_f4 where laptop_id = :old.laptop_id;
      elsif substr(:old.num_serie,1,1) between '6' and '9' then
				delete from laptop_f5 where laptop_id = :old.laptop_id;
      else
        raise_application_error(-20010, 
          'Valor incorrecto para el campo num_serie: '
          || :old.num_serie
          || ' Solo se permiten números de serie cuyo primer dígito es un número ');
      end if;
    
      --Eliminación en LAPTOP_F1
			--Eliminación del binario
			delete from laptop_f1 where laptop_id = :old.laptop_id;
	end case;
end;
/
show errors
