var quizzModel = require("../models/quizzModel");

function inserirPontuação(req, res) {
    var Nota = req.params.notaServer;
    var Acertos = req.params.acertosServer;
    var Erros = req.params.errosServer;

    console.log(`Inserindo dados...`);

    quizzModel.inserirPontuação(Nota, Acertos, Erros).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro em inserir os dados.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    inserirPontuação
}