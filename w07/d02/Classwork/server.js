var http = require('http');
var fs = require('fs');

var server = http.createServer(function(req, res){
  var path = req['url'];
  var msg = "";

  if (path = "/"){
    var msg = fs.readFileSync('./tree.html');
    res.end(msg);
  }
  res.end(msg);
})

server.listen(2000);
