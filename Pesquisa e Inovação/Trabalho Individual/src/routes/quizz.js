var express = require("express");
var router = express.Router();

var quizzController = require("../controllers/quizzController");

router.post("/inserirPontuação/:idUsuario", function (req, res) {
    quizzController.inserirPontuação(req, res);
});

module.exports = router;