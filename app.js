const express = require("express");
const app = express();
const PORT = process.env.PORT || 8080;

app.get("/", (req, res) => {
  res.status(200).sendFile("index.html");
});

app.get("/probability", (req, res) => {
  res.status(200).sendFile("probability.html");
});

app.get("/calculus", (req, res) => {
  res.status(200).sendFile("calculus.html");
});

app.listen(PORT, () => {
  console.log(`It's alive on http://localhost:${PORT}`);
});
