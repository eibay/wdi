var http = require('http');
var fs = require("fs");

var server = http.createServer(function(req, res) {

  var path = req.url;

  console.log(path);

  if (path == "/joke") {
    var joke = ["programming is easy", "The depressing thing about tennis is that no matter how good I get, I'll never be as good as a wall.", "I wear a necklace, cause I wanna know when I'm upside down."]
    res.end(JSON.stringify(joke))
  } else if (path == "/") {
  	var index = fs.readFileSync("./index.erb")
  res.end(index)}
})

server.listen(2000);


