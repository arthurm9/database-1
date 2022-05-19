create database filme1;
use filme1;
 
CREATE TABLE pais (
    idPais INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomePais VARCHAR(50)
);
 
CREATE TABLE genero (
    idGenero INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeGenero VARCHAR(50)
);
 
CREATE TABLE tipoAtuacao (
    idTipoAtuacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeTipoAtuacao VARCHAR(50)
);
 
CREATE TABLE filme (
    idFilme INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tituloOriginal VARCHAR(200),
    tituloBrasil VARCHAR(200),
    sinopse VARCHAR(8000),
    duracao INT,
    dataEstreia DATE
);
 
CREATE TABLE pessoa (
    idPessoa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idPais INT NOT NULL,
    nomePessoa VARCHAR(60),
    CONSTRAINT fk_pais_pessoa FOREIGN KEY (idPais)
        REFERENCES pais (idPais)
);
 
CREATE TABLE paisFilme (
    idFilme INT NOT NULL,
    idPais INT NOT NULL,
    CONSTRAINT fk_filme_paisFilme FOREIGN KEY (idFilme)
        REFERENCES filme (idFilme),
    CONSTRAINT fk_pais_paisFilme FOREIGN KEY (idPais)
        REFERENCES pais (idPais),
    PRIMARY KEY (idFilme , idPais)
);
 
CREATE TABLE generoFilme (
    idFilme INT NOT NULL,
    idGenero INT NOT NULL,
    CONSTRAINT fk_filme_generoFilme FOREIGN KEY (idFilme)
        REFERENCES filme (idFilme),
    CONSTRAINT fk_genero_generoFilme FOREIGN KEY (idGenero)
        REFERENCES genero (idGenero),
    PRIMARY KEY (idFilme , idGenero)
);
 
CREATE TABLE equipe (
    idPessoa INT NOT NULL,
    IdFilme INT NOT NULL,
    idTipoAtuacao INT NOT NULL,
    CONSTRAINT fk_pessoa_equipe FOREIGN KEY (idPessoa)
        REFERENCES pessoa (idPessoa),
    CONSTRAINT fk_filme_equipe FOREIGN KEY (idFilme)
        REFERENCES filme (idFilme),
    CONSTRAINT fk_tipoAtuacao_equipe FOREIGN KEY (idTipoAtuacao)
        REFERENCES tipoAtuacao (idTipoAtuacao),
    PRIMARY KEY (idPessoa , idFilme , idTipoAtuacao)
);