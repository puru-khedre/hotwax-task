const express = require("express");
const controller = require("../controllers/persons.controller");
const router = express.Router();

router.post("/create", controller.create);
router.get("/:id", controller.getSingle);
router.put("/:id/update", controller.updateOne);

module.exports = router;
