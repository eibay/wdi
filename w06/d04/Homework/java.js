var http = require ('http');
var fs = require ('fs');

var server = http.createServer(function(request, response){
var path = request["url"]
var pathsplit = path.split("/")

if (path.indexOf("?") == 6){
var params = path.split("?")[1].split("=")
}// name = 0 and Jeff = 1
var method = request["method"]
  if (path == "/" && method == "GET"){
  var file = fs.readFileSync("./views/index.html")
  response.end(file)
} else if (path == "/cast" && pathsplit.length < 3 && method == "GET"){
  var file = fs.readFileSync("./views/cast.html")
  response.end(file)
}else if (pathsplit[1] == "cast" && pathsplit[2]== "random" && method == "GET"){
  var file = fs.readFileSync("./views/randomcast.html")
  response.end(file)
} else if (path.indexOf("?") == 6 && params[0] == "name" && params.length == 2 && method == "GET"){
 response.end("Hey "+ params[1])
}



});

server.listen(2000)