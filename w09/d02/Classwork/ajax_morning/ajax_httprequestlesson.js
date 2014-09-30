var http = require('http')
 
var server = http.createServer(function(req, res) {
  var path = req.url
  if (path == "/joke") {
    var joke = 'programming is easy'
    res.end(JSON.stringify(joke))
  }
})
 
server.listen(2000);


// api - a set of rules that lets 1 software talk to another