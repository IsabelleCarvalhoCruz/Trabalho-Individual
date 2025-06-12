var dashboardModel = require("../models/dashboardModel");

function buscarDesempenho(req, res) {
    var idDesempenho = req.params.idDesempenho;
    var Nota = req.params.Nota;
    var fkUsuario = req.params.fkUsuario;

    console.log(`Recuperando as ultimas medidas`);

    dashboardModel.buscarDesempenho(idDesempenho, Nota, fkUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarPontuação(req, res) {

    var idDesempenho = req.params.idDesempenho;
    var Acertos = req.params.Acertos;
    var Erros = req.params.Erros;
    var fkUsuario = req.params.fkUsuario;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarPontuação(idDesempenho, Acertos, Erros, fkUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
   buscarDesempenho,
   buscarPontuação
}