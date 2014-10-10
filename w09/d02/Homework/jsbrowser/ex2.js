var http = require('http');

var fs = require('fs');

var server = http.createServer(function(request, response){

var path = request["url"];

if(path == "/") {
  response.end("<html><script src='file.js'</script></html>")
} else if (path == "/names") {
    var html =("<html><body><h3>Tim, Angus Young</h3></html></body>")
    response.end(html)
} else if (path == "/file.js") {
  var js = fs.readFileSync("./scripts.js")
  response.end(js)
}

});

server.listen(2000);

