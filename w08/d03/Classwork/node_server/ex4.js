var http = require('http');
var fs = require('fs');

  var server = http.createServer(function(request, response) {

      var path = request["url"];

      if (path == "/hello") {
          var html = fs.readFileSync("./ex4.html")
          response.end(html);
      } else {
        response.end("<h1>ERROR</h1>")
    };
  });

server.listen(2000);
