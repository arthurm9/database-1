create database pedidos;
use pedidos;

CREATE TABLE vendedor (
    id_vendedor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    idade CHAR(3),
    sexo CHAR(1),
    salario DECIMAL(10 , 2 ),
    PRIMARY KEY (id_vendedor)
);

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    cidade VARCHAR(10),
    tipo_industria CHAR(1),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE pedido (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    id_cliente INT,
    id_vendedor INT,
    valor_pedido DECIMAL(10 , 2 ),
    PRIMARY KEY (id_pedido)
);

alter table pedido
add constraint fk_pedido_cliente foreign key (id_cliente) references clientes (id_cliente) on update cascade on delete cascade;

alter table pedido
add constraint fk_pedido_vendedor foreign key (id_vendedor) references vendedor (id_vendedor) on update cascade on delete cascade;


alter table vendedor 
add email varchar (50);

alter table vendedor 
add endereco varchar (60);

alter table vendedor 
add cidade varchar (15);

alter table vendedor 
add cep varchar (10);
