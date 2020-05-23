USE universidade_u;

delimiter $$
create procedure proc_ifelse()
comment 'exemplo de uso dos condicionais ifelse'
begin
    declare idade int;
    set idade = (select 
		timestampdiff(year, data_nascimento, curdate()) 
	from
		aluno 
    where idaluno = 5);

    if idade >= 0 and idade <= 15 then
		select 'Criança';
	elseif idade > 15 and idade <= 29 then
		select 'jovem';
	elseif idade > 29 and idade <= 59 then
		select 'Adulto';
	else
		select 'Idoso';
	end if;
end
$$
delimiter ;

drop procedure universidade_u.proc_ifelse;
call proc_ifelse();