// Change the hello world route to '/hello'
// Add a route '/yo' that says "yo world" 
// Add CSS to style the hello route, but no CSS in a file

var http = require("http");
var url = require("url");
var fs = require("fs")

http.createServer(function(req, res){
	if (req.url == "/hello"){
		var file = fs.readFileSync("file.txt")

		res.end(file)
	}else if (req.url =="/yo"){

		res.end("Yo World!")
	}else if (req.url == "/styles"){

		res.end("body{color:red;}")
	}


}).listen(2000)