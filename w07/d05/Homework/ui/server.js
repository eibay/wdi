var http = require("http");
var fs = require("fs");
var url = require("url") // parses URL 

var server = http.createServer(function(req, res){
	console.log(req.url)
	if (req.url == "/" ){
		res.end(fs.readFileSync("./index.html"))

	}else if (req.url == "/style.css"){
		res.end(fs.readFileSync("./style.css"))

	}else if (req.url == "/js/game.js"){
		res.end(fs.readFileSync("./js/game.js"))

	}else if (req.url == "/favicon.ico") {
	   res.end(fs.readFileSync("./favicon.jpg"))
	}
})

server.listen(2000)