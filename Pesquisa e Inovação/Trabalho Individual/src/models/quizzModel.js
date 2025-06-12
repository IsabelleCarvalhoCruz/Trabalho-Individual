var database = require("../database/config");

function inserirPontuação(Nota, Acertos, Erros) {

    var instrucaoSql = `insert into Desempenho (Nota,Acertos,Erros,fkCursoUsuario) values
    ('${Nota}','${Acertos}','${Erros}',1);`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    inserirPontuação
}
