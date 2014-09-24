var http = require('http');
var fs = require('fs'); 

http.createServer(function(req, res) {
  var names = ["freddy kruger", "gouda", "the fold", "America"];
  var namesJSON = JSON.stringify(names); 
  res.end(namesJSON);  
}).listen(2000);