create database estadoregiao;
use estadoregiao;
 
CREATE TABLE pais (
    idpais INT NOT NULL AUTO_INCREMENT,
    nomepais VARCHAR(64) NOT NULL,
    ddi SMALLINT NOT NULL,
    lingua VARCHAR(5),
    PRIMARY KEY (idpais)
);
 
CREATE TABLE regiao (
    idregiao INT NOT NULL AUTO_INCREMENT,
    idpais INT NOT NULL,
    nomeregiao VARCHAR(64),
    PRIMARY KEY (idregiao),
    CONSTRAINT fk_pais_regiao FOREIGN KEY (idpais)
        REFERENCES pais (idpais)
);
 
CREATE TABLE estado (
    idestado INT NOT NULL AUTO_INCREMENT,
    idregiao INT NOT NULL,
    nomeestado VARCHAR(64) NOT NULL,
    uf CHAR(2),
    PRIMARY KEY (idestado),
    CONSTRAINT fk_regiao_estado FOREIGN KEY (idregiao)
        REFERENCES regiao (idregiao)
);
 
CREATE TABLE mesoregiao (
    idmesoregiao INT NOT NULL AUTO_INCREMENT,
    idestado INT NOT NULL,
    nomemesoregiao VARCHAR(64),
    PRIMARY KEY (idmesoregiao),
    CONSTRAINT fk_estado_mesoregiao FOREIGN KEY (idestado)
        REFERENCES estado (idestado)
);
 
CREATE TABLE microregiao (
    idmicroregiao INT NOT NULL AUTO_INCREMENT,
    idmesoregiao INT NOT NULL,
    nomemicroregiao VARCHAR(64),
    PRIMARY KEY (idmicroregiao),
    CONSTRAINT fk_mesoregiao_microregiao FOREIGN KEY (idmesoregiao)
        REFERENCES mesoregiao (idmesoregiao)
);
 
CREATE TABLE municipio (
    idmunicipio INT NOT NULL AUTO_INCREMENT,
    idmicroregiao INT NOT NULL,
    nomemunicipio VARCHAR(64),
    PRIMARY KEY (idmunicipio),
    CONSTRAINT fk_microregiao_municipio FOREIGN KEY (idmicroregiao)
        REFERENCES microregiao (idmicroregiao)
);