--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2021
--@Descripción:     Definición de instead of trigger para la vista SUCURSAL.

create or replace trigger t_dml_sucursal
instead of insert or update or delete on sucursal
declare
 
begin
	case 
		when inserting then
			if (:new.es_venta = 1 and :new.es_taller = 1 
            and substr(:new.clave,3,2) in ('NO','EA','WS','SO')) 
        or substr(:new.clave,3,2) = 'NO' 
      then
				insert into sucursal_f1(sucursal_id,clave,es_taller,es_venta,nombre,
          latitud,longitud,url)
				values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,
        :new.nombre,:new.latitud,:new.longitud,:new.url);
			elsif :new.es_venta in (0,1) and :new.es_taller in (0,1) then
				if substr(:new.clave,3,2) = 'EA' then
          insert into sucursal_f2(sucursal_id,clave,es_taller,es_venta,nombre,
            latitud,longitud,url)
				  values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,
            :new.nombre,:new.latitud,:new.longitud,:new.url);
			  elsif substr(:new.clave,3,2) = 'WS' then
          insert into sucursal_f3(sucursal_id,clave,es_taller,es_venta,nombre,
            latitud,longitud,url)
				  values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,
            :new.nombre,:new.latitud,:new.longitud,:new.url);
        elsif substr(:new.clave,3,2) = 'SO' then
          insert into sucursal_f4(sucursal_id,clave,es_taller,es_venta,nombre,
            latitud,longitud,url)
				  values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,
            :new.nombre,:new.latitud,:new.longitud,:new.url);
        else
          raise_application_error(-20010, 
            'Valor incorrecto para el campo clave: '
            || :new.clave
            || ' Solo se permiten claves para las zonas NO, EA WS y SO ');
        end if;
      else
        raise_application_error(-20010, 
          'Valor incorrecto para el campo es_taller/es_venta: '
          || ' Solo se permiten valores de 0 o 1 para estos campos ');
			end if;

		when updating then
			raise_application_error(-20030, 
        'La operación update aún no está implementada');

		when deleting then 
			if (:old.es_venta = 1 and :old.es_taller = 1 
            and substr(:old.clave,3,2) in ('NO','EA','WS','SO')) 
        or substr(:old.clave,3,2) = 'NO' 
      then
				delete from sucursal_f1 where sucursal_id = :old.sucursal_id;
			else
				if substr(:old.clave,3,2) = 'EA' then
          delete from sucursal_f2 where sucursal_id  = :old.sucursal_id;
        elsif substr(:old.clave,3,2) = 'WS' then
          delete from sucursal_f3 where sucursal_id  = :old.sucursal_id;
        elsif substr(:old.clave,3,2) = 'SO' then
          delete from sucursal_f4 where sucursal_id  = :old.sucursal_id;
        else
          raise_application_error(-20010, 
            'Valor incorrecto para el campo clave: '
            || :old.clave
            || ' Solo se permiten claves para las zonas NO, EA WS y SO ');
        end if;
      end if;
	end case;
end;
/
show errors
