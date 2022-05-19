create schema imobiliaria1;
use imobiliaria1;

create table proprietario(
idprop int unsigned not null primary key auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf varchar(30) not null,
fone varchar(20) not null
);

INSERT INTO proprietario(nome, email, cpf, fone)
VALUES ("Bernardo Carlos Eduardo Silveira", "bernardocarlose3@stetnet.com.br","368.741.459-08", "(67) 98425-5571");
INSERT INTO proprietario(nome, email, cpf, fone)
VALUES ("Elisa Andreia Bruna Rezende", "eelisaandree@compuativa.com.br","789.164.762-32", "(92) 98627-8996");
INSERT INTO proprietario(nome, email, cpf, fone)
VALUES ("Otávio Luan Santos", "ootavioluansantos@elconsultoria.com.br","846.119.108-06", "(69) 98648-6260");
INSERT INTO proprietario(nome, email, cpf, fone)
VALUES ("Mário Cauã Ferreira", "mariocauaferreira-72@igoralcantara.com.br","170.493.085-52", "(68) 98613-2240");
INSERT INTO proprietario(nome, email, cpf, fone)
VALUES ("Joana Fernanda Tânia da Cruz", "bernardocarlose3@stetnet.com.br","992.449.532-26", "(51) 98199-4650");


create table imovel(
idimov int unsigned not null primary key auto_increment,
tipo varchar(20) not null,
endereco varchar(191),
numero int,
cidade varchar(191),
descricao varchar(255)
);

INSERT INTO imovel(tipo, endereco, numero, cidade, descricao)
VALUES ("casa", "Rua Maria Cícera Lourenço Barbosa","405", "Palmeira dos Índios", "azul");
INSERT INTO imovel(tipo, endereco, numero, cidade, descricao)
VALUES ("apartamento", "Rua Alto Alegre","164", "Boa Vista", "verde");
INSERT INTO imovel(tipo, endereco, numero, cidade, descricao)
VALUES ("casa", "Rua Antônio Serpa do Amaral","762", "Ji-Paraná", "rosa");
INSERT INTO imovel(tipo, endereco, numero, cidade, descricao)
VALUES ("chácara", "Rua Antônio Serpa do Amaral","762", "Aracaju", "roxa");
INSERT INTO imovel(tipo, endereco, numero, cidade, descricao)
VALUES ("chácara", "Travessa Cícero Duarte","568", "Picos", "amarela");


create table corretor(
idcor int unsigned not null primary key auto_increment,
nome varchar(50) not null,
cpf varchar(30) not null,
email varchar(100) not null,
fone varchar(20) not null
);

INSERT INTO corretor(nome, cpf, email, fone)
VALUES ("Samuel Ricardo Alves", "628.627.578-96", "samuelricardoalves@pichler.com.br", "(11) 99446-9580");
INSERT INTO corretor(nome, cpf, email, fone)
VALUES ("Sebastião Renato Elias Gonçalves", "055.903.139-45", "sebastiaore@vitaonline.com.br", "(81) 98435-6215");
INSERT INTO corretor(nome, cpf, email, fone)
VALUES ("Bryan Luan Monteiro", "790.228.034-81", "bryanluanmonteiro-77@eanac.com.br", "(65) 98760-1387");
INSERT INTO corretor(nome, cpf, email, fone)
VALUES ("Yuri Raul Gustavo de Paula", "556.892.481-34", "yuriraulgustavodepaula-98@.com.br", "(65) 99678-3730");
INSERT INTO corretor(nome, cpf, email, fone)
VALUES ("Allana Daniela Raimunda Nunes", "274.571.283-79", "allanadanielar@nogueiramoura.adv.br", "(54) 98133-1127");


create table inquilino(
idinq int unsigned not null primary key auto_increment,
inquilino varchar(50) not null,
cpf varchar(30) not null,
fone varchar(20) not null,
fiador varchar(50) not null
);

INSERT INTO inquilino(inquilino, cpf, fone, fiador)
VALUES ("Lorena Natália Marli Ribeiro", "218.518.866-64", "(91) 99346-4376", "jose");
INSERT INTO inquilino(inquilino, cpf, fone, fiador)
VALUES ("Rebeca Heloise Cristiane Ribeiro", "030.513.324-10", "(82) 98113-8096", "marcos");
INSERT INTO inquilino(inquilino, cpf, fone, fiador)
VALUES ("Fátima Stefany Aparício", "802.958.624-83", "(85) 98421-8795", "jose");
INSERT INTO inquilino(inquilino, cpf, fone, fiador)
VALUES ("Beatriz Nair Eloá Peixoto", "382.396.751-74", "(92) 98464-6656", "Rocha");
INSERT INTO inquilino(inquilino, cpf, fone, fiador)
VALUES ("Eduarda Hadassa Elaine da Paz", "038.377.395-46", "(51) 98848-63646", "Paulo");

create table aluguel(
id_aluguel int unsigned not null primary key auto_increment,
dtinicio datetime not null,
dttermino datetime not null,
valor decimal(7,2),
prop_id int unsigned not null,
imov_id int unsigned not null,
cor_id int unsigned not null,
inq_id int unsigned not null
);

ALTER TABLE aluguel ADD CONSTRAINT fk_idprop FOREIGN KEY (prop_id) REFERENCES proprietario ( idprop ) ;
ALTER TABLE aluguel ADD CONSTRAINT fk_idimov FOREIGN KEY (imov_id ) REFERENCES imovel ( idimov );
ALTER TABLE aluguel ADD CONSTRAINT fk_idcor FOREIGN KEY (cor_id ) REFERENCES corretor ( idcor );
ALTER TABLE aluguel ADD CONSTRAINT fk_idinq FOREIGN KEY (inq_id ) REFERENCES inquilino ( idinq );

INSERT INTO aluguel(dtinicio,dttermino, valor, prop_id, imov_id,cor_id, inq_id)
VALUES (STR_TO_DATE( "10/05/2021", "%m/%d/%Y" ),STR_TO_DATE( "11/10/2022", "%m/%d/%Y" ),"1200", "2", "1", "4", "4");
INSERT INTO aluguel(dtinicio,dttermino, valor, prop_id, imov_id,cor_id, inq_id)
VALUES (STR_TO_DATE( "08/08/2019", "%m/%d/%Y" ),STR_TO_DATE( "08/08/2021", "%m/%d/%Y" ), "2300","5", "2", "2", "3");
INSERT INTO aluguel(dtinicio,dttermino, valor, prop_id, imov_id,cor_id, inq_id)
VALUES (STR_TO_DATE( "07/10/2020", "%m/%d/%Y" ), STR_TO_DATE( "07/10/2021", "%m/%d/%Y" ), "785", "1", "3", "3", "5");
INSERT INTO aluguel(dtinicio,dttermino, valor, prop_id, imov_id,cor_id, inq_id)
VALUES (STR_TO_DATE( "07/08/2021", "%m/%d/%Y" ), STR_TO_DATE( "07/19/2023", "%m/%d/%Y" ),"3000", "3", "5", "1", "1");
INSERT INTO aluguel(dtinicio,dttermino, valor, prop_id, imov_id,cor_id, inq_id)
VALUES (STR_TO_DATE( "05/10/2021", "%m/%d/%Y" ), STR_TO_DATE( "08/19/2020", "%m/%d/%Y" ), "2100", "4", "3", "2", "1");
INSERT INTO aluguel(dtinicio,dttermino, valor, prop_id, imov_id,cor_id, inq_id)
VALUES (STR_TO_DATE( "05/10/2021", "%m/%d/%Y" ), STR_TO_DATE( "01/25/2018", "%m/%d/%Y" ), "2100", "4", "3", "2", "1");
INSERT INTO aluguel(dtinicio,dttermino, valor, prop_id, imov_id,cor_id, inq_id)
VALUES (STR_TO_DATE( "09/26/2021", "%m/%d/%Y" ), STR_TO_DATE( "11/26/2022", "%m/%d/%Y" ), "2100", "2", "3", "2", "1");
INSERT INTO aluguel(dtinicio,dttermino, valor, prop_id, imov_id,cor_id, inq_id)
VALUES (STR_TO_DATE( "11/18/2020", "%m/%d/%Y" ),STR_TO_DATE( "07/30/2021", "%m/%d/%Y" ), "1200","1", "2", "2", "3");





-- EXERCÍCIOS

-- 1.qual o nome e email dos corretores que alugaram casa

select corretor.nome, corretor.email, imovel.tipo
from aluguel 
inner join corretor	
on aluguel.cor_id = corretor.idcor
inner join imovel 		
on aluguel.imov_id = imovel.idimov
where imovel.tipo = 'casa';

-- 2.qual o nome e telefone dos inquilinos que alugaram apartamento

select inquilino.inquilino, inquilino.fone, imovel.tipo
from aluguel 
inner join inquilino
on aluguel.inq_id = inquilino.idinq
inner join imovel 		
on aluguel.imov_id = imovel.idimov
where imovel.tipo = 'apartamento';

-- 3.listar o nome dos fiadores de casa ou apartamentos

select inquilino.fiador, imovel.tipo
from inquilino
inner join aluguel
on aluguel.inq_id = inquilino.idinq
inner join imovel
on aluguel.imov_id = imovel.idimov
where imovel.tipo in('apartamento', 'casa');

-- 4.qual o nome dos corretos que alugaram chacaras

select corretor.nome
from corretor
inner join aluguel
on aluguel.cor_id = corretor.idcor
inner join imovel
on aluguel.imov_id = imovel.idimov
where imovel.tipo = 'chacará';

-- 5.qual a descrição das casas alugadas

select imovel.descricao
from imovel
inner join aluguel	
on aluguel.imov_id = imovel.idimov
where imovel.tipo = 'casa';

-- 6.mostrar todos os dados da tabela aluguel (proprietário, imovel, corretor e inquilino)
--   mas somente dos contratos com vencimento até dezembro de 2021

select proprietario.nome as "proprietário", imovel.tipo, corretor.nome as "corretor", inquilino.inquilino
from aluguel
inner join proprietario 	
on aluguel.prop_id = proprietario.idprop
inner join imovel
on aluguel.imov_id = imovel.idimov
inner join corretor
on aluguel.cor_id = corretor.idcor
inner join inquilino
on aluguel.inq_id = inquilino.idinq
where aluguel.dttermino < '2021-12-31' and aluguel.dttermino >= now();


-- 7.mostrar todos os dados da tabela aluguel (proprietário, imovel, corretor e inquilino)
--   mas somente dos contratos vencidos

select proprietario.nome as "proprietário", imovel.tipo, corretor.nome as "corretor", inquilino.inquilino
from aluguel
inner join proprietario 	
on aluguel.prop_id = proprietario.idprop
inner join imovel
on aluguel.imov_id = imovel.idimov
inner join corretor
on aluguel.cor_id = corretor.idcor
inner join inquilino
on aluguel.inq_id = inquilino.idinq
where aluguel.dttermino < now();

-- 8.mostrar todos os dados da tabela aluguel (proprietário, imovel, corretor e inquilino)
--   mas somente dos contratos ativos ou seja não vencidos

select proprietario.nome as "proprietário", imovel.tipo, corretor.nome as "corretor", inquilino.inquilino
from aluguel
inner join proprietario 	
on aluguel.prop_id = proprietario.idprop
inner join imovel
on aluguel.imov_id = imovel.idimov
inner join corretor
on aluguel.cor_id = corretor.idcor
inner join inquilino
on aluguel.inq_id = inquilino.idinq
where aluguel.dttermino >= now();

-- 9.mostrar os dados de inquilinos que alugaram apartamento com valores de aluguel 
--   entre 1000 e 1300

select inquilino.inquilino, inquilino.cpf, inquilino.fone, inquilino.fiador
from inquilino
inner join aluguel
on aluguel.inq_id = inquilino.idinq
inner join imovel
on aluguel.imov_id = imovel.idimov
where imovel.tipo = "apartamento" and (aluguel.valor between '1000' and '1300');

-- 10.mostrar todos os dados da tabela aluguel (proprietário, imovel, corretor e inquilino)
--    SOMENTE dos contratos ativos do tipo casa e com valores de aluguel entre 1000 a 2000 

select proprietario.nome as "proprietário", imovel.tipo, corretor.nome as "corretor", inquilino.inquilino
from aluguel
inner join proprietario 	
on aluguel.prop_id = proprietario.idprop
inner join imovel
on aluguel.imov_id = imovel.idimov
inner join corretor
on aluguel.cor_id = corretor.idcor
inner join inquilino
on aluguel.inq_id = inquilino.idinq
where imovel.tipo = "casa" and (aluguel.valor between '1000' and '2000') and aluguel.dttermino >= now();

