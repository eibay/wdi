var http = require("http");
var url = require("url");
var fs = require("fs")

http.createServer(function(req, res){
	var array = ["Tess", "Iris", "Nastassia", "Tejal"]


	if (req.url == "/hello"){
		

		res.end(names(array))
	}else if (req.url =="/yo"){

		res.end(names(array))
	}else if (req.url == "/styles"){

		res.end("body{color:red;}")
	}


}).listen(2000)


	

function names(array){
	var json = JSON.stringify(array)
	return json
}