const express = require("express");
const partyController = require("../controllers/party.controller");
const router = express.Router();

router.get("/", partyController.getAll);
router.post("/create", partyController.create);
router.put("/:id/update", partyController.updateOne);

module.exports = router;
