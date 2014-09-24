// Route that returns Hello World in a marquee tag, but read from a file


var http = require("http");
var url = require("url");
var fs = require("fs")

http.createServer(function(req, res){
	if (req.url == "/"){
		var file = fs.readFileSync("file.txt")

		res.end(file)
	}


}).listen(2000)