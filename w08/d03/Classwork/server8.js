var http = require("http");
var url = require("url");
var fs = require("fs")

http.createServer(function(req, res){



	if (req.url == "/names"){


		res.end(names())
	}else if (req.url =="/people"){

		res.end(names())
	}else if (req.url == "/styles"){

		res.end("body{color:red;}")
	}


}).listen(2000)


	

function names(){
	var hash = [{name: "Tess", age: 26 }, {name: "Iris", age: 22 },{name: "Nastassia", age: 25}]
	return Object.keys(hash)
}







