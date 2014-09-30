var http = require('http')
var fs = require('fs');
 
var server = http.createServer(function(req, res) {
  var path = req.url
  if (path == "/joke") {
    var joke = ["joke1", "joke2", "joke3"]
    joke = JSON.stringify(joke);
    res.end(joke);
 
  }
  else if (path == "/") {
    res.end(fs.readFileSync('./index.html'));
 
  }
})
 
server.listen(2000);