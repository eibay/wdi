var http = require('http')
var fs = require('fs');

var server = http.createServer(function(req, res) {
  var path = req.url
  if (path == "/joke") {
    var joke = ['programming is easy', 'programming is fun', 'we have very little homework']
    console.log("Accessed /joke");
    res.end(JSON.stringify(joke))
  } else if (path == "/") {
  	res.end(fs.readFileSync('./index.html'));
  }
})

server.listen(2000);