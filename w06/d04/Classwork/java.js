var http = require ('http');
var fs = require ('fs');
// instead of require 'socket' because it doesnt attach onto it like ruby
// therefore give it a variable
var server = http.createServer(function(request, response) {
  // all our stuff will go in here
  //establish the server
  console.log("Connection from client has been made")
  var path = request["url"]
  console.log("Client is attempting to reach the " + path + " route")
  if (path == "/"){
  var file = fs.readFileSync("./java.html")
  response.end(file);
  }else if (path == "/styles.css"){
    var css = fs.readFileSync("./styles.css")
  response.end(css);
  }else{
  response.end("<h1>ERROR</h1>")
  }
  // same as client.puts in ruby
});
server.listen(2000);
//now server is listening on port 2000
