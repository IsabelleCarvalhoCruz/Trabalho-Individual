var pesquisaModel = require("../models/pesquisaModel");

function pesquisa(res) {
    console.log(`Encontrando dados...`);

    pesquisaModel.pesquisa().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro em alterar os dados.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    pesquisa
}