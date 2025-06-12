var database = require("../database/config");

function inserirStatus() {

    var instrucaoSql = `update Curso set Status = 'Feito' where fkUsuarioCurso = 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
   inserirStatus
}
