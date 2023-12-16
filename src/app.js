require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");

const app = express();

const personRouter = require("./routes/persons.routes");
const authRouter = require("./routes/auth.routes");
const partyRouter = require("./routes/party.routes");
const authMiddleware = require("./middleware/auth");

const port = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.post("/ping", (req, res) => {
  console.log({ ...req.body });
  res.send("pong");
});

app.use("/auth", authRouter);
app.use("/party", authMiddleware.authCheck, partyRouter);
app.use("/persons", authMiddleware.authCheck, personRouter);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
