var http = require('http');

var server = http.createServer(function(req, res){
  res.end('<h1>Hello World</h1>')
});

server.listen(2000);
