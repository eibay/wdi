var http = require("http");
var url = require("url");


http.createServer(function(req, res){
	if (req.url == "/"){
		res.end("Hello World!")
	}


}).listen(2000)