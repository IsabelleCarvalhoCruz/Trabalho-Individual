var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/buscarPontuação/:id", function (req, res) {
    dashboardController.buscarPontuação(req, res);
});

router.get("/buscarDesempenho/:id", function (req, res) {
    dashboardController.buscarDesempenho(req, res);
})

module.exports = router;