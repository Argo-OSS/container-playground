const express = require("express");
const app = express();
const port = 8080;

app.get("/healthcheck", (req, res) => {
  res.send("healthcheck");
});

app.get("/api/v1/mg5566", (req, res) => {
  res.send("mg5566");
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
