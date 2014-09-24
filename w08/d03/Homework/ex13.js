var http = require('http');
var fs = require('fs'); 

function functionify() {
  var value = ["freddy kruger", "gouda", "the fold", "America"];
  return JSON.stringify(value); 
}


http.createServer(function(req, res) {
  var namesJSON = functionify(); 
  res.end(namesJSON);  
}).listen(2000);