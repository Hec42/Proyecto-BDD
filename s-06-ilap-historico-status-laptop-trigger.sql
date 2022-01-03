--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  02/01/2021
--@Descripción:     Definición de instead of trigger para la vista 
--                  HISTORICO_STATUS_LAPTOP.

create or replace trigger t_dml_historico_status_laptop
instead of insert or update or delete on historico_status_laptop
declare
 
begin
	case 
		when inserting then
			if :new.fecha_status <= to_date('31/12/2009','DD/MM/YYYY') then
				insert into historico_status_laptop_f1(historico_status_laptop_id,
          fecha_status,laptop_id,status_laptop_id)
				values(:new.historico_status_laptop_id,:new.fecha_status,:new.laptop_id,
          :new.status_laptop_id);
			else
				insert into historico_status_laptop_f2(historico_status_laptop_id,
          fecha_status,laptop_id,status_laptop_id)
				values(:new.historico_status_laptop_id,:new.fecha_status,:new.laptop_id,
          :new.status_laptop_id);
			end if;

		when updating then
			raise_application_error(-20030, 
        'La operación update aún no está implementada');

		when deleting then 
			if :old.fecha_status <= to_date('31/12/2009','DD/MM/YYYY') then
				delete from historico_status_laptop_f1
        where historico_status_laptop_id = :old.historico_status_laptop_id;
			else
				delete from historico_status_laptop_f2
        where historico_status_laptop_id = :old.historico_status_laptop_id;
      end if;
	end case;
end;
/
show errors
