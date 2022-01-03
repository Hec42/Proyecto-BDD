--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2021
--@Descripción:     Definición de instead of trigger para la vista 
--                  SUCURSAL_TALLER (HECBBDD_S1).

create or replace trigger t_dml_sucursal_taller
instead of insert or update or delete on sucursal_taller
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
        --Inserción local (SUCURSAL_TALLER_F1)
				insert into sucursal_taller_f1(sucursal_id,dia_descanso,telefono_atencion)
				values(:new.sucursal_id,:new.dia_descanso,:new.telefono_atencion);	
			--Inserción remota
			else 
				select count(*) into v_count
				from sucursal_f2
				where sucursal_id = :new.sucursal_id;
				if v_count > 0 then
          --SUCURSAL_TALLER_F2
					insert into sucursal_taller_f2(sucursal_id,dia_descanso,telefono_atencion)
				  values(:new.sucursal_id,:new.dia_descanso,:new.telefono_atencion);
			 	else
          select count(*) into v_count
          from sucursal_f3
          where sucursal_id = :new.sucursal_id;
          if v_count > 0 then
            --SUCURSAL_TALLER_F3
            insert into sucursal_taller_f3(sucursal_id,dia_descanso,telefono_atencion)
            values(:new.sucursal_id,:new.dia_descanso,:new.telefono_atencion);
          else
            select count(*) into v_count
            from sucursal_f4
            where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
              --SUCURSAL_TALLER_F4
              insert into sucursal_taller_f4(sucursal_id,dia_descanso,telefono_atencion)
              values(:new.sucursal_id,:new.dia_descanso,:new.telefono_atencion);
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
        --Eliminación local (SUCURSAL_TALLER_F1)
				delete from sucursal_taller_f1 where sucursal_id = :old.sucursal_id;	
			--Eliminación remota
			else 
				select count(*) into v_count
				from sucursal_f2
				where sucursal_id = :old.sucursal_id;
				if v_count > 0 then
          --SUCURSAL_TALLER_F2
					delete from sucursal_taller_f2 where sucursal_id = :old.sucursal_id;
			 	else
          select count(*) into v_count
          from sucursal_f3
          where sucursal_id = :old.sucursal_id;
          if v_count > 0 then
            --SUCURSAL_TALLER_F3
            delete from sucursal_taller_f3 where sucursal_id = :old.sucursal_id;
          else
            select count(*) into v_count
				    from sucursal_f4
            where sucursal_id = :old.sucursal_id;
            if v_count > 0 then
              --SUCURSAL_TALLER_F4
              delete from sucursal_taller_f4 where sucursal_id = :old.sucursal_id;
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
