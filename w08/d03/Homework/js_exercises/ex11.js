var http = require('http');
var fs = require('fs'); 

http.createServer(function(req, res) {
  fs.readFile("marquee.html", {encoding: "utf-8"}, function(e, f) {
    console.log(f); 
    res.end(f);
  }); 
}).listen(2000);