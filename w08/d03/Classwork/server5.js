// Every route returns an array of names, in json


var http = require("http");
var url = require("url");
var fs = require("fs")

http.createServer(function(req, res){
	var array = ["Tess", "Iris", "Nastassia", "Tejal"]
	var json = JSON.stringify(array)
	if (req.url == "/hello"){
		var file = fs.readFileSync("file.txt")

		res.end(json)
	}else if (req.url =="/yo"){

		res.end(json)
	}else if (req.url == "/styles"){

		res.end("body{color:red;}")
	}


}).listen(2000)


