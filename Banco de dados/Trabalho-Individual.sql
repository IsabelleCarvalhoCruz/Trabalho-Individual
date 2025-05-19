CREATE DATABASE Fonteyn;
USE Fonteyn;

CREATE TABLE Usuario(
idUsuario int primary key,
nome varchar(45),
email varchar(45),
senha varchar(45)
);

CREATE TABLE Forum(
idForum int primary key,
titulo varchar(45),
descrição varchar(45),
mensagem varchar(45),
fkUsuario int,
constraint fkUsuario foreign key (fkUsuario) 
references Usuario(idUsuario)
);

CREATE TABLE Curso(
idCurso int primary key,
nome varchar(45),
descrição varchar(45),
notaTotal int,
fkUsuarioCurso int,
constraint fkUsuarioCurso foreign key (fkUsuarioCurso) 
references Usuario(idUsuario)
);

CREATE TABLE Quizz(
idQuizz int primary key,
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




