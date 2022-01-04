--@Autor:           Héctor E. Cabrera Beltrán & Alejandro Rivera Nagano
--@Fecha creación:  26/12/2021
--@Descripción:     Eliminación y creación del usuario.

declare
  v_count number(1,0);
begin
  select count(*) into v_count from dba_users where lower(username) = 'ilap_bdd';
  if v_count > 0 then
    execute immediate 'drop user ilap_bdd cascade';
  else
    dbms_output.put_line('El usuario ilap_bdd no existe');
  end if;
end;
/

Prompt Creando al usuario ilap_bdd
create user ilap_bdd identified by ilap_bdd quota unlimited on users;

Prompt Otorgando privilegios
grant create session, create table, create sequence, create procedure, 
  create view, create synonym, create database link, create trigger, 
  create any directory 
to ilap_bdd;
