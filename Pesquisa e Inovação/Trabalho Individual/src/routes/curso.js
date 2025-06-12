var express = require("express");
var router = express.Router();

var cursoController = require("../controllers/cursoController");

router.post("/inserirStatus", function (req, res) {
    cursoController.inserirStatus(req, res);
});

module.exports = router;