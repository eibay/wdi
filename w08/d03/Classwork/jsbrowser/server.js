var http = require('http')

var fs = require('fs')

var server = http.createServer(function(request, response){

    var path = request["url"];

  if (path == '/names'){

    response.end("<html><body><h3>Timoor Kurdi</h3></body</html>")

} else if (path == "/names/2") {

     var html = fs.readFileSync("./index.html")
     response.end(html);

}

  };

});

server.listen(2000);