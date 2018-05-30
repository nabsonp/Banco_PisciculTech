use piscicultech;
drop database piscicultech;
select * from verificacao;
select * from Verificacao where idTanque = 2 and dia = 14 and mes = 11 and ano = 17 order by nome desc;

select * from tanqesp where idTanque = 2;
select * from racao; update racao set pesototal = 500 where codigo = 1;
update TanqEsp 
set qtd = 20 
where idTanque = 2 and idEspecie = 2 ;

select * from TanqEsp where idTanque = 2;

select * from TanqEsp where (dtPeixam) between '2017-11-19' and '2017-12-08';
select * from verificacaoesp where idTanque=3;
select * from Verificacao  where idTanque = 2 and (dtVerif) between '2017-11-16' and '2017-11-19' order by nome;
select * from Tanque where (dtCriacao) between '2017-11-10' and '2017-12-08';
select * from verificacao;
select * from Verificacao  where (dtVerif) between '2017-12-1' and '2017-12-08';
select * from racao;
select * from empresa;
select * from fornecedor;
select * from funcionario;
select * from administracao;

select cnpjEmp from Administracao where cpfProprietario = '11111111111';

select cnpjEmp from Administracao where cpfProprietario = '000000000000';
select * from empresa;
insert into vendaracao values(1, 1, '2017-11-17', 5, 20, 100, 500);
insert into vendaracao values(1, 1, '2017-11-16', 5, 20, 100, 500);


select * from VendaEspecie;


select * from Verificacao where idTanque = 2 and dia = 17 and mes =11 and ano = 17 order by nome desc, hora desc;

select * from arracoamento where idTanque = 2 and dia = 20 and mes =11 and ano = 17 order by hora desc;

delete from arracoamento where idTanque = 2;

select * from Verificacao order by ano asc, mes asc, dia asc, hora asc;

select * from empresa;

select * from funcionario;

select * from pagamentofunc;

delete from tanquim where codQuimico = 1;
