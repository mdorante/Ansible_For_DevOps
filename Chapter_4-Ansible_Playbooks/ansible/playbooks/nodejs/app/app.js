// Load the Express module
const express = require("express");
let app = express();

// Respond to requests for '/' with 'Hello World'
app.get("/", function (req, res) {
  res.send("Ansible rocks!");
});

// Listen on port 80
app.listen(80);
console.log("Express server started and listening on port 80...");
