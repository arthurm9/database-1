SELECT * FROM biblioteca.livros;

INSERT INTO livros (titulo, autor, isbn, edicao, editora, ano_publicacao, qtd_pag, genero, idioma, quantidade, disponivel) VALUES ('Sherlock Holmes', 'Arthur Conan Doyle', '978-8595080843', '1ª', 'Harper Collins', 2019, 510, 'misterio', 'Português', 4, 3);	
INSERT INTO livros (titulo, autor, isbn, edicao, editora, ano_publicacao, qtd_pag, genero, idioma, quantidade, disponivel) VALUES ('Orgulho e Preconceito', 'Jane Austen', '978-8544001820', 'Luxo', 'Martin Claret', 2018, 424, 'romance', 'Português', 2, 2);
INSERT INTO livros (titulo, autor, isbn, edicao, editora, ano_publicacao, qtd_pag, genero, idioma, quantidade, disponivel) VALUES ('Dom Quixote', 'Miguel de Cervantes', '978-8516079444', '1ª', 'Moderna', 2012, 206, 'satira', 'Português', 5, 4);
INSERT INTO livros (titulo, autor, isbn, edicao, editora, ano_publicacao, qtd_pag, genero, idioma, quantidade, disponivel) VALUES ('Sherlock Holmes', 'Arthur Conan Doyle', '978-8595080843', '1ª', 'Harper Collins', 2019, 510, 'misterio', 'Português', 4, 3);

SELECT * FROM livros;

DELETE from livros WHERE id_livro=4;

UPDATE livros SET disponivel=1 WHERE id_livro=2;

SELECT * from livros WHERE genero='satira' AND disponivel>0;