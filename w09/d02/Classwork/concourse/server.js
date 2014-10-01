var http = require('http')
var fs = require('fs');
 
var server = http.createServer(function(req, res) {
  var path = req.url
  if (path == "/joke") {
    var joke = "programming is easy"
    res.end(JSON.stringify(joke));
 
  }
  else if (path == "/") {
    res.end(fs.readFileSync('./index.html'));
 	var xhr = XMLHttpRequest();

 	xhr
 	xhr.open('get', 
  }
})
 
server.listen(2000);