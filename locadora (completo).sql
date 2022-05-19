create database locadora1;
use locadora1;

CREATE TABLE cidade (
    cidade_id SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pais_id INT NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE loja (
    loja_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    gerente_id INT NOT NULL,
    endereco_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE endereco (
    endereco_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    endereco VARCHAR(50) NOT NULL,
    endereco2 VARCHAR(50),
    bairro VARCHAR(30) NOT NULL,
    cidade_id SMALLINT NOT NULL,
    cep VARCHAR(10),
    telefone VARCHAR(20) NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE filme_categoria (
    filme_id INT NOT NULL,
    categoria_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (filme_id , categoria_id)
);

CREATE TABLE categoria (
    categoria_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL,
    ultima_atualizacao DATE
);

CREATE TABLE inventario (
    inventario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    filme_id INT NOT NULL,
    loja_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE pais (
    pais_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(50) NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE idioma (
    idioma_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE filme_ator (
    ator_id INT NOT NULL,
    filme_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (ator_id , filme_id)
);

CREATE TABLE ator (
    ator_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(45) NOT NULL,
    ultimo_nome VARCHAR(45) NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE filme_texto (
    filme_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE funcionario (
    funcionario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(45) NOT NULL,
    ultimo_nome VARCHAR(45) NOT NULL,
    endereco_id INT NOT NULL,
    foto VARCHAR(200),
    email VARCHAR(50),
    loja_id INT NOT NULL,
    ativo INT NOT NULL,
    usuario VARCHAR(16) NOT NULL,
    senha VARCHAR(40),
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE aluguel (
    aluguel_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_de_aluguel DATE NOT NULL,
    inventario_id INT NOT NULL,
    cliente_id INT NOT NULL,
    data_da_devolucao DATE,
    funcionario_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE filme (
    filme_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao VARCHAR(150),
    ano_de_lancamento DATE,
    idioma_id INT NOT NULL,
    idioma_original_id INT,
    duracao_da_locacao INT NOT NULL,
    preco_da_locacao DECIMAL(4 , 2 ) NOT NULL,
    duracao_do_filme INT,
    custo_de_substituicao DECIMAL(5 , 2 ),
    classificacao VARCHAR(10),
    recursos_especiais VARCHAR(10),
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE cliente (
    cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    loja_id INT NOT NULL,
    primeiro_nome VARCHAR(45) NOT NULL,
    ultimo_nome VARCHAR(45) NOT NULL,
    email VARCHAR(50),
    endereco_id INT NOT NULL,
    ativo INT NOT NULL,
    data_criacao DATE NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

CREATE TABLE pagamento (
    pagamento_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    aluguel_id INT,
    valor DECIMAL(5 , 2 ) NOT NULL,
    data_de_pagamento DATE NOT NULL,
    ultima_atualizacao DATE NOT NULL
);

alter table filme_categoria add CONSTRAINT fk_filmecategoria_categoria 
FOREIGN KEY (categoria_id) REFERENCES categoria (categoria_id);

ALTER TABLE filme_categoria ADD CONSTRAINT fk_filme_categoria_filme 
FOREIGN KEY(filme_id) REFERENCES filme(filme_id);

alter table cidade add constraint fk_cidade_pais
foreign key (pais_id) references pais (pais_id);

ALTER TABLE pagamento ADD CONSTRAINT fk_pagamento_cliente 
FOREIGN KEY(cliente_id) REFERENCES cliente(cliente_id);

ALTER TABLE pagamento ADD CONSTRAINT fk_pagamento_funcionario 
FOREIGN KEY(funcionario_id) REFERENCES funcionario(funcionario_id);

ALTER TABLE pagamento ADD CONSTRAINT fk_pagamento_aluguel 
FOREIGN KEY(aluguel_id) REFERENCES aluguel(aluguel_id);

ALTER TABLE cliente ADD CONSTRAINT fk_cliente_loja 
FOREIGN KEY(loja_id) REFERENCES loja(loja_id);

ALTER TABLE cliente ADD CONSTRAINT fk_cliente_endereco 
FOREIGN KEY(endereco_id) REFERENCES endereco(endereco_id);

ALTER TABLE filme ADD CONSTRAINT fk_filme_idioma 
FOREIGN KEY(idioma_id) REFERENCES idioma(idioma_id);

ALTER TABLE funcionario ADD CONSTRAINT fk_funcionario_endereco 
FOREIGN KEY(endereco_id) REFERENCES endereco(endereco_id);

ALTER TABLE funcionario ADD CONSTRAINT fk_funcionario_loja 
FOREIGN KEY(loja_id) REFERENCES loja(loja_id);

ALTER TABLE endereco ADD CONSTRAINT fk_endereco_cidade 
FOREIGN KEY(cidade_id) REFERENCES cidade(cidade_id);

ALTER TABLE loja ADD CONSTRAINT fk_loja_endereco 
FOREIGN KEY(endereco_id) REFERENCES endereco(endereco_id);

ALTER TABLE inventario ADD CONSTRAINT fk_inventario_filme 
FOREIGN KEY(filme_id) REFERENCES filme(filme_id);

ALTER TABLE inventario ADD CONSTRAINT fk_inventario_loja 
FOREIGN KEY(loja_id) REFERENCES loja(loja_id);

ALTER TABLE filme_ator ADD CONSTRAINT fk_filme_ator_ator 
FOREIGN KEY(ator_id) REFERENCES ator(ator_id);

ALTER TABLE filme_ator ADD CONSTRAINT fk_filme_ator_filme 
FOREIGN KEY(filme_id) REFERENCES filme(filme_id);