create database bd_insert;
use bd_insert;

CREATE TABLE categoria (
    categoria_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25)
);

create table cliente (
	idCliente int not null primary key auto_increment,
	nome varchar(100),
    endereco varchar(80),
    numero varchar(30),
    bairro varchar(80),
    cidade varchar(100),
    estado char(2),
    telefone varchar(20)
);

insert into cliente (nome, endereco, numero, bairro, cidade, estado, telefone) 
values ('Arthur Marques', 'José Alencar', '25', 'Rosa Cruz', 'Tubarão', 'SC', '66 982478297');

insert into cliente (nome, endereco, numero, bairro, cidade, estado, telefone) 
values ('João Carlos', 'Victor Lopos', '98', 'Vicenza', 'Macatuba', 'SP', '15 992478497');

insert into cliente (nome, endereco, numero, bairro, cidade, estado, telefone) 
values ('Junior Ferreira', 'Arnaldo Sacoman', '376', 'Jd. Vitória', 'Botucatu', 'SP', '14 998263297');

insert into cliente (nome, endereco, numero, bairro, cidade, estado, telefone) 
values ('Matheus Henrique', 'Tapajós', '321', 'Itamaraty', 'Lençóis Paulista', 'SP', '14 9924799927');

insert into cliente (nome, endereco, numero, bairro, cidade, estado, telefone) 
values ('Maria Clara', 'José Bonifácio', '863', 'Bela Vista', 'Lençóis Paulista', 'SP', '14 992427357');

select * from cliente;