--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2021
--@Descripción:     Definición de instead of trigger para la vista 
--                  SERVICIO_LAPTOP (HECBBDD_S1).

create or replace trigger t_dml_servicio_laptop
instead of insert or update or delete on servicio_laptop
declare
 	v_count number;
begin
	case 
		when inserting then
			--Verifica si hay correspondencia local para evitar acceso remoto
			select count(*) into v_count
			from sucursal_f1
			where sucursal_id = :new.sucursal_id;
			if v_count > 0 then
        --Inserción local (SERVICIO_LAPTOP_F1)
				--insert into servicio_laptop_f1(num_servicio,laptop_id,importe,diagnostico,
          --factura,sucursal_id)
				--values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,
          --:new.factura,sucursal_id);
        --SERVICIO_LAPTOP_F1
        --Inserción del binario, uso de tabla temporal
        insert into ti_servicio_laptop_f1(num_servicio,laptop_id,importe,
          diagnostico,factura,sucursal_id)
        values(:new.num_servicio,:new.laptop_id,:new.importe,
          :new.diagnostico,:new.factura,:new.sucursal_id);
        --Inserción en el sitio remoto a través de la tabla temporal
        insert into servicio_laptop_f1
          select * from ti_servicio_laptop_f1
          where num_servicio = :new.num_servicio 
          and laptop_id = :new.laptop_id;
        delete from ti_servicio_laptop_f1
        where num_servicio = :new.num_servicio
        and laptop_id = :new.laptop_id;
			--Inserción remota
			else 
				select count(*) into v_count
				from sucursal_f2
				where sucursal_id = :new.sucursal_id;
				if v_count > 0 then
          --SERVICIO_LAPTOP_F2
					--Inserción del binario remoto, uso de tabla temporal
          insert into ti_servicio_laptop_f2(num_servicio,laptop_id,importe,
            diagnostico,factura,sucursal_id)
          values(:new.num_servicio,:new.laptop_id,:new.importe,
            :new.diagnostico,:new.factura,:new.sucursal_id);
          --Inserción en el sitio remoto a través de la tabla temporal
          insert into servicio_laptop_f2
            select * from ti_servicio_laptop_f2
            where num_servicio = :new.num_servicio 
            and laptop_id = :new.laptop_id;
          delete from ti_servicio_laptop_f2
          where num_servicio = :new.num_servicio
          and laptop_id = :new.laptop_id;
			 	else
          select count(*) into v_count
          from sucursal_f3
          where sucursal_id = :new.sucursal_id;
          if v_count > 0 then
            --SERVICIO_LAPTOP_F3
            --Inserción del binario remoto, uso de tabla temporal
            insert into ti_servicio_laptop_f3(num_servicio,laptop_id,importe,
              diagnostico,factura,sucursal_id)
            values(:new.num_servicio,:new.laptop_id,:new.importe,
              :new.diagnostico,:new.factura,:new.sucursal_id);
            --Inserción en el sitio remoto a través de la tabla temporal
            insert into servicio_laptop_f3
              select * from ti_servicio_laptop_f3
              where num_servicio = :new.num_servicio 
              and laptop_id = :new.laptop_id;
            delete from ti_servicio_laptop_f3
            where num_servicio = :new.num_servicio
            and laptop_id = :new.laptop_id;
          else
            select count(*) into v_count
            from sucursal_f4
            where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
              --SERVICIO_LAPTOP_F4
              --Inserción del binario remoto, uso de tabla temporal
              insert into ti_servicio_laptop_f4(num_servicio,laptop_id,importe,
                diagnostico,factura,sucursal_id)
              values(:new.num_servicio,:new.laptop_id,:new.importe,
                :new.diagnostico,:new.factura,:new.sucursal_id);
              --Inserción en el sitio remoto a través de la tabla temporal
              insert into servicio_laptop_f4
                select * from ti_servicio_laptop_f4
                where num_servicio = :new.num_servicio 
                and laptop_id = :new.laptop_id;
              delete from ti_servicio_laptop_f4
              where num_servicio = :new.num_servicio
              and laptop_id = :new.laptop_id;
            else
              raise_application_error(-20020, 
                'Error de integridad para el campo sucursal_id: '
                ||  :new.sucursal_id
                || ' No se encontró el registro padre en fragmentos');
            end if;
          end if;   
			 	end if;
			end if;

		when updating then
      raise_application_error(-20030, 
        'La operación update aún no está implementada');
		
    when deleting then 
      --Verifica si hay correspondencia local para evitar acceso remoto
			select count(*) into v_count
			from sucursal_f1
			where sucursal_id = :old.sucursal_id;
			if v_count > 0 then
        --Eliminación local (SERVICIO_LAPTOP_F1)
				delete from servicio_laptop_f1
        where num_servicio = :old.num_servicio
        and laptop_id = :old.laptop_id;	
			--Eliminación remota
			else 
				select count(*) into v_count
				from sucursal_f2
				where sucursal_id = :old.sucursal_id;
				if v_count > 0 then
          --Eliminación local (SERVICIO_LAPTOP_F2)
          delete from servicio_laptop_f2
          where num_servicio = :old.num_servicio
          and laptop_id = :old.laptop_id;
			 	else
          select count(*) into v_count
          from sucursal_f3
          where sucursal_id = :old.sucursal_id;
          if v_count > 0 then
            --Eliminación local (SERVICIO_LAPTOP_F3)
            delete from servicio_laptop_f3
            where num_servicio = :old.num_servicio
            and laptop_id = :old.laptop_id;
          else
            select count(*) into v_count
				    from sucursal_f4
            where sucursal_id = :old.sucursal_id;
            if v_count > 0 then
              --Eliminación local (SERVICIO_LAPTOP_F4)
              delete from servicio_laptop_f4
              where num_servicio = :old.num_servicio
              and laptop_id = :old.laptop_id;
            else
              raise_application_error(-20020, 
                'Error de integridad para el campo sucursal_id: '
                ||  :old.sucursal_id
                || ' No se encontró el registro padre en fragmentos');
            end if;
          end if;   
			 	end if;
			end if;
	end case;
end;
/
show errors
