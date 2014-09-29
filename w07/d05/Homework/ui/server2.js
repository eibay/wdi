var http = require("http");
var url = require("url");


http.createServer(function(req, res){
	if (req.url == "/"){
		res.end("<h1>Hello World!</h1>")
	}


}).listen(2000)