CREATE DATABASE ifood;
use ifood;

CREATE TABLE cliente (
    id_cli INT NOT NULL,
    cliente VARCHAR(150) DEFAULT NULL,
    email VARCHAR(150) DEFAULT NULL,
    fone VARCHAR(150) DEFAULT NULL,
    PRIMARY KEY (id_cli)
);
   
CREATE TABLE entregador (
    id_ent INT NOT NULL,
    entregador VARCHAR(150) DEFAULT NULL,
    fone VARCHAR(150) DEFAULT NULL,
    placamoto VARCHAR(150) DEFAULT NULL,
    PRIMARY KEY (id_ent)
);
   
CREATE TABLE comida (
    id_com INT NOT NULL,
    comida VARCHAR(150) DEFAULT NULL,
    preco VARCHAR(150) DEFAULT NULL,
    PRIMARY KEY (id_com)
);
   
CREATE TABLE pedido (
    id_ped INT NOT NULL,
    entrada VARCHAR(150) DEFAULT NULL,
    adicional VARCHAR(150) DEFAULT NULL,
    bebida VARCHAR(150) DEFAULT NULL,
    PRIMARY KEY (id_ped)
);

   
  
   