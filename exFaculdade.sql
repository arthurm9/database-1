-- Exemplo de banco tirado de https://github.com/paulorievrs/mysql4noobs

create database faculdade;
use faculdade;

create table curso (
	id_curso int not null auto_increment,
    nome_curso varchar(100),
    primary key (id_curso)
);

create table aluno (
	id_matricula int not null auto_increment,
    nome varchar(100),
    telefone varchar(11),
    id_curso int not null, 
    
    primary key (id_matricula),
    constraint fk_aluno_curso foreign key (id_curso) references curso (id_curso)
);

-- Inserindo os dados 
insert into curso (id_curso, nome_curso) 
values (01, 'Ciência da Computação'),
(02, 'Analise e Desenvolvimento de Sistemas'),
(03, 'Engenharia da Computação'),
(04, 'Engenharia de Software'),
(05, 'Sistemas de Informação');

insert into aluno (id_matricula, nome, telefone, id_curso) 
values (01, 'Jose Neutro', '11999999999', 01),
(02, 'Jose Amazias', '11999999990', 02),
(03, 'Jose Oliveira', '11999999980', 03),
(04, 'Pedro Amazias', '11999999900', 03),
(05, 'Lucas Fernandes', '11999999970', 05),
(06, 'Paulo Oliveira', '11999999960', 04),
(07, 'Rodrigo Silva', '11999999770', 04),
(08, 'Gilberto Alous', '11999999550', 01),
(09, 'Daniel Reis', '11999999940', 02);

-- Selecionando valores específicos 
SELECT nome_curso FROM curso WHERE nome_curso LIKE '%Sistemas%';

SELECT * FROM aluno WHERE id_matricula = 02;

-- Alterando valores usando UPDATE
UPDATE aluno SET telefone = '31999999999' WHERE id_matricula = 03; -- o WHERE especifica o aluno e o campo em que a alteração deve ser feita.

UPDATE curso SET nome_curso = 'Ciências da computação' WHERE id_curso = 01;

-- Deletando Valores 
DELETE FROM aluno WHERE id_matricula = 6334; -- Se não fosse usado o WHERE, todos os alunos seriam deletados.
DELETE FROM CURSO WHERE codigocurso = 1; -- É mostrado um erro pois para deletar um curso é necessário excluir todos os alunos dele.
