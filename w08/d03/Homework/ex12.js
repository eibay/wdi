var http = require('http');
var fs = require('fs'); 

http.createServer(function(req, res) {
  if (req.url == "/hello") 
    res.end("Hello World!");
  if (req.url == "/yo")
    res.end("yo world"); 
  else {
    fs.readFile("marquee.html", {encoding: "utf-8"}, function(e, f) {
      res.end(f);
    });
  } 
}).listen(2000);