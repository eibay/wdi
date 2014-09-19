var http = require('http');
var fs = require('fs');
var url = require('url');
var client = require('request');


var server = http.createServer(function(request, res){
  var msg = "";
  var path = request["url"];
  var parsedRequest = url.parse(request.url, true);
  var query = parsedRequest.pathname.split("=")[1];

if (parsedRequest.pathname == "/"){
  msg = fs.readFileSync('./index.html');
  res.end(msg);
} else if (parsedRequest.pathname == "/main.js"){
  msg = fs.readFileSync('./main.js');
  res.end(msg);
} else if (path == "/query=" + query){
  client.get('http://localhost:4567/' + encodeURIComponent(query), function(err, res2, body) {
      res.end(body);
    });
  }

else if (parsedRequest.pathname == "/query"){
  debugger;
  console.log("I'm here.")
  var query = parsedRequest.query.title;
  console.log('query');
  res.end(body);
}

debugger;
console.log("Didn't catch any routes");
console.log(path);
console.log(parsedRequest);
console.log(parsedRequest.pathname)
console.log(query);

 res.end(msg);
});

server.listen(2000);
