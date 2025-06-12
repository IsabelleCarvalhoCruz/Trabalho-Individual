-- CRIANDO O BANCO DE DADOS PARA O PROJETO
CREATE DATABASE Fonteyn;
USE Fonteyn;

-- CRIANDO AS TABELAS
CREATE TABLE Usuario(
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45)
);

CREATE TABLE Forum(
idForum int primary key auto_increment,
titulo varchar(45),
descrição varchar(200),
fkUsuario int,
constraint fkUsuario foreign key (fkUsuario) 
references Usuario(idUsuario)
);

CREATE TABLE Blog(
idBlog int primary key auto_increment,
titulo varchar(45),
descrição varchar(200),
fkUsuarioBlog int,
constraint fkUsuarioBlog foreign key (fkUsuarioBlog)
references Usuario(idUsuario)
);

CREATE TABLE Curso(
idCurso int primary key auto_increment,
nome varchar(45),
descrição varchar(200),
fkUsuarioCurso int,
Status varchar(45),
constraint chkStatus check (Status in ('Feito', 'Não Feito')),
constraint fkUsuarioCurso foreign key (fkUsuarioCurso) 
references Usuario(idUsuario)
);

CREATE TABLE Exercicio(
idExercicio int,
fkCurso int,
nome varchar(45),
descrição varchar(200),
constraint fkCurso foreign key (fkCurso)
references Curso(idCurso),
constraint pkCursoExercicio primary key (idExercicio, fkCurso)
);

CREATE TABLE Desempenho(
idDesempenho int,
Nota int,
Acertos int,
Erros int,
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

-- DANDO SELECT PARA VERIFICAR SE OS DADOS DO LOGIN E CADASTRO ESTÃO SENDO INSERIDOS
select * from Usuario;

-- INSERINDO DADOS 
insert into Curso (nome, descrição, Status) values
('Diferentes técnicas de ballet','Já pensou em ser bailarina mas não sabe por onde começar? Aprenda um pouco mais sobre aqui!', 'Não Feito'),
('Alongamento e Fortalecimento', 'No mundo do ballet ter sua força e elasticidade em dia é muito importante para execução de passos mais complexos, saiba como manter sua saúde em dia!', 'Não Feito');

insert into Exercicio (idExercicio, nome, descrição, fkCurso) values
(1, 'Diferentes técnicas de ballet','Exercicios para você aprofundar seus conhecimentos sobre a técnica do ballet!', 1),
(2, 'Alongamento e Fortalecimento','Exercicios para você manter sua saúde em dia!', 2);

insert into Blog(titulo,descrição, fkUsuarioBlog) values
('A História do Ballet','Saiba um pouco mais sobre o surgimento do ballet!', 1),
('Metodologias do ballet','Saiba diferenciar as metodologias de ballet, onde surgiram e sua importância!', 1),
('Variações de Repertório', 'Saiba um pouco mais sobre as diferentes encenações e variações criadas no mundo do ballet!', 1);


-- DANDO SELECTS NO PROJETO

-- SELECT PARA VER A NOTA TOTAL DO USUARIO
select AVG(Nota) as Nota_Média from Desempenho join Curso 
on Desempenho.fkCursoDesempenho = Curso.idCurso;

-- SELECT PARA VER A QUANTIDADE DE ERROS E ACERTOS
select Acertos, Erros from Desempenho join Curso 
on Desempenho.fkCursoDesempenho = Curso.idCurso;

-- SELECT PARA VER PONTUAÇÃO MAXIMA
select MAX(Nota) as Nota_Máxima from Desempenho join Curso  
on Desempenho.fkCursoDesempenho = Curso.idCurso 
join Usuario on Usuario.idUsuario = Curso.fkUsuarioCurso;

-- SELECT PARA VER ESTADO ATUAL DA ATIVIDADE
select Status from Curso;

-- ALTERANDO DADOS DE STATUS
update Curso set Status = 'Feito' where fkUsuarioCurso = 1;

-- PESQUISANDO DADOS 
select * from Blog where Descrição like '%';

-- DANDO INSERT DE DADOS DO QUIZZ
insert into Desempenho (Nota,Acertos,Erros,fkCursoUsuario) values
('','','',1);

