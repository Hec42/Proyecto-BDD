--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2021
--@Descripción:     Definición de instead of trigger para la vista 
--                  LAPTOP_INVENTARIO.

create or replace trigger t_dml_laptop_inventario
instead of insert or update or delete on laptop_inventario
declare
 
begin
	case 
		when inserting then
      --Inserción en LAPTOP_INVENTARIO_F1
		  insert into laptop_inventario_f1(laptop_id,rfc_cliente,num_tarjeta)
			values(:new.laptop_id,:new.rfc_cliente,:new.num_tarjeta);

      --Inserción en LAPTOP_INVENTARIO_F2
		  insert into laptop_inventario_f2(laptop_id,fecha_status,sucursal_id,
        status_laptop_id)
			values(:new.laptop_id,:new.fecha_status,:new.sucursal_id,:new.status_laptop_id);

		when updating then
			raise_application_error(-20030, 
        'La operación update aún no está implementada');

		when deleting then 
      --Eliminación en LAPTOP_INVENTARIO_F1
			delete from laptop_inventario_f1 where laptop_id = :old.laptop_id;

      --Eliminación en LAPTOP_INVENTARIO_F2
			delete from laptop_inventario_f2 where laptop_id = :old.laptop_id;
	end case;
end;
/
show errors
