var http = require("http");
var url = require("url");
var fs = require("fs")

http.createServer(function(req, res){



	if (req.url == "/hello"){
		console.log(names())

		res.end(names())
	}else if (req.url =="/yo"){

		res.end(names())
	}else if (req.url == "/styles"){

		res.end("body{color:red;}")
	}


}).listen(2000)


	

function names(){
	var hash = [{name: "Tess", age: 26 }, {name: "Iris", age: 22 },{name: "Nastassia", age: 25}]
	return JSON.stringify(hash)
}







