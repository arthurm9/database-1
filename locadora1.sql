create database locadora;
use locadora;

CREATE TABLE idioma (
    idioma_id INT NOT NULL AUTO_INCREMENT,
    nome CHAR(20) NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (idioma_id)
);

CREATE TABLE filme (
    filme_id INT NOT NULL AUTO_INCREMENT,
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
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (filme_id),
    CONSTRAINT fk_filme_idioma FOREIGN KEY (idioma_id)
        REFERENCES idioma (idioma_id),
    CONSTRAINT fk_filme_idiomaoriginal FOREIGN KEY (idioma_original_id)
        REFERENCES idioma (idioma_id)
);

CREATE TABLE pais (
    pais_id INT NOT NULL AUTO_INCREMENT,
    pais VARCHAR(50) NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (pais_id)
);

CREATE TABLE cidade (
    cidade_id INT NOT NULL AUTO_INCREMENT,
    pais_id INT NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (cidade_id),
    CONSTRAINT fk_pais_cidade FOREIGN KEY (pais_id)
        REFERENCES pais (pais_id)
);

CREATE TABLE endereco (
    endereco_id INT NOT NULL AUTO_INCREMENT,
    endereco VARCHAR(50) NOT NULL,
    endereco2 VARCHAR(50),
    bairro VARCHAR(20) NOT NULL,
    cidade_id INT NOT NULL,
    cep VARCHAR(10),
    telefone VARCHAR(20) NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (endereco_id),
    CONSTRAINT fk_endereco_cidade FOREIGN KEY (cidade_id)
        REFERENCES cidade (cidade_id)
);

CREATE TABLE loja (
    loja_id INT NOT NULL AUTO_INCREMENT,
    endereco_id INT NOT NULL,
    gerente_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (loja_id),
    CONSTRAINT fk_loja_endereco FOREIGN KEY (endereco_id)
        REFERENCES endereco (endereco_id)
);

CREATE TABLE cliente (
    cliente_id INT NOT NULL AUTO_INCREMENT,
    loja_id INT NOT NULL,
    primeiro_nome VARCHAR(45) NOT NULL,
    ultimo_nome VARCHAR(45) NOT NULL,
    email VARCHAR(50),
    endereco_id INT NOT NULL,
    ativo INT NOT NULL,
    data_criacao DATE NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (cliente_id),
    CONSTRAINT fk_cliente_loja FOREIGN KEY (loja_id)
        REFERENCES loja (loja_id),
    CONSTRAINT fk_cliente_endereco FOREIGN KEY (endereco_id)
        REFERENCES endereco (endereco_id)
);

CREATE TABLE funcionario (
    funcionario_id INT NOT NULL AUTO_INCREMENT,
    primeiro_nome VARCHAR(45) NOT NULL,
    ultimo_nome VARCHAR(45) NOT NULL,
    endereco_id INT NOT NULL,
    foto BLOB,
    email VARCHAR(50),
    loja_id INT NOT NULL,
    ativo INT NOT NULL,
    usuario VARCHAR(16) NOT NULL,
    senha VARCHAR(40),
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (funcionario_id),
    CONSTRAINT fk_funcionario_endereco FOREIGN KEY (endereco_id)
        REFERENCES endereco (endereco_id),
    CONSTRAINT fk_funcionario_loja FOREIGN KEY (loja_id)
        REFERENCES loja (loja_id)
);

CREATE TABLE filme_texto (
    filme_id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (filme_id)
);

CREATE TABLE ator (
    ator_id INT NOT NULL AUTO_INCREMENT,
    primeiro_nome VARCHAR(45) NOT NULL,
    ultimo_nome VARCHAR(45) NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (ator_id)
);

CREATE TABLE filme_ator (
    ator_id INT NOT NULL,
    filme_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (ator_id , filme_id),
    CONSTRAINT fk_filmeator_ator FOREIGN KEY (ator_id)
        REFERENCES ator (ator_id),
    CONSTRAINT fk_filmeator_filme FOREIGN KEY (filme_id)
        REFERENCES filme (filme_id)
);

CREATE TABLE categoria (
    categoria_id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (categoria_id)
);

CREATE TABLE filme_categoria (
    filme_id INT NOT NULL,
    categoria_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (filme_id , categoria_id),
    CONSTRAINT fk_filmecategoria_filme FOREIGN KEY (filme_id)
        REFERENCES filme (filme_id),
    CONSTRAINT fk_filmecategoria_categora FOREIGN KEY (categoria_id)
        REFERENCES categoria (categoria_id)
);

CREATE TABLE inventario (
    inventario_id INT NOT NULL AUTO_INCREMENT,
    filme_id INT NOT NULL,
    loja_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (inventario_id),
    CONSTRAINT fk_inventario_filme FOREIGN KEY (filme_id)
        REFERENCES filme (filme_id),
    CONSTRAINT fk_inventario_loja FOREIGN KEY (loja_id)
        REFERENCES loja (loja_id)
);



CREATE TABLE aluguel (
    aluguel_id INT NOT NULL AUTO_INCREMENT,
    data_de_aluguel DATE NOT NULL,
    inventario_id INT NOT NULL,
    cliente_id INT NOT NULL,
    data_da_devolucao DATE,
    funcionario_id INT NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (aluguel_id),
    CONSTRAINT fk_aluguel_inventario FOREIGN KEY (inventario_id)
        REFERENCES inventario (inventario_id),
    CONSTRAINT fk_aluguel_cliente FOREIGN KEY (cliente_id)
        REFERENCES cliente (cliente_id),
    CONSTRAINT fk_aluguel_funcionario FOREIGN KEY (funcionario_id)
        REFERENCES funcionario (funcionario_id)
);

CREATE TABLE pagamento (
    pagamento_id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    aluguel_id INT,
    valor DECIMAL(5 , 2 ) NOT NULL,
    data_de_pagamento DATE NOT NULL,
    ultima_atualizacao DATE NOT NULL,
    PRIMARY KEY (pagamento_id),
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (cliente_id)
        REFERENCES cliente (cliente_id),
    CONSTRAINT fk_pagamento_funcionario FOREIGN KEY (funcionario_id)
        REFERENCES funcionario (funcionario_id),
    CONSTRAINT fk_pagamento_aluguel FOREIGN KEY (aluguel_id)
        REFERENCES aluguel (aluguel_id)
);