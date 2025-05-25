-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

-- CREATE DATABASE aquatech;

-- USE aquatech;

-- CREATE TABLE empresa (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	razao_social VARCHAR(50),
-- 	cnpj CHAR(14),
-- 	codigo_ativacao VARCHAR(50)
-- );

-- CREATE TABLE usuario (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	nome VARCHAR(50),
-- 	email VARCHAR(50),
-- 	senha VARCHAR(50),
-- 	fk_empresa INT,
-- 	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
-- );

-- CREATE TABLE aviso (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	titulo VARCHAR(100),
-- 	descricao VARCHAR(150),
-- 	fk_usuario INT,
-- 	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
-- );

-- create table aquario (
-- /* em nossa regra de negócio, um aquario tem apenas um sensor */
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	descricao VARCHAR(300),
-- 	fk_empresa INT,
-- 	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
-- );

-- /* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

-- create table medida (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	dht11_umidade DECIMAL,
-- 	dht11_temperatura DECIMAL,
-- 	luminosidade DECIMAL,
-- 	lm35_temperatura DECIMAL,
-- 	chave TINYINT,
-- 	momento DATETIME,
-- 	fk_aquario INT,
-- 	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
-- );

-- insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
-- insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');
-- insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);
-- insert into aquario (descricao, fk_empresa) values ('Aquário de Peixe-dourado', 2);

CREATE DATABASE Fonteyn;
USE Fonteyn;

CREATE TABLE Usuario(
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45)
);

CREATE TABLE Forum(
idForum int primary key auto_increment,
titulo varchar(45),
descrição varchar(45),
mensagem varchar(45),
fkUsuario int,
constraint fkUsuario foreign key (fkUsuario) 
references Usuario(idUsuario)
);

CREATE TABLE Curso(
idCurso int primary key auto_increment,
nome varchar(45),
descrição varchar(45),
notaTotal int,
fkUsuarioCurso int,
constraint fkUsuarioCurso foreign key (fkUsuarioCurso) 
references Usuario(idUsuario)
);

CREATE TABLE Quizz(
idQuizz int primary key auto_increment,
nome varchar(45),
descrição varchar(45),
gabarito varchar(45)
);

CREATE TABLE Pontuação(
idPontuação int,
Total int,
fkUsuarioPontuação int,
fkQuizz int,
constraint fkUsuarioPontuação foreign key (fkUsuarioPontuação) 
references Usuario(idUsuario),
constraint fkQuizz foreign key (fkQuizz) 
references Quizz(idQuizz),
constraint pkPontQuizzUsuario primary key (idPontuação, fkUsuarioPontuação, fkQuizz)
);

CREATE TABLE Exercicio(
idExercicio int,
fkCurso int,
nome varchar(45),
descrição varchar(45),
notaFinal int,
constraint fkCurso foreign key (fkCurso)
references Curso(idCurso),
constraint pkCursoExercicio primary key (idExercicio, fkCurso)
);

CREATE TABLE Desempenho(
idDesempenho int,
NotaMedia int,
Status varchar(45),
constraint chkStatus check (Status in ('Feito', 'Não Feito', 'Fazendo')),
fkCursoDesempenho int,
fkCursoUsuario int, 
fkExercicio int, 
fkCursoExercicio int,
constraint fkCursoDesempenho foreign key (fkCursoDesempenho)
references Curso(idCurso),
constraint fkCursoUsuario foreign key (fkCursoUsuario)
references Curso(fkUsuarioCurso),
constraint fkExercicio foreign key (fkExercicio)
references Exercicio(idExercicio),
constraint fkCursoExercicio foreign key (fkCursoExercicio)
references Exercicio(fkCurso),
constraint pkDesempenho primary key (idDesempenho,fkCursoDesempenho,
fkCursoUsuario,fkExercicio,fkCursoExercicio)
);




