var http = require('http');

http.createServer(function(req, res) {
  res.end("<marquee>Hello World!</marquee>");
}).listen(2000);