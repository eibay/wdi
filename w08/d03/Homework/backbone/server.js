var http = require('http');
var url = require('url');
var request = require('request');
var fs = require('fs');

var server = http.createServer(function(req, response) {
  console.log(req.url);

  if (req.url == "/") {
    var html = fs.readFileSync("./index.html");
    response.end(html);
  }
  else if (req.url == "/newyork.js") {
    response.end(fs.readFileSync("./newyork.js"));
  }
  else if (req.url == "/favicon.ico") {
    response.end(fs.readFileSync("./favicon.ico"));
  }


});
server.listen(2000);
