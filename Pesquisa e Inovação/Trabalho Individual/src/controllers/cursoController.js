var cursoModel = require("../models/cursoModel");

function inserirStatus(req, res) {

    console.log(`Alterando dados...`);

    cursoModel.inserirStatus().then(function (resultado) {
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
    inserirStatus
}