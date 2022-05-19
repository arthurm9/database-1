create database biblioteca;
use biblioteca;

CREATE TABLE livros (
    id_livro INT NOT NULL AUTO_INCREMENT,
    titulo TEXT,
    autor TEXT,
    isbn VARCHAR(50),
    edicao VARCHAR(50),
    editora VARCHAR(50),
    ano_publicacao YEAR,
    qtd_pag INT,
    genero ENUM('poesia', 'soneto', 'romance', 'fábula', 'novela', 'cronica', 'conto', 'ensaio', 'biografia', 'chicklit', 'fantasia', 'distopia', 'ficcao cientifica', 'horror', 'fantastica', 'infanto juvenil', 'young adult', 'autoajuda', 'negocios', 'tecnologia', 'hq', 'aventura', 'suspense', 'satira', 'misterio'),
    idioma VARCHAR(50),
    quantidade INT,
    disponivel INT,
    PRIMARY KEY (id_livro)
)

