use piscicultech;

insert into Funcionario 
values('00000000000', '00000000', 'Nabson Paiva', 'funcionarios/nabson-paiva.jpg', 'M', '2000-05-01', 'nabsonp@gmail.com', md5('nabs'), '2017-02-08', null, null, 120, 'Beco Salustiano', 'Betânia', 'Manaus', 'AM', '00000000');

insert into Funcionario 
values('11111111111', '11111111', 'Nabson Func', 'funcionarios/nabson-paiva.jpg', 'M', '2000-05-01', 'nabsonpFUNC@gmail.com', md5('nabs'), '2017-02-08', null, null, 120, 'Beco Salustiano', 'Betânia', 'Manaus', 'AM', '00000000');

insert into Tanque (dtCriacao, tipo, piscicultura, situacao, revestimento, material, diaPeixam, mesPeixam, anoPeixam, capacidade, vazao, profund, largura, comp)
values ('2017-12-05', 'Escavado', 'Juvenil', false, 'PDF', 'Argamassa', 10, 08, 16, 1000, 1, 2, 5, 10);

insert into Tanque (dtCriacao, tipo, piscicultura, situacao, revestimento, material, diaPeixam, mesPeixam, anoPeixam, capacidade, vazao, profund, largura, comp)
values ('2017-12-10', 'Escavado', 'Juvenil', false, 'PDF', 'Argamassa', 10, 08, 16, 1000, 1, 2, 5, 10);

insert into Especie (nome, nomeCient, imagem, racaoDia, tamMin, tamMax, pesoMin, pesoMax, freqAlimMin, freqAlimMax, temperaturaMin, temperaturaMax, oxigenioMin, oxigenioMax, phMin, phMax, amoniaMin, amoniaMax, gasCarbonicoMin, gasCarbonicoMax, nitritoMin, nitritoMax, nitratoMin, nitratoMax, alcalMin, alcalMax)
values ('Tambaqui', 'Colossoma macropomum', 'especies/tambaqui.png', 10, 40, 100, 0, 30, 3, 3, 26, 32, null, 4, 4, 6, null, 0.46, 0.2, 4.5, null, 0.03, null, 5, 18, 22);

insert into Racao (nome, marca, pesoTotal, tamPaleteMin, tamPaleteMax, umidadeMax, proteinaMin, extratoEtereoMin, materiaFibrosaMax, materiaMineralMin, calcioMin, calcioMax, fosforoMin, vitaminaCMin) 
values ('Acqua Pesca 32', 'Matsuda', 400, 4, 6, 120, 320, 50 ,70, 110, 20, 30, 15, 300);

insert into Racao (nome, marca, pesoTotal, tamPaleteMin, tamPaleteMax, umidadeMax, proteinaMin, extratoEtereoMin, materiaFibrosaMax, materiaMineralMin, calcioMin, calcioMax, fosforoMin, vitaminaCMin) 
values ('Acqua Pesca 64', 'Matsuda', 400, 4, 6, 120, 320, 50 ,70, 110, 20, 30, 15, 300);

insert into Alimentacao values (1, 1, 'Adulta');

insert into Quimicos values (1, 'Limpa água', 500, null);

insert into Quimicos values (2, 'Hormônio', 200, null);

insert into Fornecedor values (1, 'Luciano Cunha', 'maranhao@gmail.com', 89, 'Rua Canaranas', 'Cidade Nova', 'Manaus', 'AM');

insert into vendaRacao values(2, 1, '2017-12-10', 2, 20, 40, 200);

insert into vendaRacao values(1, 1, '2017-12-14', 2, 20, 40, 200);

insert into Despesa (tipo, descricao) values ('Luz', 'Conta de luz mensal');

insert into forndesp values (1, 1, null, 300, null, 06, 09, 17);

insert into Fornecedor values (2, 'Cecilia Dutra', 'cecil@gmail.com', 12, 'Beco do amor', 'Parque 10', 'Manaus', 'AM');

insert into vendaQuimico values(2, 1, '2017-12-10', 2, 20, 40, 200);

insert into vendaQuimico values(1, 1, '2017-12-14', 2, 20, 40, 200);

insert into Despesa (tipo, descricao) values ('Agua', 'Conta de agua mensal');

insert into forndesp values (2, 2, null, 250, null, 06, 09, 17);
 
insert into Cargo values (1, 'CEO', 'FIXO', 20000, 'Dono da empresa.');

insert into Empresa values ('1', 'Piscicultura Santa Rita', 'piscistrita@gmail.com', '2017-12-01', 500, 20000, 'Rua do Saco', 'Sacolão', 'Manaus', 'AM', '00000000');

insert into administracao values ('00000000000', '1', '2017-12-01', null);

insert into Cargo values (2, 'Funcioário', 'FIXO', 1500, 'Faz todas as verificações.');

insert into Exercao values ('11111111111', 2, '2017-12-01', null); 

insert into Exercao values ('00000000000', 1, '2017-12-01', null);

insert into Equipamento values (1, 'Limpador', 'Uso', 2);

insert into Equipamento values (2, 'Gasolina', 'COMBUSTIVEL', 1);

insert into Equipamento values (3, 'Gerador', 'MAQUINA', 1);

insert into VendaEquipamento values (1,1,'2017-12-14',2, 200, 400);

insert into VendaEquipamento values (2,1,'2017-12-14',1, 300, 300);

insert into VendaEquipamento values (3,1,'2017-12-14',1, 400, 400);

insert into CONSERTO values (1, 1, '2017-12-01', NULL, '10:00:00', 09, 09, NULL, '2017-12-20', 'REVISAO', 'REVIS', 50);

insert into CONSERTO values (1, 2, '2017-12-08', NULL, '10:00:00', 09, 09, NULL, '2017-12-25', 'CONSERTO', 'REVIS', 50);

insert into CONSERTO values (1, 3, '2017-12-10', NULL, '10:00:00', 09, 09, NULL, '2017-10-27', 'REFORMA', 'REVIS', 50);

insert into imptaxalu values (1, 120, 'Fazenda', 'Fulano', '2017-12-01', 'PENDENTE');

insert into PagamentoFunc values ('00000000000', '1', '2017-01-01', 200);