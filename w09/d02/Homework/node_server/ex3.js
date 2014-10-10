var http = require('http');
var fs = require('fs');

  var server = http.createServer(function(request, response) {

      var path = request["url"];

      if (path == "/") {
          var html = fs.readFileSync("./ex3.html")
          response.end(html);
      } else {
        response.end("<h1>ERROR</h1>")
    };
  });

server.listen(2000);
