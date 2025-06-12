var database = require("../database/config");

function buscarPontuação() {

    var instrucaoSql = `select Nota from Desempenho join Curso 
    on Desempenho.fkCursoDesempenho = Curso.idCurso where fkCursoUsuario = 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarDesempenho() {

    var instrucaoSql = `select Acertos, Erros from Desempenho join Curso 
on Desempenho.fkCursoDesempenho = Curso.idCurso where fkCursoUsuario = 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarStatus(){
     var instrucaoSql = `select Acertos, Erros from Desempenho join Curso 
on Desempenho.fkCursoDesempenho = Curso.idCurso where fkCursoUsuario = 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarPontuação,
    buscarDesempenho,
    buscarStatus
}
