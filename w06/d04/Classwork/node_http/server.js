var http = require('http');
var fs = require('fs');

var server = http.createServer(function(req, res){

  // debugger
  console.log("Connection from client has been made")

  var path = req["url"];
  if (path == "/"){
    res.end(fs.readFileSync('./views/index.html'));
  } else if (path == "/style.css"){
    res.end(fs.readFileSync('./stylesheets/style.css'));
  } else {
    res.end("<h1>404 ERROR!</h1>");
  }


});

server.listen(2000);
