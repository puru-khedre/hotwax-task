const express = require("express");
const bodyParser = require("body-parser");
const personRouter = require("./routes/persons.routes");
const app = express();

const port = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.post("/ping", (req, res) => {
  console.log({ ...req.body });
  res.send("pong");
});

app.use("/persons", personRouter);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
